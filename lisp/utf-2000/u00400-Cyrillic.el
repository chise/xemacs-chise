(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE WITH GRAVE")
    (ucs		. #x0400)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0415 #x0300)
    (->lowercase	#x0450)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IO")
    (ucs		. #x0401)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0415 #x0308)
    (->lowercase	#x0451)
    (cyrillic-iso8859-5 #x21)	; -L¡-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER IO")
    (->ucs		. #x0401)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0401)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER IO")))
    (japanese-jisx0208-1978	#x27 #x27)	; $(B''(B
    (chinese-gb2312		#x27 #x27)	; $(A''(B
    (japanese-jisx0208		#x27 #x27)	; $(B''(B
    (korean-ksc5601		#x2C #x27)	; $(C,'(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DJE")
    (ucs		. #x0402)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->lowercase	#x0452)
    (cyrillic-iso8859-5 #x22)	; -L¢-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER DJE")
    (->ucs		. #x0402)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->decomposition	wide #x0402)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER DJE")))
    (japanese-jisx0212	#x27 #x42)	; $(D'B(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GJE")
    (ucs		. #x0403)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0413 #x0301)
    (->lowercase	#x0453)
    (cyrillic-iso8859-5 #x23)	; -L£-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER GJE")
    (->ucs		. #x0403)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0403)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER GJE")))
    (japanese-jisx0212	#x27 #x43)	; $(D'C(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
    (ucs		. #x0404)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0454)
    (cyrillic-iso8859-5 #x24)	; -L¤-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER UKRAINIAN IE")
    (->ucs		. #x0404)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0404)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER UKRAINIAN IE")))
    (japanese-jisx0212	#x27 #x44)	; $(D'D(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DZE")
    (ucs		. #x0405)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0455)
    (cyrillic-iso8859-5 #x25)	; -L¥-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER DZE")
    (->ucs		. #x0405)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0405)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER DZE")))
    (japanese-jisx0212	#x27 #x45)	; $(D'E(B
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
    (ucs		. #x0406)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0456)
    (cyrillic-iso8859-5 #x26)	; -L¦-A
    ))
(define-char
  '((name . "FULLWIDTH CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
    (->ucs		. #x0406)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0406)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")))
    (japanese-jisx0212	#x27 #x46)	; $(D'F(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YI")
    (ucs		. #x0407)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Ukrainian")
    (->decomposition	#x0406 #x0308)
    (->lowercase	#x0457)
    (cyrillic-iso8859-5 #x27)	; -L§-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER YI")
    (->ucs		. #x0407)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Ukrainian")
    (->decomposition	wide #x0407)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER YI")))
    (japanese-jisx0212	#x27 #x47)	; $(D'G(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER JE")
    (ucs		. #x0408)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0458)
    (cyrillic-iso8859-5 #x28)	; -L¨-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER JE")
    (->ucs		. #x0408)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0408)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER JE")))
    (japanese-jisx0212	#x27 #x48)	; $(D'H(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER LJE")
    (ucs		. #x0409)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0459)
    (cyrillic-iso8859-5 #x29)	; -L©-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER LJE")
    (->ucs		. #x0409)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0409)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER LJE")))
    (japanese-jisx0212	#x27 #x49)	; $(D'I(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER NJE")
    (ucs		. #x040A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x045A)
    (cyrillic-iso8859-5 #x2A)	; -Lª-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER NJE")
    (->ucs		. #x040A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x040A)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER NJE")))
    (japanese-jisx0212	#x27 #x4A)	; $(D'J(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TSHE")
    (ucs		. #x040B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->lowercase	#x045B)
    (cyrillic-iso8859-5 #x2B)	; -L«-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER TSHE")
    (->ucs		. #x040B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER TSHE")))
    (japanese-jisx0212	#x27 #x4B)	; $(D'K(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KJE")
    (ucs		. #x040C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x041A #x0301)
    (->lowercase	#x045C)
    (cyrillic-iso8859-5 #x2C)	; -L¬-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER KJE")
    (->ucs		. #x040C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x040C)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER KJE")))
    (japanese-jisx0212	#x27 #x4C)	; $(D'L(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I WITH GRAVE")
    (ucs		. #x040D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0300)
    (->lowercase	#x045D)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHORT U")
    (ucs		. #x040E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Byelorussian")
    (->decomposition	#x0423 #x0306)
    (->lowercase	#x045E)
    (cyrillic-iso8859-5 #x2E)	; -L®-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT U")
    (->ucs		. #x040E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Byelorussian")
    (->decomposition	wide #x040E)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER SHORT U")))
    (japanese-jisx0212	#x27 #x4D)	; $(D'M(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DZHE")
    (ucs		. #x040F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x045F)
    (cyrillic-iso8859-5 #x2F)	; -L¯-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER DZHE")
    (->ucs		. #x040F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x040F)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER DZHE")))
    (japanese-jisx0212	#x27 #x4E)	; $(D'N(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A")
    (ucs		. #x0410)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0430)
    (cyrillic-iso8859-5 #x30)	; -L°-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER A")
    (->ucs		. #x0410)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0410)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER A")))
    (japanese-jisx0208-1978	#x27 #x21)	; $(B'!(B
    (chinese-gb2312		#x27 #x21)	; $(A'!(B
    (japanese-jisx0208		#x27 #x21)	; $(B'!(B
    (korean-ksc5601		#x2C #x21)	; $(C,!(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BE")
    (ucs		. #x0411)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0431)
    (cyrillic-iso8859-5 #x31)	; -L±-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER BE")
    (->ucs		. #x0411)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0411)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER BE")))
    (japanese-jisx0208-1978	#x27 #x22)	; $(B'"(B
    (chinese-gb2312		#x27 #x22)	; $(A'"(B
    (japanese-jisx0208		#x27 #x22)	; $(B'"(B
    (korean-ksc5601		#x2C #x22)	; $(C,"(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER VE")
    (ucs		. #x0412)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0432)
    (cyrillic-iso8859-5 #x32)	; -L²-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER VE")
    (->ucs		. #x0412)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0412)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER VE")))
    (japanese-jisx0208-1978	#x27 #x23)	; $(B'#(B
    (chinese-gb2312		#x27 #x23)	; $(A'#(B
    (japanese-jisx0208		#x27 #x23)	; $(B'#(B
    (korean-ksc5601		#x2C #x23)	; $(C,#(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE")
    (ucs		. #x0413)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0433)
    (cyrillic-iso8859-5 #x33)	; -L³-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER GHE")
    (->ucs		. #x0413)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0413)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER GHE")))
    (japanese-jisx0208-1978	#x27 #x24)	; $(B'$(B
    (chinese-gb2312		#x27 #x24)	; $(A'$(B
    (japanese-jisx0208		#x27 #x24)	; $(B'$(B
    (korean-ksc5601		#x2C #x24)	; $(C,$(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DE")
    (ucs		. #x0414)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0434)
    (cyrillic-iso8859-5 #x34)	; -L´-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER DE")
    (->ucs		. #x0414)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0414)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER DE")))
    (japanese-jisx0208-1978	#x27 #x25)	; $(B'%(B
    (chinese-gb2312		#x27 #x25)	; $(A'%(B
    (japanese-jisx0208		#x27 #x25)	; $(B'%(B
    (korean-ksc5601		#x2C #x25)	; $(C,%(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE")
    (ucs		. #x0415)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0435)
    (cyrillic-iso8859-5 #x35)	; -Lµ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER IE")
    (->ucs		. #x0415)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0415)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER IE")))
    (japanese-jisx0208-1978	#x27 #x26)	; $(B'&(B
    (chinese-gb2312		#x27 #x26)	; $(A'&(B
    (japanese-jisx0208		#x27 #x26)	; $(B'&(B
    (korean-ksc5601		#x2C #x26)	; $(C,&(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE")
    (ucs		. #x0416)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0436)
    (cyrillic-iso8859-5 #x36)	; -L¶-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER ZHE")
    (->ucs		. #x0416)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0416)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER ZHE")))
    (japanese-jisx0208-1978	#x27 #x28)	; $(B'((B
    (chinese-gb2312		#x27 #x28)	; $(A'((B
    (japanese-jisx0208		#x27 #x28)	; $(B'((B
    (korean-ksc5601		#x2C #x28)	; $(C,((B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE")
    (ucs		. #x0417)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0437)
    (cyrillic-iso8859-5 #x37)	; -L·-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER ZE")
    (->ucs		. #x0417)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0417)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER ZE")))
    (japanese-jisx0208-1978	#x27 #x29)	; $(B')(B
    (chinese-gb2312		#x27 #x29)	; $(A')(B
    (japanese-jisx0208		#x27 #x29)	; $(B')(B
    (korean-ksc5601		#x2C #x29)	; $(C,)(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I")
    (ucs		. #x0418)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0438)
    (cyrillic-iso8859-5 #x38)	; -L¸-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER I")
    (->ucs		. #x0418)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0418)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER I")))
    (japanese-jisx0208-1978	#x27 #x2A)	; $(B'*(B
    (chinese-gb2312		#x27 #x2A)	; $(A'*(B
    (japanese-jisx0208		#x27 #x2A)	; $(B'*(B
    (korean-ksc5601		#x2C #x2A)	; $(C,*(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHORT I")
    (ucs		. #x0419)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0306)
    (->lowercase	#x0439)
    (cyrillic-iso8859-5 #x39)	; -L¹-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT I")
    (->ucs		. #x0419)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0419)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER SHORT I")))
    (japanese-jisx0208-1978	#x27 #x2B)	; $(B'+(B
    (chinese-gb2312		#x27 #x2B)	; $(A'+(B
    (japanese-jisx0208		#x27 #x2B)	; $(B'+(B
    (korean-ksc5601		#x2C #x2B)	; $(C,+(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA")
    (ucs		. #x041A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x043A)
    (cyrillic-iso8859-5 #x3A)	; -Lº-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER KA")
    (->ucs		. #x041A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041A)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER KA")))
    (japanese-jisx0208-1978	#x27 #x2C)	; $(B',(B
    (chinese-gb2312		#x27 #x2C)	; $(A',(B
    (japanese-jisx0208		#x27 #x2C)	; $(B',(B
    (korean-ksc5601		#x2C #x2C)	; $(C,,(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EL")
    (ucs		. #x041B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x043B)
    (cyrillic-iso8859-5 #x3B)	; -L»-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER EL")
    (->ucs		. #x041B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041B)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER EL")))
    (japanese-jisx0208-1978	#x27 #x2D)	; $(B'-(B
    (chinese-gb2312		#x27 #x2D)	; $(A'-(B
    (japanese-jisx0208		#x27 #x2D)	; $(B'-(B
    (korean-ksc5601		#x2C #x2D)	; $(C,-(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EM")
    (ucs		. #x041C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x043C)
    (cyrillic-iso8859-5 #x3C)	; -L¼-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER EM")
    (->ucs		. #x041C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041C)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER EM")))
    (japanese-jisx0208-1978	#x27 #x2E)	; $(B'.(B
    (chinese-gb2312		#x27 #x2E)	; $(A'.(B
    (japanese-jisx0208		#x27 #x2E)	; $(B'.(B
    (korean-ksc5601		#x2C #x2E)	; $(C,.(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN")
    (ucs		. #x041D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x043D)
    (cyrillic-iso8859-5 #x3D)	; -L½-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER EN")
    (->ucs		. #x041D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041D)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER EN")))
    (japanese-jisx0208-1978	#x27 #x2F)	; $(B'/(B
    (chinese-gb2312		#x27 #x2F)	; $(A'/(B
    (japanese-jisx0208		#x27 #x2F)	; $(B'/(B
    (korean-ksc5601		#x2C #x2F)	; $(C,/(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER O")
    (ucs		. #x041E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x043E)
    (cyrillic-iso8859-5 #x3E)	; -L¾-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER O")
    (->ucs		. #x041E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041E)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER O")))
    (japanese-jisx0208-1978	#x27 #x30)	; $(B'0(B
    (chinese-gb2312		#x27 #x30)	; $(A'0(B
    (japanese-jisx0208		#x27 #x30)	; $(B'0(B
    (korean-ksc5601		#x2C #x30)	; $(C,0(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PE")
    (ucs		. #x041F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x043F)
    (cyrillic-iso8859-5 #x3F)	; -L¿-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER PE")
    (->ucs		. #x041F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041F)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER PE")))
    (japanese-jisx0208-1978	#x27 #x31)	; $(B'1(B
    (chinese-gb2312		#x27 #x31)	; $(A'1(B
    (japanese-jisx0208		#x27 #x31)	; $(B'1(B
    (korean-ksc5601		#x2C #x31)	; $(C,1(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ER")
    (ucs		. #x0420)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0440)
    (cyrillic-iso8859-5 #x40)	; -LÀ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER ER")
    (->ucs		. #x0420)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0420)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER ER")))
    (japanese-jisx0208-1978	#x27 #x32)	; $(B'2(B
    (chinese-gb2312		#x27 #x32)	; $(A'2(B
    (japanese-jisx0208		#x27 #x32)	; $(B'2(B
    (korean-ksc5601		#x2C #x32)	; $(C,2(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ES")
    (ucs		. #x0421)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0441)
    (cyrillic-iso8859-5 #x41)	; -LÁ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER ES")
    (->ucs		. #x0421)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0421)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER ES")))
    (japanese-jisx0208-1978	#x27 #x33)	; $(B'3(B
    (chinese-gb2312		#x27 #x33)	; $(A'3(B
    (japanese-jisx0208		#x27 #x33)	; $(B'3(B
    (korean-ksc5601		#x2C #x33)	; $(C,3(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TE")
    (ucs		. #x0422)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0442)
    (cyrillic-iso8859-5 #x42)	; -LÂ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER TE")
    (->ucs		. #x0422)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0422)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER TE")))
    (japanese-jisx0208-1978	#x27 #x34)	; $(B'4(B
    (chinese-gb2312		#x27 #x34)	; $(A'4(B
    (japanese-jisx0208		#x27 #x34)	; $(B'4(B
    (korean-ksc5601		#x2C #x34)	; $(C,4(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U")
    (ucs		. #x0423)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0443)
    (cyrillic-iso8859-5 #x43)	; -LÃ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER U")
    (->ucs		. #x0423)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0423)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER U")))
    (japanese-jisx0208-1978	#x27 #x35)	; $(B'5(B
    (chinese-gb2312		#x27 #x35)	; $(A'5(B
    (japanese-jisx0208		#x27 #x35)	; $(B'5(B
    (korean-ksc5601		#x2C #x35)	; $(C,5(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EF")
    (ucs		. #x0424)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0444)
    (cyrillic-iso8859-5 #x44)	; -LÄ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER EF")
    (->ucs		. #x0424)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0424)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER EF")))
    (japanese-jisx0208-1978	#x27 #x36)	; $(B'6(B
    (chinese-gb2312		#x27 #x36)	; $(A'6(B
    (japanese-jisx0208		#x27 #x36)	; $(B'6(B
    (korean-ksc5601		#x2C #x36)	; $(C,6(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HA")
    (ucs		. #x0425)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0445)
    (cyrillic-iso8859-5 #x45)	; -LÅ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER HA")
    (->ucs		. #x0425)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0425)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER HA")))
    (japanese-jisx0208-1978	#x27 #x37)	; $(B'7(B
    (chinese-gb2312		#x27 #x37)	; $(A'7(B
    (japanese-jisx0208		#x27 #x37)	; $(B'7(B
    (korean-ksc5601		#x2C #x37)	; $(C,7(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TSE")
    (ucs		. #x0426)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0446)
    (cyrillic-iso8859-5 #x46)	; -LÆ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER TSE")
    (->ucs		. #x0426)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0426)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER TSE")))
    (japanese-jisx0208-1978	#x27 #x38)	; $(B'8(B
    (chinese-gb2312		#x27 #x38)	; $(A'8(B
    (japanese-jisx0208		#x27 #x38)	; $(B'8(B
    (korean-ksc5601		#x2C #x38)	; $(C,8(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE")
    (ucs		. #x0427)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0447)
    (cyrillic-iso8859-5 #x47)	; -LÇ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER CHE")
    (->ucs		. #x0427)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0427)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER CHE")))
    (japanese-jisx0208-1978	#x27 #x39)	; $(B'9(B
    (chinese-gb2312		#x27 #x39)	; $(A'9(B
    (japanese-jisx0208		#x27 #x39)	; $(B'9(B
    (korean-ksc5601		#x2C #x39)	; $(C,9(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHA")
    (ucs		. #x0428)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0448)
    (cyrillic-iso8859-5 #x48)	; -LÈ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SHA")
    (->ucs		. #x0428)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0428)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER SHA")))
    (japanese-jisx0208-1978	#x27 #x3A)	; $(B':(B
    (chinese-gb2312		#x27 #x3A)	; $(A':(B
    (japanese-jisx0208		#x27 #x3A)	; $(B':(B
    (korean-ksc5601		#x2C #x3A)	; $(C,:(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHCHA")
    (ucs		. #x0429)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0449)
    (cyrillic-iso8859-5 #x49)	; -LÉ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SHCHA")
    (->ucs		. #x0429)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0429)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER SHCHA")))
    (japanese-jisx0208-1978	#x27 #x3B)	; $(B';(B
    (chinese-gb2312		#x27 #x3B)	; $(A';(B
    (japanese-jisx0208		#x27 #x3B)	; $(B';(B
    (korean-ksc5601		#x2C #x3B)	; $(C,;(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HARD SIGN")
    (ucs		. #x042A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x044A)
    (cyrillic-iso8859-5 #x4A)	; -LÊ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")
    (->ucs		. #x042A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042A)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")))
    (japanese-jisx0208-1978	#x27 #x3C)	; $(B'<(B
    (chinese-gb2312		#x27 #x3C)	; $(A'<(B
    (japanese-jisx0208		#x27 #x3C)	; $(B'<(B
    (korean-ksc5601		#x2C #x3C)	; $(C,<(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YERU")
    (ucs		. #x042B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x044B)
    (cyrillic-iso8859-5 #x4B)	; -LË-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER YERU")
    (->ucs		. #x042B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042B)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER YERU")))
    (japanese-jisx0208-1978	#x27 #x3D)	; $(B'=(B
    (chinese-gb2312		#x27 #x3D)	; $(A'=(B
    (japanese-jisx0208		#x27 #x3D)	; $(B'=(B
    (korean-ksc5601		#x2C #x3D)	; $(C,=(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SOFT SIGN")
    (ucs		. #x042C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x044C)
    (cyrillic-iso8859-5 #x4C)	; -LÌ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SOFT SIGN")
    (->ucs		. #x042C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042C)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER SOFT SIGN")))
    (japanese-jisx0208-1978	#x27 #x3E)	; $(B'>(B
    (chinese-gb2312		#x27 #x3E)	; $(A'>(B
    (japanese-jisx0208		#x27 #x3E)	; $(B'>(B
    (korean-ksc5601		#x2C #x3E)	; $(C,>(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER E")
    (ucs		. #x042D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x044D)
    (cyrillic-iso8859-5 #x4D)	; -LÍ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER E")
    (->ucs		. #x042D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042D)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER E")))
    (japanese-jisx0208-1978	#x27 #x3F)	; $(B'?(B
    (chinese-gb2312		#x27 #x3F)	; $(A'?(B
    (japanese-jisx0208		#x27 #x3F)	; $(B'?(B
    (korean-ksc5601		#x2C #x3F)	; $(C,?(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YU")
    (ucs		. #x042E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x044E)
    (cyrillic-iso8859-5 #x4E)	; -LÎ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER YU")
    (->ucs		. #x042E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042E)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER YU")))
    (japanese-jisx0208-1978	#x27 #x40)	; $(B'@(B
    (chinese-gb2312		#x27 #x40)	; $(A'@(B
    (japanese-jisx0208		#x27 #x40)	; $(B'@(B
    (korean-ksc5601		#x2C #x40)	; $(C,@(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YA")
    (ucs		. #x042F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x044F)
    (cyrillic-iso8859-5 #x4F)	; -LÏ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER YA")
    (->ucs		. #x042F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042F)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER YA")))
    (japanese-jisx0208-1978	#x27 #x41)	; $(B'A(B
    (chinese-gb2312		#x27 #x41)	; $(A'A(B
    (japanese-jisx0208		#x27 #x41)	; $(B'A(B
    (korean-ksc5601		#x2C #x41)	; $(C,A(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A")
    (ucs		. #x0430)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0410)
    (->titlecase	#x0410)
    (cyrillic-iso8859-5 #x50)	; -LÐ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER A")
    (->ucs		. #x0430)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0430)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER A")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER A")))
    (japanese-jisx0208-1978	#x27 #x51)	; $(B'Q(B
    (chinese-gb2312		#x27 #x51)	; $(A'Q(B
    (japanese-jisx0208		#x27 #x51)	; $(B'Q(B
    (korean-ksc5601		#x2C #x51)	; $(C,Q(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BE")
    (ucs		. #x0431)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0411)
    (->titlecase	#x0411)
    (cyrillic-iso8859-5 #x51)	; -LÑ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER BE")
    (->ucs		. #x0431)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0431)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER BE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER BE")))
    (japanese-jisx0208-1978	#x27 #x52)	; $(B'R(B
    (chinese-gb2312		#x27 #x52)	; $(A'R(B
    (japanese-jisx0208		#x27 #x52)	; $(B'R(B
    (korean-ksc5601		#x2C #x52)	; $(C,R(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER VE")
    (ucs		. #x0432)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0412)
    (->titlecase	#x0412)
    (cyrillic-iso8859-5 #x52)	; -LÒ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER VE")
    (->ucs		. #x0432)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0432)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER VE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER VE")))
    (japanese-jisx0208-1978	#x27 #x53)	; $(B'S(B
    (chinese-gb2312		#x27 #x53)	; $(A'S(B
    (japanese-jisx0208		#x27 #x53)	; $(B'S(B
    (korean-ksc5601		#x2C #x53)	; $(C,S(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE")
    (ucs		. #x0433)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0413)
    (->titlecase	#x0413)
    (cyrillic-iso8859-5 #x53)	; -LÓ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER GHE")
    (->ucs		. #x0433)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0433)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER GHE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER GHE")))
    (japanese-jisx0208-1978	#x27 #x54)	; $(B'T(B
    (chinese-gb2312		#x27 #x54)	; $(A'T(B
    (japanese-jisx0208		#x27 #x54)	; $(B'T(B
    (korean-ksc5601		#x2C #x54)	; $(C,T(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DE")
    (ucs		. #x0434)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0414)
    (->titlecase	#x0414)
    (cyrillic-iso8859-5 #x54)	; -LÔ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER DE")
    (->ucs		. #x0434)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0434)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER DE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER DE")))
    (japanese-jisx0208-1978	#x27 #x55)	; $(B'U(B
    (chinese-gb2312		#x27 #x55)	; $(A'U(B
    (japanese-jisx0208		#x27 #x55)	; $(B'U(B
    (korean-ksc5601		#x2C #x55)	; $(C,U(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE")
    (ucs		. #x0435)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0415)
    (->titlecase	#x0415)
    (cyrillic-iso8859-5 #x55)	; -LÕ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER IE")
    (->ucs		. #x0435)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0435)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER IE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER IE")))
    (japanese-jisx0208-1978	#x27 #x56)	; $(B'V(B
    (chinese-gb2312		#x27 #x56)	; $(A'V(B
    (japanese-jisx0208		#x27 #x56)	; $(B'V(B
    (korean-ksc5601		#x2C #x56)	; $(C,V(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE")
    (ucs		. #x0436)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0416)
    (->titlecase	#x0416)
    (cyrillic-iso8859-5 #x56)	; -LÖ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER ZHE")
    (->ucs		. #x0436)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0436)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER ZHE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER ZHE")))
    (japanese-jisx0208-1978	#x27 #x58)	; $(B'X(B
    (chinese-gb2312		#x27 #x58)	; $(A'X(B
    (japanese-jisx0208		#x27 #x58)	; $(B'X(B
    (korean-ksc5601		#x2C #x58)	; $(C,X(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE")
    (ucs		. #x0437)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0417)
    (->titlecase	#x0417)
    (cyrillic-iso8859-5 #x57)	; -L×-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER ZE")
    (->ucs		. #x0437)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0437)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER ZE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER ZE")))
    (japanese-jisx0208-1978	#x27 #x59)	; $(B'Y(B
    (chinese-gb2312		#x27 #x59)	; $(A'Y(B
    (japanese-jisx0208		#x27 #x59)	; $(B'Y(B
    (korean-ksc5601		#x2C #x59)	; $(C,Y(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I")
    (ucs		. #x0438)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0418)
    (->titlecase	#x0418)
    (cyrillic-iso8859-5 #x58)	; -LØ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER I")
    (->ucs		. #x0438)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0438)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER I")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER I")))
    (japanese-jisx0208-1978	#x27 #x5A)	; $(B'Z(B
    (chinese-gb2312		#x27 #x5A)	; $(A'Z(B
    (japanese-jisx0208		#x27 #x5A)	; $(B'Z(B
    (korean-ksc5601		#x2C #x5A)	; $(C,Z(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHORT I")
    (ucs		. #x0439)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0306)
    (->uppercase	#x0419)
    (->titlecase	#x0419)
    (cyrillic-iso8859-5 #x59)	; -LÙ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SHORT I")
    (->ucs		. #x0439)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0439)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT I")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT I")))
    (japanese-jisx0208-1978	#x27 #x5B)	; $(B'[(B
    (chinese-gb2312		#x27 #x5B)	; $(A'[(B
    (japanese-jisx0208		#x27 #x5B)	; $(B'[(B
    (korean-ksc5601		#x2C #x5B)	; $(C,[(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA")
    (ucs		. #x043A)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x041A)
    (->titlecase	#x041A)
    (cyrillic-iso8859-5 #x5A)	; -LÚ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER KA")
    (->ucs		. #x043A)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043A)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER KA")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER KA")))
    (japanese-jisx0208-1978	#x27 #x5C)	; $(B'\(B
    (chinese-gb2312		#x27 #x5C)	; $(A'\(B
    (japanese-jisx0208		#x27 #x5C)	; $(B'\(B
    (korean-ksc5601		#x2C #x5C)	; $(C,\(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EL")
    (ucs		. #x043B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x041B)
    (->titlecase	#x041B)
    (cyrillic-iso8859-5 #x5B)	; -LÛ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER EL")
    (->ucs		. #x043B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043B)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER EL")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER EL")))
    (japanese-jisx0208-1978	#x27 #x5D)	; $(B'](B
    (chinese-gb2312		#x27 #x5D)	; $(A'](B
    (japanese-jisx0208		#x27 #x5D)	; $(B'](B
    (korean-ksc5601		#x2C #x5D)	; $(C,](B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EM")
    (ucs		. #x043C)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x041C)
    (->titlecase	#x041C)
    (cyrillic-iso8859-5 #x5C)	; -LÜ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER EM")
    (->ucs		. #x043C)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043C)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER EM")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER EM")))
    (japanese-jisx0208-1978	#x27 #x5E)	; $(B'^(B
    (chinese-gb2312		#x27 #x5E)	; $(A'^(B
    (japanese-jisx0208		#x27 #x5E)	; $(B'^(B
    (korean-ksc5601		#x2C #x5E)	; $(C,^(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN")
    (ucs		. #x043D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x041D)
    (->titlecase	#x041D)
    (cyrillic-iso8859-5 #x5D)	; -LÝ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER EN")
    (->ucs		. #x043D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043D)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER EN")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER EN")))
    (japanese-jisx0208-1978	#x27 #x5F)	; $(B'_(B
    (chinese-gb2312		#x27 #x5F)	; $(A'_(B
    (japanese-jisx0208		#x27 #x5F)	; $(B'_(B
    (korean-ksc5601		#x2C #x5F)	; $(C,_(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER O")
    (ucs		. #x043E)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x041E)
    (->titlecase	#x041E)
    (cyrillic-iso8859-5 #x5E)	; -LÞ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER O")
    (->ucs		. #x043E)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043E)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER O")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER O")))
    (japanese-jisx0208-1978	#x27 #x60)	; $(B'`(B
    (chinese-gb2312		#x27 #x60)	; $(A'`(B
    (japanese-jisx0208		#x27 #x60)	; $(B'`(B
    (korean-ksc5601		#x2C #x60)	; $(C,`(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PE")
    (ucs		. #x043F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x041F)
    (->titlecase	#x041F)
    (cyrillic-iso8859-5 #x5F)	; -Lß-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER PE")
    (->ucs		. #x043F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043F)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER PE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER PE")))
    (japanese-jisx0208-1978	#x27 #x61)	; $(B'a(B
    (chinese-gb2312		#x27 #x61)	; $(A'a(B
    (japanese-jisx0208		#x27 #x61)	; $(B'a(B
    (korean-ksc5601		#x2C #x61)	; $(C,a(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ER")
    (ucs		. #x0440)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0420)
    (->titlecase	#x0420)
    (cyrillic-iso8859-5 #x60)	; -Là-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER ER")
    (->ucs		. #x0440)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0440)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER ER")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER ER")))
    (japanese-jisx0208-1978	#x27 #x62)	; $(B'b(B
    (chinese-gb2312		#x27 #x62)	; $(A'b(B
    (japanese-jisx0208		#x27 #x62)	; $(B'b(B
    (korean-ksc5601		#x2C #x62)	; $(C,b(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ES")
    (ucs		. #x0441)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0421)
    (->titlecase	#x0421)
    (cyrillic-iso8859-5 #x61)	; -Lá-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER ES")
    (->ucs		. #x0441)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0441)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER ES")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER ES")))
    (japanese-jisx0208-1978	#x27 #x63)	; $(B'c(B
    (chinese-gb2312		#x27 #x63)	; $(A'c(B
    (japanese-jisx0208		#x27 #x63)	; $(B'c(B
    (korean-ksc5601		#x2C #x63)	; $(C,c(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TE")
    (ucs		. #x0442)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0422)
    (->titlecase	#x0422)
    (cyrillic-iso8859-5 #x62)	; -Lâ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER TE")
    (->ucs		. #x0442)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0442)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER TE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER TE")))
    (japanese-jisx0208-1978	#x27 #x64)	; $(B'd(B
    (chinese-gb2312		#x27 #x64)	; $(A'd(B
    (japanese-jisx0208		#x27 #x64)	; $(B'd(B
    (korean-ksc5601		#x2C #x64)	; $(C,d(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U")
    (ucs		. #x0443)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0423)
    (->titlecase	#x0423)
    (cyrillic-iso8859-5 #x63)	; -Lã-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER U")
    (->ucs		. #x0443)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0443)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER U")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER U")))
    (japanese-jisx0208-1978	#x27 #x65)	; $(B'e(B
    (chinese-gb2312		#x27 #x65)	; $(A'e(B
    (japanese-jisx0208		#x27 #x65)	; $(B'e(B
    (korean-ksc5601		#x2C #x65)	; $(C,e(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EF")
    (ucs		. #x0444)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0424)
    (->titlecase	#x0424)
    (cyrillic-iso8859-5 #x64)	; -Lä-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER EF")
    (->ucs		. #x0444)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0444)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER EF")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER EF")))
    (japanese-jisx0208-1978	#x27 #x66)	; $(B'f(B
    (chinese-gb2312		#x27 #x66)	; $(A'f(B
    (japanese-jisx0208		#x27 #x66)	; $(B'f(B
    (korean-ksc5601		#x2C #x66)	; $(C,f(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HA")
    (ucs		. #x0445)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0425)
    (->titlecase	#x0425)
    (cyrillic-iso8859-5 #x65)	; -Lå-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER HA")
    (->ucs		. #x0445)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0445)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER HA")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER HA")))
    (japanese-jisx0208-1978	#x27 #x67)	; $(B'g(B
    (chinese-gb2312		#x27 #x67)	; $(A'g(B
    (japanese-jisx0208		#x27 #x67)	; $(B'g(B
    (korean-ksc5601		#x2C #x67)	; $(C,g(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TSE")
    (ucs		. #x0446)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0426)
    (->titlecase	#x0426)
    (cyrillic-iso8859-5 #x66)	; -Læ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER TSE")
    (->ucs		. #x0446)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0446)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER TSE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER TSE")))
    (japanese-jisx0208-1978	#x27 #x68)	; $(B'h(B
    (chinese-gb2312		#x27 #x68)	; $(A'h(B
    (japanese-jisx0208		#x27 #x68)	; $(B'h(B
    (korean-ksc5601		#x2C #x68)	; $(C,h(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE")
    (ucs		. #x0447)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0427)
    (->titlecase	#x0427)
    (cyrillic-iso8859-5 #x67)	; -Lç-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER CHE")
    (->ucs		. #x0447)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0447)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER CHE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER CHE")))
    (japanese-jisx0208-1978	#x27 #x69)	; $(B'i(B
    (chinese-gb2312		#x27 #x69)	; $(A'i(B
    (japanese-jisx0208		#x27 #x69)	; $(B'i(B
    (korean-ksc5601		#x2C #x69)	; $(C,i(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHA")
    (ucs		. #x0448)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0428)
    (->titlecase	#x0428)
    (cyrillic-iso8859-5 #x68)	; -Lè-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SHA")
    (->ucs		. #x0448)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0448)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SHA")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SHA")))
    (japanese-jisx0208-1978	#x27 #x6A)	; $(B'j(B
    (chinese-gb2312		#x27 #x6A)	; $(A'j(B
    (japanese-jisx0208		#x27 #x6A)	; $(B'j(B
    (korean-ksc5601		#x2C #x6A)	; $(C,j(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHCHA")
    (ucs		. #x0449)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0429)
    (->titlecase	#x0429)
    (cyrillic-iso8859-5 #x69)	; -Lé-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SHCHA")
    (->ucs		. #x0449)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0449)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SHCHA")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SHCHA")))
    (japanese-jisx0208-1978	#x27 #x6B)	; $(B'k(B
    (chinese-gb2312		#x27 #x6B)	; $(A'k(B
    (japanese-jisx0208		#x27 #x6B)	; $(B'k(B
    (korean-ksc5601		#x2C #x6B)	; $(C,k(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HARD SIGN")
    (ucs		. #x044A)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x042A)
    (->titlecase	#x042A)
    (cyrillic-iso8859-5 #x6A)	; -Lê-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER HARD SIGN")
    (->ucs		. #x044A)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044A)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")))
    (japanese-jisx0208-1978	#x27 #x6C)	; $(B'l(B
    (chinese-gb2312		#x27 #x6C)	; $(A'l(B
    (japanese-jisx0208		#x27 #x6C)	; $(B'l(B
    (korean-ksc5601		#x2C #x6C)	; $(C,l(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YERU")
    (ucs		. #x044B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x042B)
    (->titlecase	#x042B)
    (cyrillic-iso8859-5 #x6B)	; -Lë-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER YERU")
    (->ucs		. #x044B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044B)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER YERU")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER YERU")))
    (japanese-jisx0208-1978	#x27 #x6D)	; $(B'm(B
    (chinese-gb2312		#x27 #x6D)	; $(A'm(B
    (japanese-jisx0208		#x27 #x6D)	; $(B'm(B
    (korean-ksc5601		#x2C #x6D)	; $(C,m(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SOFT SIGN")
    (ucs		. #x044C)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x042C)
    (->titlecase	#x042C)
    (cyrillic-iso8859-5 #x6C)	; -Lì-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SOFT SIGN")
    (->ucs		. #x044C)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044C)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SOFT SIGN")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SOFT SIGN")))
    (japanese-jisx0208-1978	#x27 #x6E)	; $(B'n(B
    (chinese-gb2312		#x27 #x6E)	; $(A'n(B
    (japanese-jisx0208		#x27 #x6E)	; $(B'n(B
    (korean-ksc5601		#x2C #x6E)	; $(C,n(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER E")
    (ucs		. #x044D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x042D)
    (->titlecase	#x042D)
    (cyrillic-iso8859-5 #x6D)	; -Lí-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER E")
    (->ucs		. #x044D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044D)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER E")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER E")))
    (japanese-jisx0208-1978	#x27 #x6F)	; $(B'o(B
    (chinese-gb2312		#x27 #x6F)	; $(A'o(B
    (japanese-jisx0208		#x27 #x6F)	; $(B'o(B
    (korean-ksc5601		#x2C #x6F)	; $(C,o(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YU")
    (ucs		. #x044E)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x042E)
    (->titlecase	#x042E)
    (cyrillic-iso8859-5 #x6E)	; -Lî-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER YU")
    (->ucs		. #x044E)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044E)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER YU")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER YU")))
    (japanese-jisx0208-1978	#x27 #x70)	; $(B'p(B
    (chinese-gb2312		#x27 #x70)	; $(A'p(B
    (japanese-jisx0208		#x27 #x70)	; $(B'p(B
    (korean-ksc5601		#x2C #x70)	; $(C,p(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YA")
    (ucs		. #x044F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x042F)
    (->titlecase	#x042F)
    (cyrillic-iso8859-5 #x6F)	; -Lï-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER YA")
    (->ucs		. #x044F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044F)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER YA")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER YA")))
    (japanese-jisx0208-1978	#x27 #x71)	; $(B'q(B
    (chinese-gb2312		#x27 #x71)	; $(A'q(B
    (japanese-jisx0208		#x27 #x71)	; $(B'q(B
    (korean-ksc5601		#x2C #x71)	; $(C,q(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE WITH GRAVE")
    (ucs		. #x0450)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0435 #x0300)
    (->uppercase	#x0400)
    (->titlecase	#x0400)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IO")
    (ucs		. #x0451)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0435 #x0308)
    (->uppercase	#x0401)
    (->titlecase	#x0401)
    (cyrillic-iso8859-5 #x71)	; -Lñ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER IO")
    (->ucs		. #x0451)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0451)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER IO")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER IO")))
    (japanese-jisx0208-1978	#x27 #x57)	; $(B'W(B
    (chinese-gb2312		#x27 #x57)	; $(A'W(B
    (japanese-jisx0208		#x27 #x57)	; $(B'W(B
    (korean-ksc5601		#x2C #x57)	; $(C,W(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DJE")
    (ucs		. #x0452)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->uppercase	#x0402)
    (->titlecase	#x0402)
    (cyrillic-iso8859-5 #x72)	; -Lò-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER DJE")
    (->ucs		. #x0452)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->decomposition	wide #x0452)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER DJE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER DJE")))
    (japanese-jisx0212	#x27 #x72)	; $(D'r(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GJE")
    (ucs		. #x0453)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0433 #x0301)
    (->uppercase	#x0403)
    (->titlecase	#x0403)
    (cyrillic-iso8859-5 #x73)	; -Ló-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER GJE")
    (->ucs		. #x0453)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0453)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER GJE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER GJE")))
    (japanese-jisx0212	#x27 #x73)	; $(D's(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER UKRAINIAN IE")
    (ucs		. #x0454)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0404)
    (->titlecase	#x0404)
    (cyrillic-iso8859-5 #x74)	; -Lô-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER UKRAINIAN IE")
    (->ucs		. #x0454)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0454)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER UKRAINIAN IE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER UKRAINIAN IE")))
    (japanese-jisx0212	#x27 #x74)	; $(D't(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DZE")
    (ucs		. #x0455)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0405)
    (->titlecase	#x0405)
    (cyrillic-iso8859-5 #x75)	; -Lõ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER DZE")
    (->ucs		. #x0455)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0455)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER DZE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER DZE")))
    (japanese-jisx0212	#x27 #x75)	; $(D'u(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
    (ucs		. #x0456)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0406)
    (->titlecase	#x0406)
    (cyrillic-iso8859-5 #x76)	; -Lö-A
    ))
(define-char
  '((name . "FULLWIDTH CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
    (->ucs		. #x0456)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0456)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")))
    (japanese-jisx0212	#x27 #x76)	; $(D'v(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YI")
    (ucs		. #x0457)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Ukrainian")
    (->decomposition	#x0456 #x0308)
    (->uppercase	#x0407)
    (->titlecase	#x0407)
    (cyrillic-iso8859-5 #x77)	; -L÷-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER YI")
    (->ucs		. #x0457)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Ukrainian")
    (->decomposition	wide #x0457)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER YI")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER YI")))
    (japanese-jisx0212	#x27 #x77)	; $(D'w(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER JE")
    (ucs		. #x0458)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0408)
    (->titlecase	#x0408)
    (cyrillic-iso8859-5 #x78)	; -Lø-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER JE")
    (->ucs		. #x0458)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0458)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER JE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER JE")))
    (japanese-jisx0212	#x27 #x78)	; $(D'x(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER LJE")
    (ucs		. #x0459)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0409)
    (->titlecase	#x0409)
    (cyrillic-iso8859-5 #x79)	; -Lù-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER LJE")
    (->ucs		. #x0459)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0459)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER LJE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER LJE")))
    (japanese-jisx0212	#x27 #x79)	; $(D'y(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER NJE")
    (ucs		. #x045A)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x040A)
    (->titlecase	#x040A)
    (cyrillic-iso8859-5 #x7A)	; -Lú-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER NJE")
    (->ucs		. #x045A)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x045A)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER NJE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER NJE")))
    (japanese-jisx0212	#x27 #x7A)	; $(D'z(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TSHE")
    (ucs		. #x045B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->uppercase	#x040B)
    (->titlecase	#x040B)
    (cyrillic-iso8859-5 #x7B)	; -Lû-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER TSHE")
    (->ucs		. #x045B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->decomposition	wide #x045B)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER TSHE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER TSHE")))
    (japanese-jisx0212	#x27 #x7B)	; $(D'{(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KJE")
    (ucs		. #x045C)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x043A #x0301)
    (->uppercase	#x040C)
    (->titlecase	#x040C)
    (cyrillic-iso8859-5 #x7C)	; -Lü-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER KJE")
    (->ucs		. #x045C)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x045C)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER KJE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER KJE")))
    (japanese-jisx0212	#x27 #x7C)	; $(D'|(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I WITH GRAVE")
    (ucs		. #x045D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0300)
    (->uppercase	#x040D)
    (->titlecase	#x040D)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHORT U")
    (ucs		. #x045E)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Byelorussian")
    (->decomposition	#x0443 #x0306)
    (->uppercase	#x040E)
    (->titlecase	#x040E)
    (cyrillic-iso8859-5 #x7E)	; -Lþ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SHORT U")
    (->ucs		. #x045E)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Byelorussian")
    (->decomposition	wide #x045E)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT U")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT U")))
    (japanese-jisx0212	#x27 #x7D)	; $(D'}(B
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DZHE")
    (ucs		. #x045F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x040F)
    (->titlecase	#x040F)
    (cyrillic-iso8859-5 #x7F)	; -Lÿ-A
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER DZHE")
    (->ucs		. #x045F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x045F)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER DZHE")))
    (->titlecase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER DZHE")))
    (japanese-jisx0212	#x27 #x7E)	; $(D'~(B
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER OMEGA")
    (ucs		. #x0460)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0461)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER OMEGA")
    (ucs		. #x0461)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0460)
    (->titlecase	#x0460)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YAT")
    (ucs		. #x0462)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0463)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YAT")
    (ucs		. #x0463)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0462)
    (->titlecase	#x0462)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IOTIFIED E")
    (ucs		. #x0464)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0465)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IOTIFIED E")
    (ucs		. #x0465)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0464)
    (->titlecase	#x0464)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER LITTLE YUS")
    (ucs		. #x0466)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0467)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER LITTLE YUS")
    (ucs		. #x0467)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0466)
    (->titlecase	#x0466)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IOTIFIED LITTLE YUS")
    (ucs		. #x0468)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0469)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IOTIFIED LITTLE YUS")
    (ucs		. #x0469)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0468)
    (->titlecase	#x0468)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BIG YUS")
    (ucs		. #x046A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x046B)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BIG YUS")
    (ucs		. #x046B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x046A)
    (->titlecase	#x046A)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IOTIFIED BIG YUS")
    (ucs		. #x046C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x046D)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IOTIFIED BIG YUS")
    (ucs		. #x046D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x046C)
    (->titlecase	#x046C)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KSI")
    (ucs		. #x046E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x046F)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KSI")
    (ucs		. #x046F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x046E)
    (->titlecase	#x046E)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PSI")
    (ucs		. #x0470)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0471)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PSI")
    (ucs		. #x0471)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0470)
    (->titlecase	#x0470)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER FITA")
    (ucs		. #x0472)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0473)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER FITA")
    (ucs		. #x0473)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0472)
    (->titlecase	#x0472)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IZHITSA")
    (ucs		. #x0474)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0475)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IZHITSA")
    (ucs		. #x0475)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0474)
    (->titlecase	#x0474)
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
    (ucs		. #x0476)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0474 #x030F)
    (->lowercase	#x0477)
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
    (ucs		. #x0477)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0475 #x030F)
    (->uppercase	#x0476)
    (->titlecase	#x0476)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER UK")
    (ucs		. #x0478)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0479)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER UK")
    (ucs		. #x0479)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0478)
    (->titlecase	#x0478)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ROUND OMEGA")
    (ucs		. #x047A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x047B)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ROUND OMEGA")
    (ucs		. #x047B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x047A)
    (->titlecase	#x047A)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER OMEGA WITH TITLO")
    (ucs		. #x047C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x047D)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER OMEGA WITH TITLO")
    (ucs		. #x047D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x047C)
    (->titlecase	#x047C)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER OT")
    (ucs		. #x047E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x047F)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER OT")
    (ucs		. #x047F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x047E)
    (->titlecase	#x047E)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KOPPA")
    (ucs		. #x0480)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0481)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KOPPA")
    (ucs		. #x0481)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0480)
    (->titlecase	#x0480)
    ))
(define-char
  '((name		. "CYRILLIC THOUSANDS SIGN")
    (ucs		. #x0482)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "COMBINING CYRILLIC TITLO")
    (ucs		. #x0483)
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "COMBINING CYRILLIC PALATALIZATION")
    (ucs		. #x0484)
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "COMBINING CYRILLIC DASIA PNEUMATA")
    (ucs		. #x0485)
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "COMBINING CYRILLIC PSILI PNEUMATA")
    (ucs		. #x0486)
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "COMBINING CYRILLIC HUNDRED THOUSANDS SIGN")
    (ucs		. #x0488)
    (general-category	mark enclosing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "COMBINING CYRILLIC MILLIONS SIGN")
    (ucs		. #x0489)
    (general-category	mark enclosing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SEMISOFT SIGN")
    (ucs		. #x048C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x048D)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SEMISOFT SIGN")
    (ucs		. #x048D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x048C)
    (->titlecase	#x048C)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ER WITH TICK")
    (ucs		. #x048E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x048F)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ER WITH TICK")
    (ucs		. #x048F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x048E)
    (->titlecase	#x048E)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE WITH UPTURN")
    (ucs		. #x0490)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0491)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE WITH UPTURN")
    (ucs		. #x0491)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0490)
    (->titlecase	#x0490)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE WITH STROKE")
    (ucs		. #x0492)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0493)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE WITH STROKE")
    (ucs		. #x0493)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0492)
    (->titlecase	#x0492)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE WITH MIDDLE HOOK")
    (ucs		. #x0494)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0495)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE WITH MIDDLE HOOK")
    (ucs		. #x0495)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0494)
    (->titlecase	#x0494)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE WITH DESCENDER")
    (ucs		. #x0496)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0497)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE WITH DESCENDER")
    (ucs		. #x0497)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0496)
    (->titlecase	#x0496)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE WITH DESCENDER")
    (ucs		. #x0498)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0499)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE WITH DESCENDER")
    (ucs		. #x0499)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0498)
    (->titlecase	#x0498)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH DESCENDER")
    (ucs		. #x049A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x049B)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH DESCENDER")
    (ucs		. #x049B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x049A)
    (->titlecase	#x049A)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH VERTICAL STROKE")
    (ucs		. #x049C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x049D)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH VERTICAL STROKE")
    (ucs		. #x049D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x049C)
    (->titlecase	#x049C)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH STROKE")
    (ucs		. #x049E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x049F)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH STROKE")
    (ucs		. #x049F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x049E)
    (->titlecase	#x049E)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BASHKIR KA")
    (ucs		. #x04A0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04A1)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BASHKIR KA")
    (ucs		. #x04A1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04A0)
    (->titlecase	#x04A0)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN WITH DESCENDER")
    (ucs		. #x04A2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04A3)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN WITH DESCENDER")
    (ucs		. #x04A3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04A2)
    (->titlecase	#x04A2)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LIGATURE EN GHE")
    (ucs		. #x04A4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04A5)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LIGATURE EN GHE")
    (ucs		. #x04A5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04A4)
    (->titlecase	#x04A4)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PE WITH MIDDLE HOOK")
    (ucs		. #x04A6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (->lowercase	#x04A7)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PE WITH MIDDLE HOOK")
    (ucs		. #x04A7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (->uppercase	#x04A6)
    (->titlecase	#x04A6)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ABKHASIAN HA")
    (ucs		. #x04A8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04A9)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ABKHASIAN HA")
    (ucs		. #x04A9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04A8)
    (->titlecase	#x04A8)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ES WITH DESCENDER")
    (ucs		. #x04AA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04AB)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ES WITH DESCENDER")
    (ucs		. #x04AB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04AA)
    (->titlecase	#x04AA)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TE WITH DESCENDER")
    (ucs		. #x04AC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04AD)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TE WITH DESCENDER")
    (ucs		. #x04AD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04AC)
    (->titlecase	#x04AC)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER STRAIGHT U")
    (ucs		. #x04AE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04AF)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER STRAIGHT U")
    (ucs		. #x04AF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04AE)
    (->titlecase	#x04AE)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER STRAIGHT U WITH STROKE")
    (ucs		. #x04B0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04B1)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER STRAIGHT U WITH STROKE")
    (ucs		. #x04B1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04B0)
    (->titlecase	#x04B0)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HA WITH DESCENDER")
    (ucs		. #x04B2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04B3)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HA WITH DESCENDER")
    (ucs		. #x04B3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04B2)
    (->titlecase	#x04B2)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LIGATURE TE TSE")
    (ucs		. #x04B4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (->lowercase	#x04B5)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LIGATURE TE TSE")
    (ucs		. #x04B5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (->uppercase	#x04B4)
    (->titlecase	#x04B4)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE WITH DESCENDER")
    (ucs		. #x04B6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04B7)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE WITH DESCENDER")
    (ucs		. #x04B7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04B6)
    (->titlecase	#x04B6)
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER CHE WITH VERTICAL STROKE")
    (ucs		. #x04B8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04B9)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE WITH VERTICAL STROKE")
    (ucs		. #x04B9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04B8)
    (->titlecase	#x04B8)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHHA")
    (ucs		. #x04BA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04BB)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHHA")
    (ucs		. #x04BB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04BA)
    (->titlecase	#x04BA)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ABKHASIAN CHE")
    (ucs		. #x04BC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04BD)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ABKHASIAN CHE")
    (ucs		. #x04BD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04BC)
    (->titlecase	#x04BC)
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER ABKHASIAN CHE WITH DESCENDER")
    (ucs		. #x04BE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04BF)
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER ABKHASIAN CHE WITH DESCENDER")
    (ucs		. #x04BF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04BE)
    (->titlecase	#x04BE)
    ))
(define-char
  '((name		. "CYRILLIC LETTER PALOCHKA")
    (ucs		. #x04C0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE WITH BREVE")
    (ucs		. #x04C1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0416 #x0306)
    (->lowercase	#x04C2)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE WITH BREVE")
    (ucs		. #x04C2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0436 #x0306)
    (->uppercase	#x04C1)
    (->titlecase	#x04C1)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH HOOK")
    (ucs		. #x04C3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04C4)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH HOOK")
    (ucs		. #x04C4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04C3)
    (->titlecase	#x04C3)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN WITH HOOK")
    (ucs		. #x04C7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04C8)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN WITH HOOK")
    (ucs		. #x04C8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04C7)
    (->titlecase	#x04C7)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KHAKASSIAN CHE")
    (ucs		. #x04CB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04CC)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KHAKASSIAN CHE")
    (ucs		. #x04CC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04CB)
    (->titlecase	#x04CB)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A WITH BREVE")
    (ucs		. #x04D0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0410 #x0306)
    (->lowercase	#x04D1)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A WITH BREVE")
    (ucs		. #x04D1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0430 #x0306)
    (->uppercase	#x04D0)
    (->titlecase	#x04D0)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A WITH DIAERESIS")
    (ucs		. #x04D2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0410 #x0308)
    (->lowercase	#x04D3)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A WITH DIAERESIS")
    (ucs		. #x04D3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0430 #x0308)
    (->uppercase	#x04D2)
    (->titlecase	#x04D2)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LIGATURE A IE")
    (ucs		. #x04D4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04D5)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LIGATURE A IE")
    (ucs		. #x04D5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04D4)
    (->titlecase	#x04D4)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE WITH BREVE")
    (ucs		. #x04D6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0415 #x0306)
    (->lowercase	#x04D7)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE WITH BREVE")
    (ucs		. #x04D7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0435 #x0306)
    (->uppercase	#x04D6)
    (->titlecase	#x04D6)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SCHWA")
    (ucs		. #x04D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04D9)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SCHWA")
    (ucs		. #x04D9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04D8)
    (->titlecase	#x04D8)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SCHWA WITH DIAERESIS")
    (ucs		. #x04DA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x04D8 #x0308)
    (->lowercase	#x04DB)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SCHWA WITH DIAERESIS")
    (ucs		. #x04DB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x04D9 #x0308)
    (->uppercase	#x04DA)
    (->titlecase	#x04DA)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE WITH DIAERESIS")
    (ucs		. #x04DC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0416 #x0308)
    (->lowercase	#x04DD)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE WITH DIAERESIS")
    (ucs		. #x04DD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0436 #x0308)
    (->uppercase	#x04DC)
    (->titlecase	#x04DC)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE WITH DIAERESIS")
    (ucs		. #x04DE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0417 #x0308)
    (->lowercase	#x04DF)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE WITH DIAERESIS")
    (ucs		. #x04DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0437 #x0308)
    (->uppercase	#x04DE)
    (->titlecase	#x04DE)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ABKHASIAN DZE")
    (ucs		. #x04E0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04E1)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ABKHASIAN DZE")
    (ucs		. #x04E1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04E0)
    (->titlecase	#x04E0)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I WITH MACRON")
    (ucs		. #x04E2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0304)
    (->lowercase	#x04E3)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I WITH MACRON")
    (ucs		. #x04E3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0304)
    (->uppercase	#x04E2)
    (->titlecase	#x04E2)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I WITH DIAERESIS")
    (ucs		. #x04E4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0308)
    (->lowercase	#x04E5)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I WITH DIAERESIS")
    (ucs		. #x04E5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0308)
    (->uppercase	#x04E4)
    (->titlecase	#x04E4)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER O WITH DIAERESIS")
    (ucs		. #x04E6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x041E #x0308)
    (->lowercase	#x04E7)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER O WITH DIAERESIS")
    (ucs		. #x04E7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x043E #x0308)
    (->uppercase	#x04E6)
    (->titlecase	#x04E6)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BARRED O")
    (ucs		. #x04E8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x04E9)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BARRED O")
    (ucs		. #x04E9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x04E8)
    (->titlecase	#x04E8)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BARRED O WITH DIAERESIS")
    (ucs		. #x04EA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x04E8 #x0308)
    (->lowercase	#x04EB)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BARRED O WITH DIAERESIS")
    (ucs		. #x04EB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x04E9 #x0308)
    (->uppercase	#x04EA)
    (->titlecase	#x04EA)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER E WITH DIAERESIS")
    (ucs		. #x04EC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x042D #x0308)
    (->lowercase	#x04ED)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER E WITH DIAERESIS")
    (ucs		. #x04ED)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x044D #x0308)
    (->uppercase	#x04EC)
    (->titlecase	#x04EC)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U WITH MACRON")
    (ucs		. #x04EE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0423 #x0304)
    (->lowercase	#x04EF)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U WITH MACRON")
    (ucs		. #x04EF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0443 #x0304)
    (->uppercase	#x04EE)
    (->titlecase	#x04EE)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U WITH DIAERESIS")
    (ucs		. #x04F0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0423 #x0308)
    (->lowercase	#x04F1)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U WITH DIAERESIS")
    (ucs		. #x04F1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0443 #x0308)
    (->uppercase	#x04F0)
    (->titlecase	#x04F0)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U WITH DOUBLE ACUTE")
    (ucs		. #x04F2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0423 #x030B)
    (->lowercase	#x04F3)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U WITH DOUBLE ACUTE")
    (ucs		. #x04F3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0443 #x030B)
    (->uppercase	#x04F2)
    (->titlecase	#x04F2)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE WITH DIAERESIS")
    (ucs		. #x04F4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0427 #x0308)
    (->lowercase	#x04F5)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE WITH DIAERESIS")
    (ucs		. #x04F5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0447 #x0308)
    (->uppercase	#x04F4)
    (->titlecase	#x04F4)
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YERU WITH DIAERESIS")
    (ucs		. #x04F8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x042B #x0308)
    (->lowercase	#x04F9)
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YERU WITH DIAERESIS")
    (ucs		. #x04F9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x044B #x0308)
    (->uppercase	#x04F8)
    (->titlecase	#x04F8)
    ))
