(define-char
  '((name		. "NO-BREAK SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (->fullwidth
     ((name		  . "fullwidth no-break space")
      (=jis-x0213-1-2000  . #x2922)	; �����
      ))
    (latin-iso8859-1	. #xA0)	; �����
    (latin-iso8859-2	. #xA0)	; �����
    (latin-iso8859-3	. #xA0)	; �����
    (latin-iso8859-4	. #xA0)	; �����
    (greek-iso8859-7	. #xA0)	; �����
    (hebrew-iso8859-8	. #xA0)	; �����
    (cyrillic-iso8859-5 . #xA0)	; �����
    (latin-iso8859-9	. #xA0)	; �����
    (latin-tcvn5712	. #xA0)	; �����
    (ucs		. #x00A0)	;  
    ))
(define-char
  '((name		. "fullwidth no-break space")
    (=>ucs		. #x00A0)	;  
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "NO-BREAK SPACE")
      (ucs		  . #x00A0)	;  
      ))
    (=jis-x0213-1-2000	. #x2922)	; �����
    (ucs-jis		. #x00A0)	; �����
    ))
(define-char
  '((name		. "INVERTED EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth inverted exclamation mark")
      (korean-ksc5601	  . #x222E)	; �����
      (japanese-jisx0212  . #x2242)	; �����
      ))
    (latin-iso8859-1	. #xA1)	; �����
    (latin-iso8859-9	. #xA1)	; �����
    (ucs		. #x00A1)	; ¡
    ))
(define-char
  '((name		. "fullwidth inverted exclamation mark")
    (=>ucs		. #x00A1)	; ¡
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "INVERTED EXCLAMATION MARK")
      (ucs		  . #x00A1)	; ¡
      ))
    (korean-ksc5601	. #x222E)	; �����
    (japanese-jisx0212	. #x2242)	; �����
    (=jis-x0213-1-2000	. #x2923)	; �����
    (ucs-jis		. #x00A1)	; �����
    ))
(define-char
  '((name		. "CENT SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CENT SIGN")
      (ucs		  . #xFFE0)	; ￠
      ))
    (latin-iso8859-1	. #xA2)	; �����
    (hebrew-iso8859-8	. #xA2)	; �����
    (latin-iso8859-9	. #xA2)	; �����
    (ucs		. #x00A2)	; ¢
    ))
(define-char
  '((name		. "POUND SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH POUND SIGN")
      (ucs		  . #xFFE1)	; ￡
      ))
    (latin-iso8859-1	. #xA3)	; �����
    (latin-iso8859-3	. #xA3)	; �����
    (greek-iso8859-7	. #xA3)	; �����
    (hebrew-iso8859-8	. #xA3)	; �����
    (latin-iso8859-9	. #xA3)	; �����
    (ucs		. #x00A3)	; £
    ))
(define-char
  '((name		. "CURRENCY SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth currency sign")
      (chinese-gb2312	  . #x2168)	; �����
      (korean-ksc5601	  . #x2234)	; �����
      (japanese-jisx0212  . #x2270)	; �����
      ))
    (latin-iso8859-1	. #xA4)	; �����
    (latin-iso8859-2	. #xA4)	; �����
    (latin-iso8859-3	. #xA4)	; �����
    (latin-iso8859-4	. #xA4)	; �����
    (hebrew-iso8859-8	. #xA4)	; �����
    (latin-iso8859-9	. #xA4)	; �����
    (ucs		. #x00A4)	; ¤
    ))
(define-char
  '((name		. "fullwidth currency sign")
    (=>ucs		. #x00A4)	; ¤
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "CURRENCY SIGN")
      (ucs		  . #x00A4)	; ¤
      ))
    (chinese-gb2312	. #x2168)	; �����
    (korean-ksc5601	. #x2234)	; �����
    (japanese-jisx0212	. #x2270)	; �����
    (=jis-x0213-1-2000	. #x2924)	; �����
    (ucs-jis		. #x00A4)	; �����
    ))
(define-char
  '((name		. "YEN SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH YEN SIGN")
      (ucs		  . #xFFE5)	; ￥
      ))
    (latin-jisx0201	. #x5C)	; �����
    (latin-iso8859-1	. #xA5)	; �����
    (hebrew-iso8859-8	. #xA5)	; �����
    (latin-iso8859-9	. #xA5)	; �����
    (ucs		. #x00A5)	; ¥
    ))
(define-char
  '((name		. "BROKEN BAR")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH BROKEN BAR")
      (ucs		  . #xFFE4)	; ￤
      ))
    (latin-iso8859-1	. #xA6)	; �����
    (greek-iso8859-7	. #xA6)	; �����
    (hebrew-iso8859-8	. #xA6)	; �����
    (latin-iso8859-9	. #xA6)	; �����
    (ucs		. #x00A6)	; ¦
    ))
(define-char
  '((name		. "SECTION SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth section sign")
      (chinese-gb2312	  . #x216C)	; �����
      (korean-ksc5601	  . #x2157)	; �����
      (chinese-cns11643-1 . #x2170)	; �����
      ))
    (latin-iso8859-1	. #xA7)	; �����
    (latin-iso8859-2	. #xA7)	; �����
    (latin-iso8859-3	. #xA7)	; �����
    (latin-iso8859-4	. #xA7)	; �����
    (greek-iso8859-7	. #xA7)	; �����
    (hebrew-iso8859-8	. #xA7)	; �����
    (cyrillic-iso8859-5 . #xFD)	; �����
    (latin-iso8859-9	. #xA7)	; �����
    (ucs		. #x00A7)	; §
    ))
(define-char
  '((name		. "fullwidth section sign")
    (=>ucs		. #x00A7)	; §
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "SECTION SIGN")
      (ucs		  . #x00A7)	; §
      ))
    (chinese-gb2312	. #x216C)	; �����
    (=jis-x0208		. #x2178)	; �����
    (korean-ksc5601	. #x2157)	; �����
    (chinese-cns11643-1 . #x2170)	; �����
    (chinese-big5	. #xA1B1)	; ������
    (ucs-jis		. #x00A7)	; �����
    ))
(define-char
  '((name		. "DIAERESIS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0308)
    (->fullwidth
     ((name		  . "fullwidth diaeresis")
      (chinese-gb2312	  . #x2127)	; �����
      (korean-ksc5601	  . #x2127)	; �����
      ))
    (latin-iso8859-1	. #xA8)	; �����
    (latin-iso8859-2	. #xA8)	; �����
    (latin-iso8859-3	. #xA8)	; �����
    (latin-iso8859-4	. #xA8)	; �����
    (greek-iso8859-7	. #xA8)	; �����
    (hebrew-iso8859-8	. #xA8)	; �����
    (latin-iso8859-9	. #xA8)	; �����
    (ucs		. #x00A8)	; ¨
    ))
(define-char
  '((name		. "fullwidth diaeresis")
    (=>ucs		. #x00A8)	; ¨
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "DIAERESIS")
      (ucs		  . #x00A8)	; ¨
      ))
    (chinese-gb2312	. #x2127)	; �����
    (=jis-x0208		. #x212F)	; �����
    (korean-ksc5601	. #x2127)	; �����
    (chinese-big5-eten	. #xC6D8)	; ������
    (=jef-china3	. #x81AA)	; �����
    (ucs-jis		. #x00A8)	; �����
    ))
(define-char
  '((name		. "COPYRIGHT SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth copyright sign")
      (japanese-jisx0212  . #x226D)	; �����
      ))
    (latin-iso8859-1	. #xA9)	; �����
    (greek-iso8859-7	. #xA9)	; �����
    (hebrew-iso8859-8	. #xA9)	; �����
    (latin-iso8859-9	. #xA9)	; �����
    (ucs		. #x00A9)	; ©
    ))
(define-char
  '((name		. "fullwidth copyright sign")
    (=>ucs		. #x00A9)	; ©
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "COPYRIGHT SIGN")
      (ucs		  . #x00A9)	; ©
      ))
    (japanese-jisx0212	. #x226D)	; �����
    (=jis-x0213-1-2000	. #x2926)	; �����
    (ucs-jis		. #x00A9)	; �����
    ))
(define-char
  '((name		. "FEMININE ORDINAL INDICATOR")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x0061)
    (->fullwidth
     ((name		  . "fullwidth feminine ordinal indicator")
      (korean-ksc5601	  . #x2823)	; �����
      (japanese-jisx0212  . #x226C)	; �����
      ))
    (latin-iso8859-1	. #xAA)	; �����
    (latin-iso8859-9	. #xAA)	; �����
    (ucs		. #x00AA)	; ª
    ))
(define-char
  '((name		. "fullwidth feminine ordinal indicator")
    (=>ucs		. #x00AA)	; ª
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "FEMININE ORDINAL INDICATOR")
      (ucs		  . #x00AA)	; ª
      ))
    (korean-ksc5601	. #x2823)	; �����
    (japanese-jisx0212	. #x226C)	; �����
    (=jis-x0213-1-2000	. #x2927)	; �����
    (ucs-jis		. #x00AA)	; �����
    ))
(define-char
  '((name		. "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name . "fullwidth left-pointing double angle quotation mark")
      (=jis-x0213-1-2000  . #x2928)	; �����
      ))
    (arabic-1-column	. #x2A)	; �����
    (latin-iso8859-1	. #xAB)	; �����
    (greek-iso8859-7	. #xAB)	; �����
    (hebrew-iso8859-8	. #xAB)	; �����
    (latin-iso8859-9	. #xAB)	; �����
    (ucs		. #x00AB)	; «
    ))
(define-char
  '((name . "fullwidth left-pointing double angle quotation mark")
    (=>ucs		. #x00AB)	; «
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (<-fullwidth
     ((name		  . "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
      (ucs		  . #x00AB)	; «
      ))
    (=jis-x0213-1-2000	. #x2928)	; �����
    (ucs-jis		. #x00AB)	; �����
    ))
(define-char
  '((name		. "NOT SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH NOT SIGN")
      (ucs		  . #xFFE2)	; ￢
      ))
    (latin-iso8859-1	. #xAC)	; �����
    (greek-iso8859-7	. #xAC)	; �����
    (hebrew-iso8859-8	. #xAC)	; �����
    (latin-iso8859-9	. #xAC)	; �����
    (ucs		. #x00AC)	; ¬
    ))
(define-char
  '((name		. "SOFT HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth soft hyphen")
      (korean-ksc5601	  . #x2129)	; �����
      ))
    (latin-iso8859-1	. #xAD)	; �����
    (latin-iso8859-2	. #xAD)	; �����
    (latin-iso8859-3	. #xAD)	; �����
    (latin-iso8859-4	. #xAD)	; �����
    (greek-iso8859-7	. #xAD)	; �����
    (hebrew-iso8859-8	. #xAD)	; �����
    (cyrillic-iso8859-5 . #xAD)	; �����
    (latin-iso8859-9	. #xAD)	; �����
    (ucs		. #x00AD)	; ­
    ))
(define-char
  '((name		. "fullwidth soft hyphen")
    (=>ucs		. #x00AD)	; ­
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "SOFT HYPHEN")
      (ucs		  . #x00AD)	; ­
      ))
    (korean-ksc5601	. #x2129)	; �����
    (=jis-x0213-1-2000	. #x2929)	; �����
    (ucs-jis		. #x00AD)	; �����
    ))
(define-char
  '((name		. "REGISTERED SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth registered sign")
      (japanese-jisx0212  . #x226E)	; �����
      ))
    (latin-iso8859-1	. #xAE)	; �����
    (hebrew-iso8859-8	. #xAE)	; �����
    (latin-iso8859-9	. #xAE)	; �����
    (ucs		. #x00AE)	; ®
    ))
(define-char
  '((name		. "fullwidth registered sign")
    (=>ucs		. #x00AE)	; ®
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "REGISTERED SIGN")
      (ucs		  . #x00AE)	; ®
      ))
    (japanese-jisx0212	. #x226E)	; �����
    (=jis-x0213-1-2000	. #x292A)	; �����
    (=jef-china3	. #x81A1)	; �����
    (ucs-jis		. #x00AE)	; �����
    ))
(define-char
  '((name		. "MACRON")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0304)
    (->fullwidth
     ((name		  . "FULLWIDTH MACRON")
      (ucs		  . #xFFE3)	; ￣
      ))
    (latin-iso8859-1	. #xAF)	; �����
    (latin-iso8859-4	. #xAF)	; �����
    (latin-iso8859-9	. #xAF)	; �����
    (ucs		. #x00AF)	; ¯
    ))
(define-char
  '((name		. "DEGREE SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth degree sign")
      (chinese-gb2312	  . #x2163)	; �����
      (korean-ksc5601	  . #x2146)	; �����
      (chinese-cns11643-1 . #x2278)	; �����
      ))
    (latin-iso8859-1	. #xB0)	; �����
    (latin-iso8859-2	. #xB0)	; �����
    (latin-iso8859-3	. #xB0)	; �����
    (latin-iso8859-4	. #xB0)	; �����
    (greek-iso8859-7	. #xB0)	; �����
    (hebrew-iso8859-8	. #xB0)	; �����
    (latin-iso8859-9	. #xB0)	; �����
    (ucs		. #x00B0)	; °
    ))
(define-char
  '((name		. "fullwidth degree sign")
    (=>ucs		. #x00B0)	; °
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "DEGREE SIGN")
      (ucs		  . #x00B0)	; °
      ))
    (chinese-gb2312	. #x2163)	; �����
    (=jis-x0208		. #x216B)	; �����
    (korean-ksc5601	. #x2146)	; �����
    (chinese-cns11643-1 . #x2278)	; �����
    (chinese-big5	. #xA258)	; ������
    (ucs-jis		. #x00B0)	; �����
    ))
(define-char
  '((name		. "PLUS-MINUS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth plus-minus sign")
      (chinese-gb2312	  . #x2140)	; �����
      (korean-ksc5601	  . #x213E)	; �����
      (chinese-cns11643-1 . #x2234)	; �����
      ))
    (latin-iso8859-1	. #xB1)	; �����
    (greek-iso8859-7	. #xB1)	; �����
    (hebrew-iso8859-8	. #xB1)	; �����
    (latin-iso8859-9	. #xB1)	; �����
    (ucs		. #x00B1)	; ±
    ))
(define-char
  '((name		. "fullwidth plus-minus sign")
    (=>ucs		. #x00B1)	; ±
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "PLUS-MINUS SIGN")
      (ucs		  . #x00B1)	; ±
      ))
    (chinese-gb2312	. #x2140)	; �����
    (=jis-x0208		. #x215E)	; �����
    (korean-ksc5601	. #x213E)	; �����
    (chinese-cns11643-1 . #x2234)	; �����
    (chinese-big5	. #xA1D3)	; ������
    (ucs-jis		. #x00B1)	; �����
    ))
(define-char
  '((name		. "SUPERSCRIPT TWO")
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (->decomposition	super #x0032)
    (->fullwidth
     ((name		  . "fullwidth superscript two")
      (korean-ksc5601	  . #x2977)	; �����
      ))
    (latin-iso8859-1	. #xB2)	; �����
    (latin-iso8859-3	. #xB2)	; �����
    (greek-iso8859-7	. #xB2)	; �����
    (hebrew-iso8859-8	. #xB2)	; �����
    (latin-iso8859-9	. #xB2)	; �����
    (ucs		. #x00B2)	; ²
    ))
(define-char
  '((name		. "fullwidth superscript two")
    (=>ucs		. #x00B2)	; ²
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (<-fullwidth
     ((name		  . "SUPERSCRIPT TWO")
      (ucs		  . #x00B2)	; ²
      ))
    (korean-ksc5601	. #x2977)	; �����
    (=jis-x0213-1-2000	. #x292C)	; �����
    (ucs-jis		. #x00B2)	; �����
    ))
(define-char
  '((name		. "SUPERSCRIPT THREE")
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (->decomposition	super #x0033)
    (->fullwidth
     ((name		  . "fullwidth superscript three")
      (korean-ksc5601	  . #x2978)	; �����
      ))
    (latin-iso8859-1	. #xB3)	; �����
    (latin-iso8859-3	. #xB3)	; �����
    (greek-iso8859-7	. #xB3)	; �����
    (hebrew-iso8859-8	. #xB3)	; �����
    (latin-iso8859-9	. #xB3)	; �����
    (ucs		. #x00B3)	; ³
    ))
(define-char
  '((name		. "fullwidth superscript three")
    (=>ucs		. #x00B3)	; ³
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (<-fullwidth
     ((name		  . "SUPERSCRIPT THREE")
      (ucs		  . #x00B3)	; ³
      ))
    (korean-ksc5601	. #x2978)	; �����
    (=jis-x0213-1-2000	. #x292D)	; �����
    (ucs-jis		. #x00B3)	; �����
    ))
(define-char
  '((name		. "ACUTE ACCENT")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (->fullwidth
     ((name		  . "fullwidth acute accent")
      (korean-ksc5601	  . #x2225)	; �����
      ))
    (latin-iso8859-1	. #xB4)	; �����
    (latin-iso8859-2	. #xB4)	; �����
    (latin-iso8859-3	. #xB4)	; �����
    (latin-iso8859-4	. #xB4)	; �����
    (hebrew-iso8859-8	. #xB4)	; �����
    (latin-iso8859-9	. #xB4)	; �����
    (ucs		. #x00B4)	; ´
    ))
(define-char
  '((name		. "fullwidth acute accent")
    (=>ucs		. #x00B4)	; ´
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "ACUTE ACCENT")
      (ucs		  . #x00B4)	; ´
      ))
    (=jis-x0208		. #x212D)	; �����
    (korean-ksc5601	. #x2225)	; �����
    (=jef-china3	. #x81A4)	; �����
    (ucs-jis		. #x00B4)	; �����
    ))
(define-char
  '((name		. "MICRO SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03BC)
    (latin-iso8859-1	. #xB5)	; �����
    (latin-iso8859-3	. #xB5)	; �����
    (hebrew-iso8859-8	. #xB5)	; �����
    (latin-iso8859-9	. #xB5)	; �����
    (ucs		. #x00B5)	; µ
    ))
(define-char
  '((name		. "PILCROW SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth pilcrow sign")
      (japanese-jisx0208  . #x2279)	; �����
      (korean-ksc5601	  . #x2252)	; �����
      ))
    (latin-iso8859-1	. #xB6)	; �����
    (hebrew-iso8859-8	. #xB6)	; �����
    (latin-iso8859-9	. #xB6)	; �����
    (ucs		. #x00B6)	; ¶
    ))
(define-char
  '((name		. "fullwidth pilcrow sign")
    (=>ucs		. #x00B6)	; ¶
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "PILCROW SIGN")
      (ucs		  . #x00B6)	; ¶
      ))
    (japanese-jisx0208		. #x2279)	; �����
    (korean-ksc5601		. #x2252)	; �����
    (japanese-jisx0208-1990	. #x2279)	; �����
    (ucs-jis			. #x00B6)	; �����
    ))
(define-char
  '((name		. "MIDDLE DOT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth middle dot")
      (korean-ksc5601	  . #x2124)	; �����
      (chinese-cns11643-1 . #x2126)	; �����
      ))
    (latin-iso8859-1	. #xB7)	; �����
    (latin-iso8859-3	. #xB7)	; �����
    (greek-iso8859-7	. #xB7)	; �����
    (hebrew-iso8859-8	. #xB7)	; �����
    (latin-iso8859-9	. #xB7)	; �����
    (ucs		. #x00B7)	; ·
    ))
(define-char
  '((name		. "fullwidth middle dot")
    (=>ucs		. #x00B7)	; ·
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "MIDDLE DOT")
      (ucs		  . #x00B7)	; ·
      ))
    (korean-ksc5601	. #x2124)	; �����
    (chinese-cns11643-1 . #x2126)	; �����
    (=jis-x0213-1-2000	. #x292E)	; �����
    (chinese-big5	. #xA150)	; ������
    (ucs-jis		. #x00B7)	; �����
    ))
(define-char
  '((name		. "CEDILLA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0327)
    (->fullwidth
     ((name		  . "fullwidth cedilla")
      (korean-ksc5601	  . #x222C)	; �����
      (japanese-jisx0212  . #x2231)	; �����
      ))
    (latin-iso8859-1	. #xB8)	; �����
    (latin-iso8859-2	. #xB8)	; �����
    (latin-iso8859-3	. #xB8)	; �����
    (latin-iso8859-4	. #xB8)	; �����
    (hebrew-iso8859-8	. #xB8)	; �����
    (latin-iso8859-9	. #xB8)	; �����
    (ucs		. #x00B8)	; ¸
    ))
(define-char
  '((name		. "fullwidth cedilla")
    (=>ucs		. #x00B8)	; ¸
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "CEDILLA")
      (ucs		  . #x00B8)	; ¸
      ))
    (korean-ksc5601	. #x222C)	; �����
    (japanese-jisx0212	. #x2231)	; �����
    (=jis-x0213-1-2000	. #x292F)	; �����
    (=jef-china3	. #x81B2)	; �����
    (ucs-jis		. #x00B8)	; �����
    ))
(define-char
  '((name		. "SUPERSCRIPT ONE")
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (->decomposition	super #x0031)
    (->fullwidth
     ((name		  . "fullwidth superscript one")
      (korean-ksc5601	  . #x2976)	; �����
      ))
    (latin-iso8859-1	. #xB9)	; �����
    (hebrew-iso8859-8	. #xB9)	; �����
    (latin-iso8859-9	. #xB9)	; �����
    (ucs		. #x00B9)	; ¹
    ))
(define-char
  '((name		. "fullwidth superscript one")
    (=>ucs		. #x00B9)	; ¹
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (<-fullwidth
     ((name		  . "SUPERSCRIPT ONE")
      (ucs		  . #x00B9)	; ¹
      ))
    (korean-ksc5601	. #x2976)	; �����
    (=jis-x0213-1-2000	. #x2930)	; �����
    (ucs-jis		. #x00B9)	; �����
    ))
(define-char
  '((name		. "MASCULINE ORDINAL INDICATOR")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x006F)
    (->fullwidth
     ((name		  . "fullwidth masculine ordinal indicator")
      (korean-ksc5601	  . #x282C)	; �����
      (japanese-jisx0212  . #x226B)	; �����
      ))
    (latin-iso8859-1	. #xBA)	; �����
    (latin-iso8859-9	. #xBA)	; �����
    (ucs		. #x00BA)	; º
    ))
(define-char
  '((name		. "fullwidth masculine ordinal indicator")
    (=>ucs		. #x00BA)	; º
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "MASCULINE ORDINAL INDICATOR")
      (ucs		  . #x00BA)	; º
      ))
    (korean-ksc5601	. #x282C)	; �����
    (japanese-jisx0212	. #x226B)	; �����
    (=jis-x0213-1-2000	. #x2931)	; �����
    (ucs-jis		. #x00BA)	; �����
    ))
(define-char
  '((name		. "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name . "fullwidth right-pointing double angle quotation mark")
      (=jis-x0213-1-2000  . #x2932)	; �����
      ))
    (arabic-1-column	. #x2B)	; �����
    (latin-iso8859-1	. #xBB)	; �����
    (greek-iso8859-7	. #xBB)	; �����
    (hebrew-iso8859-8	. #xBB)	; �����
    (latin-iso8859-9	. #xBB)	; �����
    (ucs		. #x00BB)	; »
    ))
(define-char
  '((name . "fullwidth right-pointing double angle quotation mark")
    (=>ucs		. #x00BB)	; »
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (<-fullwidth
     ((name		  . "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
      (ucs		  . #x00BB)	; »
      ))
    (=jis-x0213-1-2000	. #x2932)	; �����
    (ucs-jis		. #x00BB)	; �����
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE QUARTER")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	fraction #x0031 #x2044 #x0034)
    (->fullwidth
     ((name		  . "fullwidth vulgar fraction one quarter")
      (korean-ksc5601	  . #x2879)	; �����
      ))
    (latin-iso8859-1	. #xBC)	; �����
    (hebrew-iso8859-8	. #xBC)	; �����
    (latin-iso8859-9	. #xBC)	; �����
    (ucs		. #x00BC)	; ¼
    ))
(define-char
  '((name		. "fullwidth vulgar fraction one quarter")
    (=>ucs		. #x00BC)	; ¼
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (<-fullwidth
     ((name		  . "VULGAR FRACTION ONE QUARTER")
      (ucs		  . #x00BC)	; ¼
      ))
    (korean-ksc5601	. #x2879)	; �����
    (=jis-x0213-1-2000	. #x2933)	; �����
    (ucs-jis		. #x00BC)	; �����
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE HALF")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	fraction #x0031 #x2044 #x0032)
    (->fullwidth
     ((name		  . "fullwidth vulgar fraction one half")
      (korean-ksc5601	  . #x2876)	; �����
      ))
    (latin-iso8859-1	. #xBD)	; �����
    (latin-iso8859-3	. #xBD)	; �����
    (greek-iso8859-7	. #xBD)	; �����
    (hebrew-iso8859-8	. #xBD)	; �����
    (latin-iso8859-9	. #xBD)	; �����
    (ucs		. #x00BD)	; ½
    ))
(define-char
  '((name		. "fullwidth vulgar fraction one half")
    (=>ucs		. #x00BD)	; ½
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (<-fullwidth
     ((name		  . "VULGAR FRACTION ONE HALF")
      (ucs		  . #x00BD)	; ½
      ))
    (korean-ksc5601	. #x2876)	; �����
    (=jis-x0213-1-2000	. #x2934)	; �����
    (ucs-jis		. #x00BD)	; �����
    ))
(define-char
  '((name		. "VULGAR FRACTION THREE QUARTERS")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (->decomposition	fraction #x0033 #x2044 #x0034)
    (->fullwidth
     ((name		  . "fullwidth vulgar fraction three quarters")
      (korean-ksc5601	  . #x287A)	; �����
      ))
    (latin-iso8859-1	. #xBE)	; �����
    (hebrew-iso8859-8	. #xBE)	; �����
    (latin-iso8859-9	. #xBE)	; �����
    (ucs		. #x00BE)	; ¾
    ))
(define-char
  '((name		. "fullwidth vulgar fraction three quarters")
    (=>ucs		. #x00BE)	; ¾
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (<-fullwidth
     ((name		  . "VULGAR FRACTION THREE QUARTERS")
      (ucs		  . #x00BE)	; ¾
      ))
    (korean-ksc5601	. #x287A)	; �����
    (=jis-x0213-1-2000	. #x2935)	; �����
    (ucs-jis		. #x00BE)	; �����
    ))
(define-char
  '((name		. "INVERTED QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth inverted question mark")
      (korean-ksc5601	  . #x222F)	; �����
      (japanese-jisx0212  . #x2244)	; �����
      ))
    (latin-iso8859-1	. #xBF)	; �����
    (latin-iso8859-9	. #xBF)	; �����
    (ucs		. #x00BF)	; ¿
    ))
(define-char
  '((name		. "fullwidth inverted question mark")
    (=>ucs		. #x00BF)	; ¿
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "INVERTED QUESTION MARK")
      (ucs		  . #x00BF)	; ¿
      ))
    (korean-ksc5601	. #x222F)	; �����
    (japanese-jisx0212	. #x2244)	; �����
    (=jis-x0213-1-2000	. #x2936)	; �����
    (ucs-jis		. #x00BF)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0300)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with grave")
      (japanese-jisx0212  . #x2A22)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH GRAVE")
      (ucs		  . #x00E0)	; à
      ))
    (latin-iso8859-1	. #xC0)	; �����
    (latin-iso8859-3	. #xC0)	; �����
    (latin-iso8859-9	. #xC0)	; �����
    (latin-viscii-upper . #xE0)	; �����
    (latin-viscii	. #xC0)	; �����
    (ucs		. #x00C0)	; À
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with grave")
    (=>ucs		. #x00C0)	; À
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter a with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH GRAVE")
      (ucs		  . #x00C0)	; À
      ))
    (japanese-jisx0212	. #x2A22)	; �����
    (=jis-x0213-1-2000	. #x2937)	; �����
    (=jef-china3	. #x85B9)	; �����
    (ucs-jis		. #x00C0)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with acute")
      (japanese-jisx0212  . #x2A21)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH ACUTE")
      (ucs		  . #x00E1)	; á
      ))
    (latin-iso8859-1	. #xC1)	; �����
    (latin-iso8859-2	. #xC1)	; �����
    (latin-iso8859-3	. #xC1)	; �����
    (latin-iso8859-4	. #xC1)	; �����
    (latin-iso8859-9	. #xC1)	; �����
    (latin-viscii-upper . #xE1)	; �����
    (latin-viscii	. #xC1)	; �����
    (ucs		. #x00C1)	; Á
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with acute")
    (=>ucs		. #x00C1)	; Á
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter a with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH ACUTE")
      (ucs		  . #x00C1)	; Á
      ))
    (japanese-jisx0212	. #x2A21)	; �����
    (=jis-x0213-1-2000	. #x2938)	; �����
    (=jef-china3	. #x85D5)	; �����
    (ucs-jis		. #x00C1)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with circumflex")
      (japanese-jisx0212  . #x2A24)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH CIRCUMFLEX")
      (ucs		  . #x00E2)	; â
      ))
    (latin-iso8859-1	. #xC2)	; �����
    (latin-iso8859-2	. #xC2)	; �����
    (latin-iso8859-3	. #xC2)	; �����
    (latin-iso8859-4	. #xC2)	; �����
    (latin-iso8859-9	. #xC2)	; �����
    (latin-tcvn5712	. #xA2)	; �����
    (latin-viscii-upper . #xE2)	; �����
    (latin-viscii	. #xC2)	; �����
    (ucs		. #x00C2)	; Â
    ))
(define-char
  '((name . "fullwidth latin capital letter a with circumflex")
    (=>ucs		. #x00C2)	; Â
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter a with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
      (ucs		  . #x00C2)	; Â
      ))
    (japanese-jisx0212	. #x2A24)	; �����
    (=jis-x0213-1-2000	. #x2939)	; �����
    (=jef-china3	. #x86B7)	; �����
    (ucs-jis		. #x00C2)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with tilde")
      (japanese-jisx0212  . #x2A2A)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH TILDE")
      (ucs		  . #x00E3)	; ã
      ))
    (latin-iso8859-1	. #xC3)	; �����
    (latin-iso8859-4	. #xC3)	; �����
    (latin-iso8859-9	. #xC3)	; �����
    (latin-viscii-upper . #xE3)	; �����
    (latin-viscii	. #xC3)	; �����
    (ucs		. #x00C3)	; Ã
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with tilde")
    (=>ucs		. #x00C3)	; Ã
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter a with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH TILDE")
      (ucs		  . #x00C3)	; Ã
      ))
    (japanese-jisx0212	. #x2A2A)	; �����
    (=jis-x0213-1-2000	. #x293A)	; �����
    (=jef-china3	. #x86E2)	; �����
    (ucs-jis		. #x00C3)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with diaeresis")
      (japanese-jisx0212  . #x2A23)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH DIAERESIS")
      (ucs		  . #x00E4)	; ä
      ))
    (latin-iso8859-1	. #xC4)	; �����
    (latin-iso8859-2	. #xC4)	; �����
    (latin-iso8859-3	. #xC4)	; �����
    (latin-iso8859-4	. #xC4)	; �����
    (latin-iso8859-9	. #xC4)	; �����
    (ucs		. #x00C4)	; Ä
    ))
(define-char
  '((name . "fullwidth latin capital letter a with diaeresis")
    (=>ucs		. #x00C4)	; Ä
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter a with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH DIAERESIS")
      (ucs		  . #x00C4)	; Ä
      ))
    (japanese-jisx0212	. #x2A23)	; �����
    (=jis-x0213-1-2000	. #x293B)	; �����
    (=jef-china3	. #x88C5)	; �����
    (ucs-jis		. #x00C4)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH RING ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x030A)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with ring above")
      (japanese-jisx0212  . #x2A29)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH RING ABOVE")
      (ucs		  . #x00E5)	; å
      ))
    (latin-iso8859-1	. #xC5)	; �����
    (latin-iso8859-4	. #xC5)	; �����
    (latin-iso8859-9	. #xC5)	; �����
    (ucs		. #x00C5)	; Å
    ))
(define-char
  '((name . "fullwidth latin capital letter a with ring above")
    (=>ucs		. #x00C5)	; Å
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter a with ring above")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH RING ABOVE")
      (ucs		  . #x00C5)	; Å
      ))
    (japanese-jisx0212	. #x2A29)	; �����
    (=jis-x0213-1-2000	. #x293C)	; �����
    (=jef-china3	. #x88FD)	; �����
    (ucs-jis		. #x00C5)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER AE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->lowercase
     ((name		  . "LATIN SMALL LETTER AE")
      (ucs		  . #x00E6)	; æ
      ))
    (latin-iso8859-1	. #xC6)	; �����
    (latin-iso8859-4	. #xC6)	; �����
    (latin-iso8859-9	. #xC6)	; �����
    (ucs		. #x00C6)	; Æ
    ))
(define-char
  '((name		. "fullwidth latin capital letter ae")
    (=>ucs		. #x00C6)	; Æ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter ae")
      ))
    (korean-ksc5601	. #x2821)	; �����
    (japanese-jisx0212	. #x2921)	; �����
    (=jis-x0213-1-2000	. #x293D)	; �����
    (=jef-china3	. #x83A5)	; �����
    (ucs-jis		. #x00C6)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with cedilla")
      (japanese-jisx0212  . #x2A2E)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CEDILLA")
      (ucs		  . #x00E7)	; ç
      ))
    (latin-iso8859-1	. #xC7)	; �����
    (latin-iso8859-2	. #xC7)	; �����
    (latin-iso8859-3	. #xC7)	; �����
    (latin-iso8859-9	. #xC7)	; �����
    (ucs		. #x00C7)	; Ç
    ))
(define-char
  '((name . "fullwidth latin capital letter c with cedilla")
    (=>ucs		. #x00C7)	; Ç
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter c with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH CEDILLA")
      (ucs		  . #x00C7)	; Ç
      ))
    (japanese-jisx0212	. #x2A2E)	; �����
    (=jis-x0213-1-2000	. #x293E)	; �����
    (=jef-china3	. #x89F5)	; �����
    (ucs-jis		. #x00C7)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0300)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with grave")
      (japanese-jisx0212  . #x2A32)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH GRAVE")
      (ucs		  . #x00E8)	; è
      ))
    (latin-iso8859-1	. #xC8)	; �����
    (latin-iso8859-3	. #xC8)	; �����
    (latin-iso8859-9	. #xC8)	; �����
    (latin-viscii-upper . #xE8)	; �����
    (latin-viscii	. #xC8)	; �����
    (ucs		. #x00C8)	; È
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with grave")
    (=>ucs		. #x00C8)	; È
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter e with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH GRAVE")
      (ucs		  . #x00C8)	; È
      ))
    (japanese-jisx0212	. #x2A32)	; �����
    (=jis-x0213-1-2000	. #x293F)	; �����
    (=jef-china3	. #x85BA)	; �����
    (ucs-jis		. #x00C8)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with acute")
      (japanese-jisx0212  . #x2A31)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH ACUTE")
      (ucs		  . #x00E9)	; é
      ))
    (latin-iso8859-1	. #xC9)	; �����
    (latin-iso8859-2	. #xC9)	; �����
    (latin-iso8859-3	. #xC9)	; �����
    (latin-iso8859-4	. #xC9)	; �����
    (latin-iso8859-9	. #xC9)	; �����
    (latin-viscii-upper . #xE9)	; �����
    (latin-viscii	. #xC9)	; �����
    (ucs		. #x00C9)	; É
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with acute")
    (=>ucs		. #x00C9)	; É
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter e with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH ACUTE")
      (ucs		  . #x00C9)	; É
      ))
    (japanese-jisx0212	. #x2A31)	; �����
    (=jis-x0213-1-2000	. #x2940)	; �����
    (=jef-china3	. #x85D8)	; �����
    (ucs-jis		. #x00C9)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with circumflex")
      (japanese-jisx0212  . #x2A34)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH CIRCUMFLEX")
      (ucs		  . #x00EA)	; ê
      ))
    (latin-iso8859-1	. #xCA)	; �����
    (latin-iso8859-3	. #xCA)	; �����
    (latin-iso8859-9	. #xCA)	; �����
    (latin-tcvn5712	. #xA3)	; �����
    (latin-viscii-upper . #xEA)	; �����
    (latin-viscii	. #xCA)	; �����
    (ucs		. #x00CA)	; Ê
    ))
(define-char
  '((name . "fullwidth latin capital letter e with circumflex")
    (=>ucs		. #x00CA)	; Ê
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter e with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
      (ucs		  . #x00CA)	; Ê
      ))
    (japanese-jisx0212	. #x2A34)	; �����
    (=jis-x0213-1-2000	. #x2941)	; �����
    (=jef-china3	. #x86B9)	; �����
    (ucs-jis		. #x00CA)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with diaeresis")
      (japanese-jisx0212  . #x2A33)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH DIAERESIS")
      (ucs		  . #x00EB)	; ë
      ))
    (latin-iso8859-1	. #xCB)	; �����
    (latin-iso8859-2	. #xCB)	; �����
    (latin-iso8859-3	. #xCB)	; �����
    (latin-iso8859-4	. #xCB)	; �����
    (latin-iso8859-9	. #xCB)	; �����
    (ucs		. #x00CB)	; Ë
    ))
(define-char
  '((name . "fullwidth latin capital letter e with diaeresis")
    (=>ucs		. #x00CB)	; Ë
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter e with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH DIAERESIS")
      (ucs		  . #x00CB)	; Ë
      ))
    (japanese-jisx0212	. #x2A33)	; �����
    (=jis-x0213-1-2000	. #x2942)	; �����
    (=jef-china3	. #x88C7)	; �����
    (ucs-jis		. #x00CB)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0300)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with grave")
      (japanese-jisx0212  . #x2A40)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH GRAVE")
      (ucs		  . #x00EC)	; ì
      ))
    (latin-iso8859-1	. #xCC)	; �����
    (latin-iso8859-3	. #xCC)	; �����
    (latin-iso8859-9	. #xCC)	; �����
    (latin-viscii-upper . #xEC)	; �����
    (latin-viscii	. #xCC)	; �����
    (ucs		. #x00CC)	; Ì
    ))
(define-char
  '((name		. "fullwidth latin capital letter i with grave")
    (=>ucs		. #x00CC)	; Ì
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter i with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH GRAVE")
      (ucs		  . #x00CC)	; Ì
      ))
    (japanese-jisx0212	. #x2A40)	; �����
    (=jis-x0213-1-2000	. #x2943)	; �����
    (=jef-china3	. #x85BB)	; �����
    (ucs-jis		. #x00CC)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with acute")
      (japanese-jisx0212  . #x2A3F)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH ACUTE")
      (ucs		  . #x00ED)	; í
      ))
    (latin-iso8859-1	. #xCD)	; �����
    (latin-iso8859-2	. #xCD)	; �����
    (latin-iso8859-3	. #xCD)	; �����
    (latin-iso8859-4	. #xCD)	; �����
    (latin-iso8859-9	. #xCD)	; �����
    (latin-viscii-upper . #xED)	; �����
    (latin-viscii	. #xCD)	; �����
    (ucs		. #x00CD)	; Í
    ))
(define-char
  '((name		. "fullwidth latin capital letter i with acute")
    (=>ucs		. #x00CD)	; Í
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter i with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH ACUTE")
      (ucs		  . #x00CD)	; Í
      ))
    (japanese-jisx0212	. #x2A3F)	; �����
    (=jis-x0213-1-2000	. #x2944)	; �����
    (=jef-china3	. #x85DB)	; �����
    (ucs-jis		. #x00CD)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with circumflex")
      (japanese-jisx0212  . #x2A42)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH CIRCUMFLEX")
      (ucs		  . #x00EE)	; î
      ))
    (latin-iso8859-1	. #xCE)	; �����
    (latin-iso8859-2	. #xCE)	; �����
    (latin-iso8859-3	. #xCE)	; �����
    (latin-iso8859-4	. #xCE)	; �����
    (latin-iso8859-9	. #xCE)	; �����
    (ucs		. #x00CE)	; Î
    ))
(define-char
  '((name . "fullwidth latin capital letter i with circumflex")
    (=>ucs		. #x00CE)	; Î
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter i with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
      (ucs		  . #x00CE)	; Î
      ))
    (japanese-jisx0212	. #x2A42)	; �����
    (=jis-x0213-1-2000	. #x2945)	; �����
    (=jef-china3	. #x86BC)	; �����
    (ucs-jis		. #x00CE)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with diaeresis")
      (japanese-jisx0212  . #x2A41)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH DIAERESIS")
      (ucs		  . #x00EF)	; ï
      ))
    (latin-iso8859-1	. #xCF)	; �����
    (latin-iso8859-3	. #xCF)	; �����
    (latin-iso8859-9	. #xCF)	; �����
    (ucs		. #x00CF)	; Ï
    ))
(define-char
  '((name . "fullwidth latin capital letter i with diaeresis")
    (=>ucs		. #x00CF)	; Ï
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter i with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH DIAERESIS")
      (ucs		  . #x00CF)	; Ï
      ))
    (japanese-jisx0212	. #x2A41)	; �����
    (=jis-x0213-1-2000	. #x2946)	; �����
    (=jef-china3	. #x88C9)	; �����
    (ucs-jis		. #x00CF)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ETH")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->fullwidth
     ((name		  . "fullwidth latin capital letter eth")
      (korean-ksc5601	  . #x2822)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER ETH")
      (ucs		  . #x00F0)	; ð
      ))
    (latin-iso8859-1	. #xD0)	; �����
    (ucs		. #x00D0)	; Ð
    ))
(define-char
  '((name		. "fullwidth latin capital letter eth")
    (=>ucs		. #x00D0)	; Ð
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase
     ((name		  . "fullwidth latin small letter eth")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER ETH")
      (ucs		  . #x00D0)	; Ð
      ))
    (korean-ksc5601	. #x2822)	; �����
    (=jis-x0213-1-2000	. #x2947)	; �����
    (ucs-jis		. #x00D0)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with tilde")
      (japanese-jisx0212  . #x2A50)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH TILDE")
      (ucs		  . #x00F1)	; ñ
      ))
    (latin-iso8859-1	. #xD1)	; �����
    (latin-iso8859-3	. #xD1)	; �����
    (latin-iso8859-9	. #xD1)	; �����
    (ucs		. #x00D1)	; Ñ
    ))
(define-char
  '((name		. "fullwidth latin capital letter n with tilde")
    (=>ucs		. #x00D1)	; Ñ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter n with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH TILDE")
      (ucs		  . #x00D1)	; Ñ
      ))
    (japanese-jisx0212	. #x2A50)	; �����
    (=jis-x0213-1-2000	. #x2948)	; �����
    (=jef-china3	. #x86E6)	; �����
    (ucs-jis		. #x00D1)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0300)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with grave")
      (japanese-jisx0212  . #x2A52)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH GRAVE")
      (ucs		  . #x00F2)	; ò
      ))
    (latin-iso8859-1	. #xD2)	; �����
    (latin-iso8859-3	. #xD2)	; �����
    (latin-iso8859-9	. #xD2)	; �����
    (latin-viscii-upper . #xF2)	; �����
    (latin-viscii	. #xD2)	; �����
    (ucs		. #x00D2)	; Ò
    ))
(define-char
  '((name		. "fullwidth latin capital letter o with grave")
    (=>ucs		. #x00D2)	; Ò
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter o with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH GRAVE")
      (ucs		  . #x00D2)	; Ò
      ))
    (japanese-jisx0212	. #x2A52)	; �����
    (=jis-x0213-1-2000	. #x2949)	; �����
    (=jef-china3	. #x85BD)	; �����
    (ucs-jis		. #x00D2)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with acute")
      (japanese-jisx0212  . #x2A51)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH ACUTE")
      (ucs		  . #x00F3)	; ó
      ))
    (latin-iso8859-1	. #xD3)	; �����
    (latin-iso8859-2	. #xD3)	; �����
    (latin-iso8859-3	. #xD3)	; �����
    (latin-iso8859-9	. #xD3)	; �����
    (latin-viscii-upper . #xF3)	; �����
    (latin-viscii	. #xD3)	; �����
    (ucs		. #x00D3)	; Ó
    ))
(define-char
  '((name		. "fullwidth latin capital letter o with acute")
    (=>ucs		. #x00D3)	; Ó
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter o with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH ACUTE")
      (ucs		  . #x00D3)	; Ó
      ))
    (japanese-jisx0212	. #x2A51)	; �����
    (=jis-x0213-1-2000	. #x294A)	; �����
    (=jef-china3	. #x85E0)	; �����
    (ucs-jis		. #x00D3)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with circumflex")
      (japanese-jisx0212  . #x2A54)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH CIRCUMFLEX")
      (ucs		  . #x00F4)	; ô
      ))
    (latin-iso8859-1	. #xD4)	; �����
    (latin-iso8859-2	. #xD4)	; �����
    (latin-iso8859-3	. #xD4)	; �����
    (latin-iso8859-4	. #xD4)	; �����
    (latin-iso8859-9	. #xD4)	; �����
    (latin-tcvn5712	. #xA4)	; �����
    (latin-viscii-upper . #xF4)	; �����
    (latin-viscii	. #xD4)	; �����
    (ucs		. #x00D4)	; Ô
    ))
(define-char
  '((name . "fullwidth latin capital letter o with circumflex")
    (=>ucs		. #x00D4)	; Ô
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter o with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
      (ucs		  . #x00D4)	; Ô
      ))
    (japanese-jisx0212	. #x2A54)	; �����
    (=jis-x0213-1-2000	. #x294B)	; �����
    (=jef-china3	. #x86BF)	; �����
    (ucs-jis		. #x00D4)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with tilde")
      (japanese-jisx0212  . #x2A58)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH TILDE")
      (ucs		  . #x00F5)	; õ
      ))
    (latin-iso8859-1	. #xD5)	; �����
    (latin-iso8859-4	. #xD5)	; �����
    (latin-iso8859-9	. #xD5)	; �����
    (latin-viscii-upper . #xF5)	; �����
    (latin-viscii	. #xA0)	; �����
    (ucs		. #x00D5)	; Õ
    ))
(define-char
  '((name		. "fullwidth latin capital letter o with tilde")
    (=>ucs		. #x00D5)	; Õ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin capital letter o with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH TILDE")
      (ucs		  . #x00D5)	; Õ
      ))
    (japanese-jisx0212	. #x2A58)	; �����
    (=jis-x0213-1-2000	. #x294C)	; �����
    (=jef-china3	. #x86E7)	; �����
    (ucs-jis		. #x00D5)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with diaeresis")
      (japanese-jisx0212  . #x2A53)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH DIAERESIS")
      (ucs		  . #x00F6)	; ö
      ))
    (latin-iso8859-1	. #xD6)	; �����
    (latin-iso8859-2	. #xD6)	; �����
    (latin-iso8859-3	. #xD6)	; �����
    (latin-iso8859-4	. #xD6)	; �����
    (latin-iso8859-9	. #xD6)	; �����
    (ucs		. #x00D6)	; Ö
    ))
(define-char
  '((name . "fullwidth latin capital letter o with diaeresis")
    (=>ucs		. #x00D6)	; Ö
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin capital letter o with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH DIAERESIS")
      (ucs		  . #x00D6)	; Ö
      ))
    (japanese-jisx0212	. #x2A53)	; �����
    (=jis-x0213-1-2000	. #x294D)	; �����
    (=jef-china3	. #x88CB)	; �����
    (ucs-jis		. #x00D6)	; �����
    ))
(define-char
  '((name		. "MULTIPLICATION SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth multiplication sign")
      (chinese-gb2312	  . #x2141)	; �����
      (korean-ksc5601	  . #x213F)	; �����
      (chinese-cns11643-1 . #x2232)	; �����
      ))
    (latin-iso8859-1	. #xD7)	; �����
    (latin-iso8859-2	. #xD7)	; �����
    (latin-iso8859-3	. #xD7)	; �����
    (latin-iso8859-4	. #xD7)	; �����
    (hebrew-iso8859-8	. #xAA)	; �����
    (latin-iso8859-9	. #xD7)	; �����
    (ucs		. #x00D7)	; ×
    ))
(define-char
  '((name		. "fullwidth multiplication sign")
    (=>ucs		. #x00D7)	; ×
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "MULTIPLICATION SIGN")
      (ucs		  . #x00D7)	; ×
      ))
    (chinese-gb2312	. #x2141)	; �����
    (=jis-x0208		. #x215F)	; �����
    (korean-ksc5601	. #x213F)	; �����
    (chinese-cns11643-1 . #x2232)	; �����
    (chinese-big5	. #xA1D1)	; ������
    (ucs-jis		. #x00D7)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH STROKE")
      (ucs		  . #x00F8)	; ø
      ))
    (latin-iso8859-1	. #xD8)	; �����
    (latin-iso8859-4	. #xD8)	; �����
    (latin-iso8859-9	. #xD8)	; �����
    (ucs		. #x00D8)	; Ø
    ))
(define-char
  '((name		. "fullwidth latin capital letter o with stroke")
    (=>ucs		. #x00D8)	; Ø
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter o with stroke")
      ))
    (korean-ksc5601	. #x282A)	; �����
    (japanese-jisx0212	. #x292C)	; �����
    (=jis-x0213-1-2000	. #x294E)	; �����
    (=jef-china3	. #x83A2)	; �����
    (ucs-jis		. #x00D8)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH GRAVE")
      (ucs		  . #x00F9)	; ù
      ))
    (latin-iso8859-1	. #xD9)	; �����
    (latin-iso8859-3	. #xD9)	; �����
    (latin-iso8859-9	. #xD9)	; �����
    (latin-viscii-upper . #xF9)	; �����
    (latin-viscii	. #xD9)	; �����
    (ucs		. #x00D9)	; Ù
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with grave")
    (=>ucs		. #x00D9)	; Ù
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase
     ((name		  . "fullwidth latin small letter u with grave")
      ))
    (japanese-jisx0212	. #x2A63)	; �����
    (=jis-x0213-1-2000	. #x294F)	; �����
    (=jef-china3	. #x85BF)	; �����
    (ucs-jis		. #x00D9)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with acute")
      (japanese-jisx0212  . #x2A62)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH ACUTE")
      (ucs		  . #x00FA)	; ú
      ))
    (latin-iso8859-1	. #xDA)	; �����
    (latin-iso8859-2	. #xDA)	; �����
    (latin-iso8859-3	. #xDA)	; �����
    (latin-iso8859-4	. #xDA)	; �����
    (latin-iso8859-9	. #xDA)	; �����
    (latin-viscii-upper . #xFA)	; �����
    (latin-viscii	. #xDA)	; �����
    (ucs		. #x00DA)	; Ú
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with acute")
    (=>ucs		. #x00DA)	; Ú
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter u with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH ACUTE")
      (ucs		  . #x00DA)	; Ú
      ))
    (japanese-jisx0212	. #x2A62)	; �����
    (=jis-x0213-1-2000	. #x2950)	; �����
    (=jef-china3	. #x85E6)	; �����
    (ucs-jis		. #x00DA)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with circumflex")
      (japanese-jisx0212  . #x2A65)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH CIRCUMFLEX")
      (ucs		  . #x00FB)	; û
      ))
    (latin-iso8859-1	. #xDB)	; �����
    (latin-iso8859-3	. #xDB)	; �����
    (latin-iso8859-4	. #xDB)	; �����
    (latin-iso8859-9	. #xDB)	; �����
    (ucs		. #x00DB)	; Û
    ))
(define-char
  '((name . "fullwidth latin capital letter u with circumflex")
    (=>ucs		. #x00DB)	; Û
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter u with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
      (ucs		  . #x00DB)	; Û
      ))
    (japanese-jisx0212	. #x2A65)	; �����
    (=jis-x0213-1-2000	. #x2951)	; �����
    (=jef-china3	. #x86C1)	; �����
    (ucs-jis		. #x00DB)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with diaeresis")
      (japanese-jisx0212  . #x2A64)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH DIAERESIS")
      (ucs		  . #x00FC)	; ü
      ))
    (latin-iso8859-1	. #xDC)	; �����
    (latin-iso8859-2	. #xDC)	; �����
    (latin-iso8859-3	. #xDC)	; �����
    (latin-iso8859-4	. #xDC)	; �����
    (latin-iso8859-9	. #xDC)	; �����
    (ucs		. #x00DC)	; Ü
    ))
(define-char
  '((name . "fullwidth latin capital letter u with diaeresis")
    (=>ucs		. #x00DC)	; Ü
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter u with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH DIAERESIS")
      (ucs		  . #x00DC)	; Ü
      ))
    (japanese-jisx0212	. #x2A64)	; �����
    (=jis-x0213-1-2000	. #x2952)	; �����
    (=jef-china3	. #x88CE)	; �����
    (ucs-jis		. #x00DC)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter y with acute")
      (japanese-jisx0212  . #x2A72)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH ACUTE")
      (ucs		  . #x00FD)	; ý
      ))
    (latin-iso8859-1	. #xDD)	; �����
    (latin-iso8859-2	. #xDD)	; �����
    (latin-viscii-upper . #xFD)	; �����
    (latin-viscii	. #xDD)	; �����
    (ucs		. #x00DD)	; Ý
    ))
(define-char
  '((name		. "fullwidth latin capital letter y with acute")
    (=>ucs		. #x00DD)	; Ý
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter y with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Y WITH ACUTE")
      (ucs		  . #x00DD)	; Ý
      ))
    (japanese-jisx0212	. #x2A72)	; �����
    (=jis-x0213-1-2000	. #x2953)	; �����
    (=jef-china3	. #x85E9)	; �����
    (ucs-jis		. #x00DD)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER THORN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->fullwidth
     ((name		  . "fullwidth latin capital letter thorn")
      (korean-ksc5601	  . #x282D)	; �����
      (japanese-jisx0212  . #x2930)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER THORN")
      (ucs		  . #x00FE)	; þ
      ))
    (latin-iso8859-1	. #xDE)	; �����
    (ucs		. #x00DE)	; Þ
    ))
(define-char
  '((name		. "fullwidth latin capital letter thorn")
    (=>ucs		. #x00DE)	; Þ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase
     ((name		  . "fullwidth latin small letter thorn")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER THORN")
      (ucs		  . #x00DE)	; Þ
      ))
    (korean-ksc5601	. #x282D)	; �����
    (japanese-jisx0212	. #x2930)	; �����
    (=jis-x0213-1-2000	. #x2954)	; �����
    (=jef-china3	. #x83A4)	; �����
    (ucs-jis		. #x00DE)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER SHARP S")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (->fullwidth
     ((name		  . "fullwidth latin small letter sharp s")
      (korean-ksc5601	  . #x292C)	; �����
      (japanese-jisx0212  . #x294E)	; �����
      ))
    (latin-iso8859-1	. #xDF)	; �����
    (latin-iso8859-2	. #xDF)	; �����
    (latin-iso8859-3	. #xDF)	; �����
    (latin-iso8859-4	. #xDF)	; �����
    (latin-iso8859-9	. #xDF)	; �����
    (ucs		. #x00DF)	; ß
    ))
(define-char
  '((name		. "fullwidth latin small letter sharp s")
    (=>ucs		. #x00DF)	; ß
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER SHARP S")
      (ucs		  . #x00DF)	; ß
      ))
    (korean-ksc5601	. #x292C)	; �����
    (japanese-jisx0212	. #x294E)	; �����
    (=jis-x0213-1-2000	. #x2955)	; �����
    (=jef-china3	. #x83B7)	; �����
    (ucs-jis		. #x00DF)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0300)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with grave")
      (chinese-gb2312	  . #x2824)	; �����
      (japanese-jisx0212  . #x2B22)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH GRAVE")
      (ucs		  . #x00C0)	; À
      ))
    (latin-iso8859-1	. #xE0)	; �����
    (latin-iso8859-3	. #xE0)	; �����
    (latin-iso8859-9	. #xE0)	; �����
    (latin-tcvn5712	. #xB5)	; �����
    (latin-viscii-lower . #xE0)	; �����
    (latin-viscii	. #xE0)	; �����
    (ucs		. #x00E0)	; à
    ))
(define-char
  '((name		. "fullwidth latin small letter a with grave")
    (=>ucs		. #x00E0)	; à
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter a with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH GRAVE")
      (ucs		  . #x00E0)	; à
      ))
    (chinese-gb2312	. #x2824)	; �����
    (japanese-jisx0212	. #x2B22)	; �����
    (=jis-x0213-1-2000	. #x2956)	; �����
    (=jef-china3	. #x85C1)	; �����
    (ucs-jis		. #x00E0)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with acute")
      (chinese-gb2312	  . #x2822)	; �����
      (japanese-jisx0212  . #x2B21)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH ACUTE")
      (ucs		  . #x00C1)	; Á
      ))
    (latin-iso8859-1	. #xE1)	; �����
    (latin-iso8859-2	. #xE1)	; �����
    (latin-iso8859-3	. #xE1)	; �����
    (latin-iso8859-4	. #xE1)	; �����
    (latin-iso8859-9	. #xE1)	; �����
    (latin-tcvn5712	. #xB8)	; �����
    (latin-viscii-lower . #xE1)	; �����
    (latin-viscii	. #xE1)	; �����
    (ucs		. #x00E1)	; á
    ))
(define-char
  '((name		. "fullwidth latin small letter a with acute")
    (=>ucs		. #x00E1)	; á
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter a with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH ACUTE")
      (ucs		  . #x00E1)	; á
      ))
    (chinese-gb2312	. #x2822)	; �����
    (japanese-jisx0212	. #x2B21)	; �����
    (=jis-x0213-1-2000	. #x2957)	; �����
    (=jef-china3	. #x85EB)	; �����
    (ucs-jis		. #x00E1)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter a with circumflex")
      (japanese-jisx0212  . #x2B24)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
      (ucs		  . #x00C2)	; Â
      ))
    (latin-iso8859-1	. #xE2)	; �����
    (latin-iso8859-2	. #xE2)	; �����
    (latin-iso8859-3	. #xE2)	; �����
    (latin-iso8859-4	. #xE2)	; �����
    (latin-iso8859-9	. #xE2)	; �����
    (latin-tcvn5712	. #xA9)	; �����
    (latin-viscii-lower . #xE2)	; �����
    (latin-viscii	. #xE2)	; �����
    (ucs		. #x00E2)	; â
    ))
(define-char
  '((name . "fullwidth latin small letter a with circumflex")
    (=>ucs		. #x00E2)	; â
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter a with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH CIRCUMFLEX")
      (ucs		  . #x00E2)	; â
      ))
    (japanese-jisx0212	. #x2B24)	; �����
    (=jis-x0213-1-2000	. #x2958)	; �����
    (=jef-china3	. #x86C4)	; �����
    (ucs-jis		. #x00E2)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with tilde")
      (japanese-jisx0212  . #x2B2A)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH TILDE")
      (ucs		  . #x00C3)	; Ã
      ))
    (latin-iso8859-1	. #xE3)	; �����
    (latin-iso8859-4	. #xE3)	; �����
    (latin-iso8859-9	. #xE3)	; �����
    (latin-tcvn5712	. #xB7)	; �����
    (latin-viscii-lower . #xE3)	; �����
    (latin-viscii	. #xE3)	; �����
    (ucs		. #x00E3)	; ã
    ))
(define-char
  '((name		. "fullwidth latin small letter a with tilde")
    (=>ucs		. #x00E3)	; ã
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter a with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH TILDE")
      (ucs		  . #x00E3)	; ã
      ))
    (japanese-jisx0212	. #x2B2A)	; �����
    (=jis-x0213-1-2000	. #x2959)	; �����
    (=jef-china3	. #x86EF)	; �����
    (ucs-jis		. #x00E3)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0308)
    (->fullwidth
     ((name . "fullwidth latin small letter a with diaeresis")
      (japanese-jisx0212  . #x2B23)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH DIAERESIS")
      (ucs		  . #x00C4)	; Ä
      ))
    (latin-iso8859-1	. #xE4)	; �����
    (latin-iso8859-2	. #xE4)	; �����
    (latin-iso8859-3	. #xE4)	; �����
    (latin-iso8859-4	. #xE4)	; �����
    (latin-iso8859-9	. #xE4)	; �����
    (ucs		. #x00E4)	; ä
    ))
(define-char
  '((name . "fullwidth latin small letter a with diaeresis")
    (=>ucs		. #x00E4)	; ä
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter a with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH DIAERESIS")
      (ucs		  . #x00E4)	; ä
      ))
    (japanese-jisx0212	. #x2B23)	; �����
    (=jis-x0213-1-2000	. #x295A)	; �����
    (=jef-china3	. #x88D2)	; �����
    (ucs-jis		. #x00E4)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH RING ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x030A)
    (->fullwidth
     ((name . "fullwidth latin small letter a with ring above")
      (japanese-jisx0212  . #x2B29)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH RING ABOVE")
      (ucs		  . #x00C5)	; Å
      ))
    (latin-iso8859-1	. #xE5)	; �����
    (latin-iso8859-4	. #xE5)	; �����
    (latin-iso8859-9	. #xE5)	; �����
    (ucs		. #x00E5)	; å
    ))
(define-char
  '((name . "fullwidth latin small letter a with ring above")
    (=>ucs		. #x00E5)	; å
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter a with ring above")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH RING ABOVE")
      (ucs		  . #x00E5)	; å
      ))
    (japanese-jisx0212	. #x2B29)	; �����
    (=jis-x0213-1-2000	. #x295B)	; �����
    (=jef-china3	. #x89A7)	; �����
    (ucs-jis		. #x00E5)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER AE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->fullwidth
     ((name		  . "fullwidth latin small letter ae")
      (korean-ksc5601	  . #x2921)	; �����
      (japanese-jisx0212  . #x2941)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER AE")
      (ucs		  . #x00C6)	; Æ
      ))
    (latin-iso8859-1	. #xE6)	; �����
    (latin-iso8859-4	. #xE6)	; �����
    (latin-iso8859-9	. #xE6)	; �����
    (ipa		. #xA4)	; �����
    (ucs		. #x00E6)	; æ
    ))
(define-char
  '((name		. "fullwidth latin small letter ae")
    (=>ucs		. #x00E6)	; æ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->uppercase
     ((name		  . "fullwidth latin capital letter ae")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER AE")
      (ucs		  . #x00E6)	; æ
      ))
    (korean-ksc5601	. #x2921)	; �����
    (japanese-jisx0212	. #x2941)	; �����
    (=jis-x0213-1-2000	. #x295C)	; �����
    (=jef-china3	. #x83B0)	; �����
    (ucs-jis		. #x00E6)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter c with cedilla")
      (japanese-jisx0212  . #x2B2E)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CEDILLA")
      (ucs		  . #x00C7)	; Ç
      ))
    (latin-iso8859-1	. #xE7)	; �����
    (latin-iso8859-2	. #xE7)	; �����
    (latin-iso8859-3	. #xE7)	; �����
    (latin-iso8859-9	. #xE7)	; �����
    (ipa		. #xCE)	; �����
    (ucs		. #x00E7)	; ç
    ))
(define-char
  '((name		. "fullwidth latin small letter c with cedilla")
    (=>ucs		. #x00E7)	; ç
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter c with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH CEDILLA")
      (ucs		  . #x00E7)	; ç
      ))
    (japanese-jisx0212	. #x2B2E)	; �����
    (=jis-x0213-1-2000	. #x295D)	; �����
    (=jef-china3	. #x89FB)	; �����
    (ucs-jis		. #x00E7)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0300)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with grave")
      (chinese-gb2312	  . #x2828)	; �����
      (japanese-jisx0212  . #x2B32)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH GRAVE")
      (ucs		  . #x00C8)	; È
      ))
    (latin-iso8859-1	. #xE8)	; �����
    (latin-iso8859-3	. #xE8)	; �����
    (latin-iso8859-9	. #xE8)	; �����
    (latin-tcvn5712	. #xCC)	; �����
    (latin-viscii-lower . #xE8)	; �����
    (latin-viscii	. #xE8)	; �����
    (ucs		. #x00E8)	; è
    ))
(define-char
  '((name		. "fullwidth latin small letter e with grave")
    (=>ucs		. #x00E8)	; è
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter e with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH GRAVE")
      (ucs		  . #x00E8)	; è
      ))
    (chinese-gb2312	. #x2828)	; �����
    (japanese-jisx0212	. #x2B32)	; �����
    (=jis-x0213-1-2000	. #x295E)	; �����
    (=jef-china3	. #x85C2)	; �����
    (ucs-jis		. #x00E8)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with acute")
      (chinese-gb2312	  . #x2826)	; �����
      (japanese-jisx0212  . #x2B31)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH ACUTE")
      (ucs		  . #x00C9)	; É
      ))
    (latin-iso8859-1	. #xE9)	; �����
    (latin-iso8859-2	. #xE9)	; �����
    (latin-iso8859-3	. #xE9)	; �����
    (latin-iso8859-4	. #xE9)	; �����
    (latin-iso8859-9	. #xE9)	; �����
    (latin-tcvn5712	. #xD0)	; �����
    (latin-viscii-lower . #xE9)	; �����
    (latin-viscii	. #xE9)	; �����
    (ucs		. #x00E9)	; é
    ))
(define-char
  '((name		. "fullwidth latin small letter e with acute")
    (=>ucs		. #x00E9)	; é
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter e with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH ACUTE")
      (ucs		  . #x00E9)	; é
      ))
    (chinese-gb2312	. #x2826)	; �����
    (japanese-jisx0212	. #x2B31)	; �����
    (=jis-x0213-1-2000	. #x295F)	; �����
    (=jef-china3	. #x85EE)	; �����
    (ucs-jis		. #x00E9)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter e with circumflex")
      (chinese-gb2312	  . #x283A)	; �����
      (japanese-jisx0212  . #x2B34)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
      (ucs		  . #x00CA)	; Ê
      ))
    (latin-iso8859-1	. #xEA)	; �����
    (latin-iso8859-3	. #xEA)	; �����
    (latin-iso8859-9	. #xEA)	; �����
    (latin-tcvn5712	. #xAA)	; �����
    (latin-viscii-lower . #xEA)	; �����
    (latin-viscii	. #xEA)	; �����
    (ucs		. #x00EA)	; ê
    ))
(define-char
  '((name . "fullwidth latin small letter e with circumflex")
    (=>ucs		. #x00EA)	; ê
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter e with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH CIRCUMFLEX")
      (ucs		  . #x00EA)	; ê
      ))
    (chinese-gb2312	. #x283A)	; �����
    (japanese-jisx0212	. #x2B34)	; �����
    (=jis-x0213-1-2000	. #x2960)	; �����
    (=jef-china3	. #x86C6)	; �����
    (ucs-jis		. #x00EA)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0308)
    (->fullwidth
     ((name . "fullwidth latin small letter e with diaeresis")
      (japanese-jisx0212  . #x2B33)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH DIAERESIS")
      (ucs		  . #x00CB)	; Ë
      ))
    (latin-iso8859-1	. #xEB)	; �����
    (latin-iso8859-2	. #xEB)	; �����
    (latin-iso8859-3	. #xEB)	; �����
    (latin-iso8859-4	. #xEB)	; �����
    (latin-iso8859-9	. #xEB)	; �����
    (ucs		. #x00EB)	; ë
    ))
(define-char
  '((name . "fullwidth latin small letter e with diaeresis")
    (=>ucs		. #x00EB)	; ë
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter e with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH DIAERESIS")
      (ucs		  . #x00EB)	; ë
      ))
    (japanese-jisx0212	. #x2B33)	; �����
    (=jis-x0213-1-2000	. #x2961)	; �����
    (=jef-china3	. #x88D4)	; �����
    (ucs-jis		. #x00EB)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0300)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with grave")
      (chinese-gb2312	  . #x282C)	; �����
      (japanese-jisx0212  . #x2B40)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH GRAVE")
      (ucs		  . #x00CC)	; Ì
      ))
    (latin-iso8859-1	. #xEC)	; �����
    (latin-iso8859-3	. #xEC)	; �����
    (latin-iso8859-9	. #xEC)	; �����
    (latin-tcvn5712	. #xD7)	; �����
    (latin-viscii-lower . #xEC)	; �����
    (latin-viscii	. #xEC)	; �����
    (ucs		. #x00EC)	; ì
    ))
(define-char
  '((name		. "fullwidth latin small letter i with grave")
    (=>ucs		. #x00EC)	; ì
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter i with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH GRAVE")
      (ucs		  . #x00EC)	; ì
      ))
    (chinese-gb2312	. #x282C)	; �����
    (japanese-jisx0212	. #x2B40)	; �����
    (=jis-x0213-1-2000	. #x2962)	; �����
    (ucs-jis		. #x00EC)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with acute")
      (chinese-gb2312	  . #x282A)	; �����
      (japanese-jisx0212  . #x2B3F)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH ACUTE")
      (ucs		  . #x00CD)	; Í
      ))
    (latin-iso8859-1	. #xED)	; �����
    (latin-iso8859-2	. #xED)	; �����
    (latin-iso8859-3	. #xED)	; �����
    (latin-iso8859-4	. #xED)	; �����
    (latin-iso8859-9	. #xED)	; �����
    (latin-tcvn5712	. #xDD)	; �����
    (latin-viscii-lower . #xED)	; �����
    (latin-viscii	. #xED)	; �����
    (ucs		. #x00ED)	; í
    ))
(define-char
  '((name		. "fullwidth latin small letter i with acute")
    (=>ucs		. #x00ED)	; í
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter i with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH ACUTE")
      (ucs		  . #x00ED)	; í
      ))
    (chinese-gb2312	. #x282A)	; �����
    (japanese-jisx0212	. #x2B3F)	; �����
    (=jis-x0213-1-2000	. #x2963)	; �����
    (ucs-jis		. #x00ED)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter i with circumflex")
      (japanese-jisx0212  . #x2B42)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
      (ucs		  . #x00CE)	; Î
      ))
    (latin-iso8859-1	. #xEE)	; �����
    (latin-iso8859-2	. #xEE)	; �����
    (latin-iso8859-3	. #xEE)	; �����
    (latin-iso8859-4	. #xEE)	; �����
    (latin-iso8859-9	. #xEE)	; �����
    (ucs		. #x00EE)	; î
    ))
(define-char
  '((name . "fullwidth latin small letter i with circumflex")
    (=>ucs		. #x00EE)	; î
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter i with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH CIRCUMFLEX")
      (ucs		  . #x00EE)	; î
      ))
    (japanese-jisx0212	. #x2B42)	; �����
    (=jis-x0213-1-2000	. #x2964)	; �����
    (ucs-jis		. #x00EE)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0308)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH DIAERESIS")
      (ucs		  . #x00CF)	; Ï
      ))
    (latin-iso8859-1	. #xEF)	; �����
    (latin-iso8859-3	. #xEF)	; �����
    (latin-iso8859-9	. #xEF)	; �����
    (ucs		. #x00EF)	; ï
    ))
(define-char
  '((name . "fullwidth latin small letter i with diaeresis")
    (=>ucs		. #x00EF)	; ï
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0308)
    (->uppercase
     ((name . "fullwidth latin capital letter i with diaeresis")
      ))
    (japanese-jisx0212	. #x2B41)	; �����
    (=jis-x0213-1-2000	. #x2965)	; �����
    (ucs-jis		. #x00EF)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ETH")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER ETH")
      (ucs		  . #x00D0)	; Ð
      ))
    (latin-iso8859-1	. #xF0)	; �����
    (ipa		. #xC9)	; �����
    (ucs		. #x00F0)	; ð
    ))
(define-char
  '((name		. "fullwidth latin small letter eth")
    (=>ucs		. #x00F0)	; ð
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase
     ((name		  . "fullwidth latin capital letter eth")
      ))
    (korean-ksc5601	. #x2923)	; �����
    (japanese-jisx0212	. #x2943)	; �����
    (=jis-x0213-1-2000	. #x2966)	; �����
    (=jef-china3	. #x83B4)	; �����
    (ucs-jis		. #x00F0)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter n with tilde")
      (japanese-jisx0212  . #x2B50)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH TILDE")
      (ucs		  . #x00D1)	; Ñ
      ))
    (latin-iso8859-1	. #xF1)	; �����
    (latin-iso8859-3	. #xF1)	; �����
    (latin-iso8859-9	. #xF1)	; �����
    (ucs		. #x00F1)	; ñ
    ))
(define-char
  '((name		. "fullwidth latin small letter n with tilde")
    (=>ucs		. #x00F1)	; ñ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter n with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH TILDE")
      (ucs		  . #x00F1)	; ñ
      ))
    (japanese-jisx0212	. #x2B50)	; �����
    (=jis-x0213-1-2000	. #x2967)	; �����
    (=jef-china3	. #x86F3)	; �����
    (ucs-jis		. #x00F1)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0300)
    (->fullwidth
     ((name		  . "fullwidth latin small letter o with grave")
      (chinese-gb2312	  . #x2830)	; �����
      (japanese-jisx0212  . #x2B52)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH GRAVE")
      (ucs		  . #x00D2)	; Ò
      ))
    (latin-iso8859-1	. #xF2)	; �����
    (latin-iso8859-3	. #xF2)	; �����
    (latin-iso8859-9	. #xF2)	; �����
    (latin-tcvn5712	. #xDF)	; �����
    (latin-viscii-lower . #xF2)	; �����
    (latin-viscii	. #xF2)	; �����
    (ucs		. #x00F2)	; ò
    ))
(define-char
  '((name		. "fullwidth latin small letter o with grave")
    (=>ucs		. #x00F2)	; ò
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "fullwidth latin small letter o with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH GRAVE")
      (ucs		  . #x00F2)	; ò
      ))
    (chinese-gb2312	. #x2830)	; �����
    (japanese-jisx0212	. #x2B52)	; �����
    (=jis-x0213-1-2000	. #x2968)	; �����
    (=jef-china3	. #x85C5)	; �����
    (ucs-jis		. #x00F2)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter o with acute")
      (chinese-gb2312	  . #x282E)	; �����
      (japanese-jisx0212  . #x2B51)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH ACUTE")
      (ucs		  . #x00D3)	; Ó
      ))
    (latin-iso8859-1	. #xF3)	; �����
    (latin-iso8859-2	. #xF3)	; �����
    (latin-iso8859-3	. #xF3)	; �����
    (latin-iso8859-9	. #xF3)	; �����
    (latin-tcvn5712	. #xE3)	; �����
    (latin-viscii-lower . #xF3)	; �����
    (latin-viscii	. #xF3)	; �����
    (ucs		. #x00F3)	; ó
    ))
(define-char
  '((name		. "fullwidth latin small letter o with acute")
    (=>ucs		. #x00F3)	; ó
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter o with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH ACUTE")
      (ucs		  . #x00F3)	; ó
      ))
    (chinese-gb2312	. #x282E)	; �����
    (japanese-jisx0212	. #x2B51)	; �����
    (=jis-x0213-1-2000	. #x2969)	; �����
    (=jef-china3	. #x85F6)	; �����
    (ucs-jis		. #x00F3)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter o with circumflex")
      (japanese-jisx0212  . #x2B54)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
      (ucs		  . #x00D4)	; Ô
      ))
    (latin-iso8859-1	. #xF4)	; �����
    (latin-iso8859-2	. #xF4)	; �����
    (latin-iso8859-3	. #xF4)	; �����
    (latin-iso8859-4	. #xF4)	; �����
    (latin-iso8859-9	. #xF4)	; �����
    (latin-tcvn5712	. #xAB)	; �����
    (latin-viscii-lower . #xF4)	; �����
    (latin-viscii	. #xF4)	; �����
    (ucs		. #x00F4)	; ô
    ))
(define-char
  '((name . "fullwidth latin small letter o with circumflex")
    (=>ucs		. #x00F4)	; ô
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter o with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH CIRCUMFLEX")
      (ucs		  . #x00F4)	; ô
      ))
    (japanese-jisx0212	. #x2B54)	; �����
    (=jis-x0213-1-2000	. #x296A)	; �����
    (=jef-china3	. #x86CC)	; �����
    (ucs-jis		. #x00F4)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter o with tilde")
      (japanese-jisx0212  . #x2B58)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH TILDE")
      (ucs		  . #x00D5)	; Õ
      ))
    (latin-iso8859-1	. #xF5)	; �����
    (latin-iso8859-4	. #xF5)	; �����
    (latin-iso8859-9	. #xF5)	; �����
    (latin-tcvn5712	. #xE2)	; �����
    (latin-viscii-lower . #xF5)	; �����
    (latin-viscii	. #xF5)	; �����
    (ucs		. #x00F5)	; õ
    ))
(define-char
  '((name		. "fullwidth latin small letter o with tilde")
    (=>ucs		. #x00F5)	; õ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter o with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH TILDE")
      (ucs		  . #x00F5)	; õ
      ))
    (japanese-jisx0212	. #x2B58)	; �����
    (=jis-x0213-1-2000	. #x296B)	; �����
    (=jef-china3	. #x86F4)	; �����
    (ucs-jis		. #x00F5)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0308)
    (->fullwidth
     ((name . "fullwidth latin small letter o with diaeresis")
      (japanese-jisx0212  . #x2B53)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH DIAERESIS")
      (ucs		  . #x00D6)	; Ö
      ))
    (latin-iso8859-1	. #xF6)	; �����
    (latin-iso8859-2	. #xF6)	; �����
    (latin-iso8859-3	. #xF6)	; �����
    (latin-iso8859-4	. #xF6)	; �����
    (latin-iso8859-9	. #xF6)	; �����
    (ucs		. #x00F6)	; ö
    ))
(define-char
  '((name . "fullwidth latin small letter o with diaeresis")
    (=>ucs		. #x00F6)	; ö
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter o with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH DIAERESIS")
      (ucs		  . #x00F6)	; ö
      ))
    (japanese-jisx0212	. #x2B53)	; �����
    (=jis-x0213-1-2000	. #x296C)	; �����
    (=jef-china3	. #x88D8)	; �����
    (ucs-jis		. #x00F6)	; �����
    ))
(define-char
  '((name		. "DIVISION SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth division sign")
      (chinese-gb2312	  . #x2142)	; �����
      (korean-ksc5601	  . #x2140)	; �����
      (chinese-cns11643-1 . #x2233)	; �����
      ))
    (latin-iso8859-1	. #xF7)	; �����
    (latin-iso8859-2	. #xF7)	; �����
    (latin-iso8859-3	. #xF7)	; �����
    (latin-iso8859-4	. #xF7)	; �����
    (hebrew-iso8859-8	. #xBA)	; �����
    (latin-iso8859-9	. #xF7)	; �����
    (ucs		. #x00F7)	; ÷
    ))
(define-char
  '((name		. "fullwidth division sign")
    (=>ucs		. #x00F7)	; ÷
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "DIVISION SIGN")
      (ucs		  . #x00F7)	; ÷
      ))
    (chinese-gb2312	. #x2142)	; �����
    (=jis-x0208		. #x2160)	; �����
    (korean-ksc5601	. #x2140)	; �����
    (chinese-cns11643-1 . #x2233)	; �����
    (chinese-big5	. #xA1D2)	; ������
    (ucs-jis		. #x00F7)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter o with stroke")
      (korean-ksc5601	  . #x292A)	; �����
      (japanese-jisx0212  . #x294C)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH STROKE")
      (ucs		  . #x00D8)	; Ø
      ))
    (latin-iso8859-1	. #xF8)	; �����
    (latin-iso8859-4	. #xF8)	; �����
    (latin-iso8859-9	. #xF8)	; �����
    (ipa		. #xAF)	; �����
    (ucs		. #x00F8)	; ø
    ))
(define-char
  '((name		. "fullwidth latin small letter o with stroke")
    (=>ucs		. #x00F8)	; ø
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter o with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH STROKE")
      (ucs		  . #x00F8)	; ø
      ))
    (korean-ksc5601	. #x292A)	; �����
    (japanese-jisx0212	. #x294C)	; �����
    (=jis-x0213-1-2000	. #x296D)	; �����
    (=jef-china3	. #x83AD)	; �����
    (ucs-jis		. #x00F8)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0300)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with grave")
      (chinese-gb2312	  . #x2834)	; �����
      (japanese-jisx0212  . #x2B63)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH GRAVE")
      (ucs		  . #x00D9)	; Ù
      ))
    (latin-iso8859-1	. #xF9)	; �����
    (latin-iso8859-3	. #xF9)	; �����
    (latin-iso8859-9	. #xF9)	; �����
    (latin-tcvn5712	. #xEF)	; �����
    (latin-viscii-lower . #xF9)	; �����
    (latin-viscii	. #xF9)	; �����
    (ucs		. #x00F9)	; ù
    ))
(define-char
  '((name		. "fullwidth latin small letter u with grave")
    (=>ucs		. #x00F9)	; ù
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter u with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH GRAVE")
      (ucs		  . #x00F9)	; ù
      ))
    (chinese-gb2312	. #x2834)	; �����
    (japanese-jisx0212	. #x2B63)	; �����
    (=jis-x0213-1-2000	. #x296E)	; �����
    (=jef-china3	. #x85C7)	; �����
    (ucs-jis		. #x00F9)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with acute")
      (chinese-gb2312	  . #x2832)	; �����
      (japanese-jisx0212  . #x2B62)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH ACUTE")
      (ucs		  . #x00DA)	; Ú
      ))
    (latin-iso8859-1	. #xFA)	; �����
    (latin-iso8859-2	. #xFA)	; �����
    (latin-iso8859-3	. #xFA)	; �����
    (latin-iso8859-4	. #xFA)	; �����
    (latin-iso8859-9	. #xFA)	; �����
    (latin-tcvn5712	. #xF3)	; �����
    (latin-viscii-lower . #xFA)	; �����
    (latin-viscii	. #xFA)	; �����
    (ucs		. #x00FA)	; ú
    ))
(define-char
  '((name		. "fullwidth latin small letter u with acute")
    (=>ucs		. #x00FA)	; ú
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter u with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH ACUTE")
      (ucs		  . #x00FA)	; ú
      ))
    (chinese-gb2312	. #x2832)	; �����
    (japanese-jisx0212	. #x2B62)	; �����
    (=jis-x0213-1-2000	. #x296F)	; �����
    (=jef-china3	. #x85FC)	; �����
    (ucs-jis		. #x00FA)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter u with circumflex")
      (japanese-jisx0212  . #x2B65)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
      (ucs		  . #x00DB)	; Û
      ))
    (latin-iso8859-1	. #xFB)	; �����
    (latin-iso8859-3	. #xFB)	; �����
    (latin-iso8859-4	. #xFB)	; �����
    (latin-iso8859-9	. #xFB)	; �����
    (ucs		. #x00FB)	; û
    ))
(define-char
  '((name . "fullwidth latin small letter u with circumflex")
    (=>ucs		. #x00FB)	; û
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter u with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH CIRCUMFLEX")
      (ucs		  . #x00FB)	; û
      ))
    (japanese-jisx0212	. #x2B65)	; �����
    (=jis-x0213-1-2000	. #x2970)	; �����
    (=jef-china3	. #x86CE)	; �����
    (ucs-jis		. #x00FB)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0308)
    (->fullwidth
     ((name . "fullwidth latin small letter u with diaeresis")
      (chinese-gb2312	  . #x2839)	; �����
      (japanese-jisx0212  . #x2B64)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH DIAERESIS")
      (ucs		  . #x00DC)	; Ü
      ))
    (latin-iso8859-1	. #xFC)	; �����
    (latin-iso8859-2	. #xFC)	; �����
    (latin-iso8859-3	. #xFC)	; �����
    (latin-iso8859-4	. #xFC)	; �����
    (latin-iso8859-9	. #xFC)	; �����
    (ucs		. #x00FC)	; ü
    ))
(define-char
  '((name . "fullwidth latin small letter u with diaeresis")
    (=>ucs		. #x00FC)	; ü
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter u with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH DIAERESIS")
      (ucs		  . #x00FC)	; ü
      ))
    (chinese-gb2312	. #x2839)	; �����
    (japanese-jisx0212	. #x2B64)	; �����
    (=jis-x0213-1-2000	. #x2971)	; �����
    (=jef-china3	. #x88DB)	; �����
    (ucs-jis		. #x00FC)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter y with acute")
      (japanese-jisx0212  . #x2B72)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y WITH ACUTE")
      (ucs		  . #x00DD)	; Ý
      ))
    (latin-iso8859-1	. #xFD)	; �����
    (latin-iso8859-2	. #xFD)	; �����
    (latin-tcvn5712	. #xFD)	; �����
    (latin-viscii-lower . #xFD)	; �����
    (latin-viscii	. #xFD)	; �����
    (ucs		. #x00FD)	; ý
    ))
(define-char
  '((name		. "fullwidth latin small letter y with acute")
    (=>ucs		. #x00FD)	; ý
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "fullwidth latin small letter y with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Y WITH ACUTE")
      (ucs		  . #x00FD)	; ý
      ))
    (japanese-jisx0212	. #x2B72)	; �����
    (=jis-x0213-1-2000	. #x2972)	; �����
    (=jef-china3	. #x86A1)	; �����
    (ucs-jis		. #x00FD)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER THORN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->fullwidth
     ((name		  . "fullwidth latin small letter thorn")
      (korean-ksc5601	  . #x292D)	; �����
      (japanese-jisx0212  . #x2950)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER THORN")
      (ucs		  . #x00DE)	; Þ
      ))
    (latin-iso8859-1	. #xFE)	; �����
    (ucs		. #x00FE)	; þ
    ))
(define-char
  '((name		. "fullwidth latin small letter thorn")
    (=>ucs		. #x00FE)	; þ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase
     ((name		  . "fullwidth latin capital letter thorn")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER THORN")
      (ucs		  . #x00FE)	; þ
      ))
    (korean-ksc5601	. #x292D)	; �����
    (japanese-jisx0212	. #x2950)	; �����
    (=jis-x0213-1-2000	. #x2973)	; �����
    (=jef-china3	. #x83AF)	; �����
    (ucs-jis		. #x00FE)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0308)
    (->fullwidth
     ((name . "fullwidth latin small letter y with diaeresis")
      (japanese-jisx0212  . #x2B73)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y WITH DIAERESIS")
      (ucs		  . #x0178)	; Ÿ
      ))
    (latin-iso8859-1	. #xFF)	; �����
    (latin-iso8859-9	. #xFF)	; �����
    (ucs		. #x00FF)	; ÿ
    ))
(define-char
  '((name . "fullwidth latin small letter y with diaeresis")
    (=>ucs		. #x00FF)	; ÿ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter y with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Y WITH DIAERESIS")
      (ucs		  . #x00FF)	; ÿ
      ))
    (japanese-jisx0212	. #x2B73)	; �����
    (=jis-x0213-1-2000	. #x2974)	; �����
    (ucs-jis		. #x00FF)	; �����
    ))
