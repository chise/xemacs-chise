(define-char
  '((name		. "FOR ALL")
    (ucs		. #x2200)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208	#x22 #x4F)	; $(B"O(B
    (korean-ksc5601	#x22 #x23)	; $(C"#(B
    ))
(define-char
  '((name		. "COMPLEMENT")
    (ucs		. #x2201)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "PARTIAL DIFFERENTIAL")
    (ucs		. #x2202)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208	#x22 #x5F)	; $(B"_(B
    (korean-ksc5601	#x21 #x53)	; $(C!S(B
    ))
(define-char
  '((name		. "THERE EXISTS")
    (ucs		. #x2203)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208	#x22 #x50)	; $(B"P(B
    (korean-ksc5601	#x22 #x24)	; $(C"$(B
    ))
(define-char
  '((name		. "THERE DOES NOT EXIST")
    (ucs		. #x2204)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2203 #x0338)
    ))
(define-char
  '((name		. "EMPTY SET")
    (ucs		. #x2205)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "INCREMENT")
    (ucs		. #x2206)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "NABLA")
    (ucs		. #x2207)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208	#x22 #x60)	; $(B"`(B
    (korean-ksc5601	#x21 #x54)	; $(C!T(B
    ))
(define-char
  '((name		. "ELEMENT OF")
    (ucs		. #x2208)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	#x21 #x4A)	; $(A!J(B
    (japanese-jisx0208	#x22 #x3A)	; $(B":(B
    (korean-ksc5601	#x21 #x74)	; $(C!t(B
    ))
(define-char
  '((name		. "NOT AN ELEMENT OF")
    (ucs		. #x2209)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2208 #x0338)
    ))
(define-char
  '((name		. "SMALL ELEMENT OF")
    (ucs		. #x220A)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "CONTAINS AS MEMBER")
    (ucs		. #x220B)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208	#x22 #x3B)	; $(B";(B
    (korean-ksc5601	#x21 #x75)	; $(C!u(B
    ))
(define-char
  '((name		. "DOES NOT CONTAIN AS MEMBER")
    (ucs		. #x220C)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x220B #x0338)
    ))
(define-char
  '((name		. "SMALL CONTAINS AS MEMBER")
    (ucs		. #x220D)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "END OF PROOF")
    (ucs		. #x220E)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "N-ARY PRODUCT")
    (ucs		. #x220F)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x47)	; $(A!G(B
    (korean-ksc5601	#x22 #x33)	; $(C"3(B
    ))
(define-char
  '((name		. "N-ARY COPRODUCT")
    (ucs		. #x2210)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "N-ARY SUMMATION")
    (ucs		. #x2211)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	#x21 #x46)	; $(A!F(B
    (korean-ksc5601	#x22 #x32)	; $(C"2(B
    ))
(define-char
  '((name		. "MINUS SIGN")
    (ucs		. #x2212)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x5D)	; $(@!](B
    (japanese-jisx0208		#x21 #x5D)	; $(B!](B
    ))
(define-char
  '((name		. "MINUS-OR-PLUS SIGN")
    (ucs		. #x2213)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "DOT PLUS")
    (ucs		. #x2214)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "DIVISION SLASH")
    (ucs		. #x2215)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-cns11643-1 #x22 #x61)	; $(G"a(B
    ))
(define-char
  '((name		. "SET MINUS")
    (ucs		. #x2216)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "ASTERISK OPERATOR")
    (ucs		. #x2217)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "RING OPERATOR")
    (ucs		. #x2218)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "BULLET OPERATOR")
    (ucs		. #x2219)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "SQUARE ROOT")
    (ucs		. #x221A)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	#x21 #x4C)	; $(A!L(B
    (japanese-jisx0208	#x22 #x65)	; $(B"e(B
    (korean-ksc5601	#x21 #x6E)	; $(C!n(B
    (chinese-cns11643-1 #x22 #x35)	; $(G"5(B
    ))
(define-char
  '((name		. "CUBE ROOT")
    (ucs		. #x221B)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "FOURTH ROOT")
    (ucs		. #x221C)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "PROPORTIONAL TO")
    (ucs		. #x221D)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	#x21 #x58)	; $(A!X(B
    (japanese-jisx0208	#x22 #x67)	; $(B"g(B
    (korean-ksc5601	#x21 #x70)	; $(C!p(B
    ))
(define-char
  '((name		. "INFINITY")
    (ucs		. #x221E)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x67)	; $(@!g(B
    (chinese-gb2312		#x21 #x5E)	; $(A!^(B
    (japanese-jisx0208		#x21 #x67)	; $(B!g(B
    (korean-ksc5601		#x21 #x44)	; $(C!D(B
    (chinese-cns11643-1		#x22 #x3C)	; $(G"<(B
    ))
(define-char
  '((name		. "RIGHT ANGLE")
    (ucs		. #x221F)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-cns11643-1 #x22 #x49)	; $(G"I(B
    ))
(define-char
  '((name		. "ANGLE")
    (ucs		. #x2220)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	#x21 #x4F)	; $(A!O(B
    (japanese-jisx0208	#x22 #x5C)	; $(B"\(B
    (korean-ksc5601	#x21 #x50)	; $(C!P(B
    (chinese-cns11643-1 #x22 #x48)	; $(G"H(B
    ))
(define-char
  '((name		. "MEASURED ANGLE")
    (ucs		. #x2221)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SPHERICAL ANGLE")
    (ucs		. #x2222)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "DIVIDES")
    (ucs		. #x2223)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "DOES NOT DIVIDE")
    (ucs		. #x2224)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2223 #x0338)
    ))
(define-char
  '((name		. "PARALLEL TO")
    (ucs		. #x2225)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x4E)	; $(A!N(B
    (korean-ksc5601	#x21 #x2B)	; $(C!+(B
    ))
(define-char
  '((name		. "NOT PARALLEL TO")
    (ucs		. #x2226)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2225 #x0338)
    ))
(define-char
  '((name		. "LOGICAL AND")
    (ucs		. #x2227)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x44)	; $(A!D(B
    (japanese-jisx0208	#x22 #x4A)	; $(B"J(B
    (korean-ksc5601	#x21 #x7C)	; $(C!|(B
    ))
(define-char
  '((name		. "LOGICAL OR")
    (ucs		. #x2228)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x45)	; $(A!E(B
    (japanese-jisx0208	#x22 #x4B)	; $(B"K(B
    (korean-ksc5601	#x21 #x7D)	; $(C!}(B
    ))
(define-char
  '((name		. "INTERSECTION")
    (ucs		. #x2229)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x49)	; $(A!I(B
    (japanese-jisx0208	#x22 #x41)	; $(B"A(B
    (korean-ksc5601	#x21 #x7B)	; $(C!{(B
    (chinese-cns11643-1 #x22 #x45)	; $(G"E(B
    ))
(define-char
  '((name		. "UNION")
    (ucs		. #x222A)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x48)	; $(A!H(B
    (japanese-jisx0208	#x22 #x40)	; $(B"@(B
    (korean-ksc5601	#x21 #x7A)	; $(C!z(B
    (chinese-cns11643-1 #x22 #x46)	; $(G"F(B
    ))
(define-char
  '((name		. "INTEGRAL")
    (ucs		. #x222B)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	#x21 #x52)	; $(A!R(B
    (japanese-jisx0208	#x22 #x69)	; $(B"i(B
    (korean-ksc5601	#x21 #x72)	; $(C!r(B
    (chinese-cns11643-1 #x22 #x4D)	; $(G"M(B
    ))
(define-char
  '((name		. "DOUBLE INTEGRAL")
    (ucs		. #x222C)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	compat #x222B #x222B)
    (japanese-jisx0208	#x22 #x6A)	; $(B"j(B
    (korean-ksc5601	#x21 #x73)	; $(C!s(B
    ))
(define-char
  '((name		. "TRIPLE INTEGRAL")
    (ucs		. #x222D)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	compat #x222B #x222B #x222B)
    ))
(define-char
  '((name		. "CONTOUR INTEGRAL")
    (ucs		. #x222E)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	#x21 #x53)	; $(A!S(B
    (korean-ksc5601	#x22 #x31)	; $(C"1(B
    (chinese-cns11643-1 #x22 #x4E)	; $(G"N(B
    ))
(define-char
  '((name		. "SURFACE INTEGRAL")
    (ucs		. #x222F)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	compat #x222E #x222E)
    ))
(define-char
  '((name		. "VOLUME INTEGRAL")
    (ucs		. #x2230)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	compat #x222E #x222E #x222E)
    ))
(define-char
  '((name		. "CLOCKWISE INTEGRAL")
    (ucs		. #x2231)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "CLOCKWISE CONTOUR INTEGRAL")
    (ucs		. #x2232)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "ANTICLOCKWISE CONTOUR INTEGRAL")
    (ucs		. #x2233)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "THEREFORE")
    (ucs		. #x2234)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x68)	; $(@!h(B
    (chinese-gb2312		#x21 #x60)	; $(A!`(B
    (japanese-jisx0208		#x21 #x68)	; $(B!h(B
    (korean-ksc5601		#x21 #x45)	; $(C!E(B
    (chinese-cns11643-1		#x22 #x50)	; $(G"P(B
    ))
(define-char
  '((name		. "BECAUSE")
    (ucs		. #x2235)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x5F)	; $(A!_(B
    (japanese-jisx0208	#x22 #x68)	; $(B"h(B
    (korean-ksc5601	#x21 #x71)	; $(C!q(B
    (chinese-cns11643-1 #x22 #x4F)	; $(G"O(B
    ))
(define-char
  '((name		. "RATIO")
    (ucs		. #x2236)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x43)	; $(A!C(B
    ))
(define-char
  '((name		. "PROPORTION")
    (ucs		. #x2237)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x4B)	; $(A!K(B
    ))
(define-char
  '((name		. "DOT MINUS")
    (ucs		. #x2238)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "EXCESS")
    (ucs		. #x2239)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "GEOMETRIC PROPORTION")
    (ucs		. #x223A)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "HOMOTHETIC")
    (ucs		. #x223B)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "TILDE OPERATOR")
    (ucs		. #x223C)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (korean-ksc5601	#x21 #x2D)	; $(C!-(B
    ))
(define-char
  '((name		. "REVERSED TILDE")
    (ucs		. #x223D)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "lazy S")
    (chinese-gb2312	#x21 #x57)	; $(A!W(B
    (japanese-jisx0208	#x22 #x66)	; $(B"f(B
    (korean-ksc5601	#x21 #x6F)	; $(C!o(B
    ))
(define-char
  '((name		. "INVERTED LAZY S")
    (ucs		. #x223E)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SINE WAVE")
    (ucs		. #x223F)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "WREATH PRODUCT")
    (ucs		. #x2240)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "NOT TILDE")
    (ucs		. #x2241)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x223C #x0338)
    ))
(define-char
  '((name		. "MINUS TILDE")
    (ucs		. #x2242)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "ASYMPTOTICALLY EQUAL TO")
    (ucs		. #x2243)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "NOT ASYMPTOTICALLY EQUAL TO")
    (ucs		. #x2244)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2243 #x0338)
    ))
(define-char
  '((name		. "APPROXIMATELY EQUAL TO")
    (ucs		. #x2245)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "APPROXIMATELY BUT NOT ACTUALLY EQUAL TO")
    (ucs		. #x2246)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "NEITHER APPROXIMATELY NOR ACTUALLY EQUAL TO")
    (ucs		. #x2247)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2245 #x0338)
    ))
(define-char
  '((name		. "ALMOST EQUAL TO")
    (ucs		. #x2248)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	#x21 #x56)	; $(A!V(B
    ))
(define-char
  '((name		. "NOT ALMOST EQUAL TO")
    (ucs		. #x2249)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2248 #x0338)
    ))
(define-char
  '((name		. "ALMOST EQUAL OR EQUAL TO")
    (ucs		. #x224A)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "TRIPLE TILDE")
    (ucs		. #x224B)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "ALL EQUAL TO")
    (ucs		. #x224C)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	#x21 #x55)	; $(A!U(B
    ))
(define-char
  '((name		. "EQUIVALENT TO")
    (ucs		. #x224D)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "GEOMETRICALLY EQUIVALENT TO")
    (ucs		. #x224E)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "DIFFERENCE BETWEEN")
    (ucs		. #x224F)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "APPROACHES THE LIMIT")
    (ucs		. #x2250)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "GEOMETRICALLY EQUAL TO")
    (ucs		. #x2251)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "APPROXIMATELY EQUAL TO OR THE IMAGE OF")
    (ucs		. #x2252)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208	#x22 #x62)	; $(B"b(B
    (korean-ksc5601	#x21 #x56)	; $(C!V(B
    (chinese-cns11643-1 #x22 #x3D)	; $(G"=(B
    ))
(define-char
  '((name		. "IMAGE OF OR APPROXIMATELY EQUAL TO")
    (ucs		. #x2253)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "COLON EQUALS")
    (ucs		. #x2254)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "EQUALS COLON")
    (ucs		. #x2255)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "RING IN EQUAL TO")
    (ucs		. #x2256)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "RING EQUAL TO")
    (ucs		. #x2257)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "CORRESPONDS TO")
    (ucs		. #x2258)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "ESTIMATES")
    (ucs		. #x2259)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "EQUIANGULAR TO")
    (ucs		. #x225A)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "STAR EQUALS")
    (ucs		. #x225B)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "DELTA EQUAL TO")
    (ucs		. #x225C)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "EQUAL TO BY DEFINITION")
    (ucs		. #x225D)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "MEASURED BY")
    (ucs		. #x225E)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "QUESTIONED EQUAL TO")
    (ucs		. #x225F)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "NOT EQUAL TO")
    (ucs		. #x2260)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x003D #x0338)
    (japanese-jisx0208-1978	#x21 #x62)	; $(@!b(B
    (chinese-gb2312		#x21 #x59)	; $(A!Y(B
    (japanese-jisx0208		#x21 #x62)	; $(B!b(B
    (korean-ksc5601		#x21 #x41)	; $(C!A(B
    (chinese-cns11643-1		#x22 #x3B)	; $(G";(B
    ))
(define-char
  '((name		. "IDENTICAL TO")
    (ucs		. #x2261)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x54)	; $(A!T(B
    (japanese-jisx0208	#x22 #x61)	; $(B"a(B
    (korean-ksc5601	#x21 #x55)	; $(C!U(B
    (chinese-cns11643-1 #x22 #x3E)	; $(G">(B
    ))
(define-char
  '((name		. "NOT IDENTICAL TO")
    (ucs		. #x2262)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2261 #x0338)
    ))
(define-char
  '((name		. "STRICTLY EQUIVALENT TO")
    (ucs		. #x2263)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "LESS-THAN OR EQUAL TO")
    (ucs		. #x2264)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	#x21 #x5C)	; $(A!\(B
    (korean-ksc5601	#x21 #x42)	; $(C!B(B
    ))
(define-char
  '((name		. "GREATER-THAN OR EQUAL TO")
    (ucs		. #x2265)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	#x21 #x5D)	; $(A!](B
    (korean-ksc5601	#x21 #x43)	; $(C!C(B
    ))
(define-char
  '((name		. "LESS-THAN OVER EQUAL TO")
    (ucs		. #x2266)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208-1978	#x21 #x65)	; $(@!e(B
    (japanese-jisx0208		#x21 #x65)	; $(B!e(B
    (chinese-cns11643-1		#x22 #x39)	; $(G"9(B
    ))
(define-char
  '((name		. "GREATER-THAN OVER EQUAL TO")
    (ucs		. #x2267)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208-1978	#x21 #x66)	; $(@!f(B
    (japanese-jisx0208		#x21 #x66)	; $(B!f(B
    (chinese-cns11643-1		#x22 #x3A)	; $(G":(B
    ))
(define-char
  '((name		. "LESS-THAN BUT NOT EQUAL TO")
    (ucs		. #x2268)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "GREATER-THAN BUT NOT EQUAL TO")
    (ucs		. #x2269)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "MUCH LESS-THAN")
    (ucs		. #x226A)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208	#x22 #x63)	; $(B"c(B
    (korean-ksc5601	#x21 #x6C)	; $(C!l(B
    ))
(define-char
  '((name		. "MUCH GREATER-THAN")
    (ucs		. #x226B)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208	#x22 #x64)	; $(B"d(B
    (korean-ksc5601	#x21 #x6D)	; $(C!m(B
    ))
(define-char
  '((name		. "BETWEEN")
    (ucs		. #x226C)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "NOT EQUIVALENT TO")
    (ucs		. #x226D)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x224D #x0338)
    ))
(define-char
  '((name		. "NOT LESS-THAN")
    (ucs		. #x226E)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x003C #x0338)
    (chinese-gb2312	#x21 #x5A)	; $(A!Z(B
    ))
(define-char
  '((name		. "NOT GREATER-THAN")
    (ucs		. #x226F)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x003E #x0338)
    (chinese-gb2312	#x21 #x5B)	; $(A![(B
    ))
(define-char
  '((name		. "NEITHER LESS-THAN NOR EQUAL TO")
    (ucs		. #x2270)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2264 #x0338)
    ))
(define-char
  '((name		. "NEITHER GREATER-THAN NOR EQUAL TO")
    (ucs		. #x2271)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2265 #x0338)
    ))
(define-char
  '((name		. "LESS-THAN OR EQUIVALENT TO")
    (ucs		. #x2272)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "GREATER-THAN OR EQUIVALENT TO")
    (ucs		. #x2273)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "NEITHER LESS-THAN NOR EQUIVALENT TO")
    (ucs		. #x2274)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2272 #x0338)
    ))
(define-char
  '((name		. "NEITHER GREATER-THAN NOR EQUIVALENT TO")
    (ucs		. #x2275)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2273 #x0338)
    ))
(define-char
  '((name		. "LESS-THAN OR GREATER-THAN")
    (ucs		. #x2276)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "GREATER-THAN OR LESS-THAN")
    (ucs		. #x2277)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "NEITHER LESS-THAN NOR GREATER-THAN")
    (ucs		. #x2278)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2276 #x0338)
    ))
(define-char
  '((name		. "NEITHER GREATER-THAN NOR LESS-THAN")
    (ucs		. #x2279)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2277 #x0338)
    ))
(define-char
  '((name		. "PRECEDES")
    (ucs		. #x227A)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SUCCEEDS")
    (ucs		. #x227B)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "PRECEDES OR EQUAL TO")
    (ucs		. #x227C)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SUCCEEDS OR EQUAL TO")
    (ucs		. #x227D)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "PRECEDES OR EQUIVALENT TO")
    (ucs		. #x227E)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SUCCEEDS OR EQUIVALENT TO")
    (ucs		. #x227F)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "DOES NOT PRECEDE")
    (ucs		. #x2280)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x227A #x0338)
    ))
(define-char
  '((name		. "DOES NOT SUCCEED")
    (ucs		. #x2281)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x227B #x0338)
    ))
(define-char
  '((name		. "SUBSET OF")
    (ucs		. #x2282)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208	#x22 #x3E)	; $(B">(B
    (korean-ksc5601	#x21 #x78)	; $(C!x(B
    ))
(define-char
  '((name		. "SUPERSET OF")
    (ucs		. #x2283)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208	#x22 #x3F)	; $(B"?(B
    (korean-ksc5601	#x21 #x79)	; $(C!y(B
    ))
(define-char
  '((name		. "NOT A SUBSET OF")
    (ucs		. #x2284)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2282 #x0338)
    ))
(define-char
  '((name		. "NOT A SUPERSET OF")
    (ucs		. #x2285)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2283 #x0338)
    ))
(define-char
  '((name		. "SUBSET OF OR EQUAL TO")
    (ucs		. #x2286)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208	#x22 #x3C)	; $(B"<(B
    (korean-ksc5601	#x21 #x76)	; $(C!v(B
    ))
(define-char
  '((name		. "SUPERSET OF OR EQUAL TO")
    (ucs		. #x2287)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208	#x22 #x3D)	; $(B"=(B
    (korean-ksc5601	#x21 #x77)	; $(C!w(B
    ))
(define-char
  '((name		. "NEITHER A SUBSET OF NOR EQUAL TO")
    (ucs		. #x2288)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2286 #x0338)
    ))
(define-char
  '((name		. "NEITHER A SUPERSET OF NOR EQUAL TO")
    (ucs		. #x2289)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2287 #x0338)
    ))
(define-char
  '((name		. "SUBSET OF WITH NOT EQUAL TO")
    (ucs		. #x228A)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SUPERSET OF WITH NOT EQUAL TO")
    (ucs		. #x228B)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "MULTISET")
    (ucs		. #x228C)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "MULTISET MULTIPLICATION")
    (ucs		. #x228D)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "MULTISET UNION")
    (ucs		. #x228E)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "SQUARE IMAGE OF")
    (ucs		. #x228F)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SQUARE ORIGINAL OF")
    (ucs		. #x2290)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SQUARE IMAGE OF OR EQUAL TO")
    (ucs		. #x2291)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SQUARE ORIGINAL OF OR EQUAL TO")
    (ucs		. #x2292)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SQUARE CAP")
    (ucs		. #x2293)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "SQUARE CUP")
    (ucs		. #x2294)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "CIRCLED PLUS")
    (ucs		. #x2295)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-cns11643-1 #x22 #x53)	; $(G"S(B
    ))
(define-char
  '((name		. "CIRCLED MINUS")
    (ucs		. #x2296)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "CIRCLED TIMES")
    (ucs		. #x2297)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "CIRCLED DIVISION SLASH")
    (ucs		. #x2298)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "CIRCLED DOT OPERATOR")
    (ucs		. #x2299)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x51)	; $(A!Q(B
    (korean-ksc5601	#x22 #x41)	; $(C"A(B
    (chinese-cns11643-1 #x22 #x54)	; $(G"T(B
    ))
(define-char
  '((name		. "CIRCLED RING OPERATOR")
    (ucs		. #x229A)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "CIRCLED ASTERISK OPERATOR")
    (ucs		. #x229B)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "CIRCLED EQUALS")
    (ucs		. #x229C)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "CIRCLED DASH")
    (ucs		. #x229D)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "SQUARED PLUS")
    (ucs		. #x229E)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "SQUARED MINUS")
    (ucs		. #x229F)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "SQUARED TIMES")
    (ucs		. #x22A0)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "SQUARED DOT OPERATOR")
    (ucs		. #x22A1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "RIGHT TACK")
    (ucs		. #x22A2)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "LEFT TACK")
    (ucs		. #x22A3)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "DOWN TACK")
    (ucs		. #x22A4)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "UP TACK")
    (ucs		. #x22A5)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x4D)	; $(A!M(B
    (japanese-jisx0208	#x22 #x5D)	; $(B"](B
    (korean-ksc5601	#x21 #x51)	; $(C!Q(B
    (chinese-cns11643-1 #x22 #x47)	; $(G"G(B
    ))
(define-char
  '((name		. "ASSERTION")
    (ucs		. #x22A6)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "MODELS")
    (ucs		. #x22A7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "TRUE")
    (ucs		. #x22A8)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "FORCES")
    (ucs		. #x22A9)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "TRIPLE VERTICAL BAR RIGHT TURNSTILE")
    (ucs		. #x22AA)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE")
    (ucs		. #x22AB)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "DOES NOT PROVE")
    (ucs		. #x22AC)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22A2 #x0338)
    ))
(define-char
  '((name		. "NOT TRUE")
    (ucs		. #x22AD)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22A8 #x0338)
    ))
(define-char
  '((name		. "DOES NOT FORCE")
    (ucs		. #x22AE)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22A9 #x0338)
    ))
(define-char
  '((name . "NEGATED DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE")
    (ucs		. #x22AF)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22AB #x0338)
    ))
(define-char
  '((name		. "PRECEDES UNDER RELATION")
    (ucs		. #x22B0)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SUCCEEDS UNDER RELATION")
    (ucs		. #x22B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "NORMAL SUBGROUP OF")
    (ucs		. #x22B2)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "CONTAINS AS NORMAL SUBGROUP")
    (ucs		. #x22B3)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "NORMAL SUBGROUP OF OR EQUAL TO")
    (ucs		. #x22B4)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "CONTAINS AS NORMAL SUBGROUP OR EQUAL TO")
    (ucs		. #x22B5)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "ORIGINAL OF")
    (ucs		. #x22B6)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "IMAGE OF")
    (ucs		. #x22B7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "MULTIMAP")
    (ucs		. #x22B8)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "HERMITIAN CONJUGATE MATRIX")
    (ucs		. #x22B9)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "INTERCALATE")
    (ucs		. #x22BA)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "XOR")
    (ucs		. #x22BB)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "NAND")
    (ucs		. #x22BC)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "NOR")
    (ucs		. #x22BD)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "RIGHT ANGLE WITH ARC")
    (ucs		. #x22BE)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "RIGHT TRIANGLE")
    (ucs		. #x22BF)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-cns11643-1 #x22 #x4A)	; $(G"J(B
    ))
(define-char
  '((name		. "N-ARY LOGICAL AND")
    (ucs		. #x22C0)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "N-ARY LOGICAL OR")
    (ucs		. #x22C1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "N-ARY INTERSECTION")
    (ucs		. #x22C2)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "N-ARY UNION")
    (ucs		. #x22C3)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "DIAMOND OPERATOR")
    (ucs		. #x22C4)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "DOT OPERATOR")
    (ucs		. #x22C5)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "STAR OPERATOR")
    (ucs		. #x22C6)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "DIVISION TIMES")
    (ucs		. #x22C7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "BOWTIE")
    (ucs		. #x22C8)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "LEFT NORMAL FACTOR SEMIDIRECT PRODUCT")
    (ucs		. #x22C9)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "RIGHT NORMAL FACTOR SEMIDIRECT PRODUCT")
    (ucs		. #x22CA)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "LEFT SEMIDIRECT PRODUCT")
    (ucs		. #x22CB)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "RIGHT SEMIDIRECT PRODUCT")
    (ucs		. #x22CC)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "REVERSED TILDE EQUALS")
    (ucs		. #x22CD)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "CURLY LOGICAL OR")
    (ucs		. #x22CE)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "CURLY LOGICAL AND")
    (ucs		. #x22CF)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "DOUBLE SUBSET")
    (ucs		. #x22D0)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "DOUBLE SUPERSET")
    (ucs		. #x22D1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "DOUBLE INTERSECTION")
    (ucs		. #x22D2)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "DOUBLE UNION")
    (ucs		. #x22D3)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "PITCHFORK")
    (ucs		. #x22D4)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "EQUAL AND PARALLEL TO")
    (ucs		. #x22D5)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "LESS-THAN WITH DOT")
    (ucs		. #x22D6)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "GREATER-THAN WITH DOT")
    (ucs		. #x22D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "VERY MUCH LESS-THAN")
    (ucs		. #x22D8)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "VERY MUCH GREATER-THAN")
    (ucs		. #x22D9)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "LESS-THAN EQUAL TO OR GREATER-THAN")
    (ucs		. #x22DA)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "GREATER-THAN EQUAL TO OR LESS-THAN")
    (ucs		. #x22DB)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "EQUAL TO OR LESS-THAN")
    (ucs		. #x22DC)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "EQUAL TO OR GREATER-THAN")
    (ucs		. #x22DD)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "EQUAL TO OR PRECEDES")
    (ucs		. #x22DE)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "EQUAL TO OR SUCCEEDS")
    (ucs		. #x22DF)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "DOES NOT PRECEDE OR EQUAL")
    (ucs		. #x22E0)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x227C #x0338)
    ))
(define-char
  '((name		. "DOES NOT SUCCEED OR EQUAL")
    (ucs		. #x22E1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x227D #x0338)
    ))
(define-char
  '((name		. "NOT SQUARE IMAGE OF OR EQUAL TO")
    (ucs		. #x22E2)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2291 #x0338)
    ))
(define-char
  '((name		. "NOT SQUARE ORIGINAL OF OR EQUAL TO")
    (ucs		. #x22E3)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2292 #x0338)
    ))
(define-char
  '((name		. "SQUARE IMAGE OF OR NOT EQUAL TO")
    (ucs		. #x22E4)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SQUARE ORIGINAL OF OR NOT EQUAL TO")
    (ucs		. #x22E5)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "LESS-THAN BUT NOT EQUIVALENT TO")
    (ucs		. #x22E6)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "GREATER-THAN BUT NOT EQUIVALENT TO")
    (ucs		. #x22E7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "PRECEDES BUT NOT EQUIVALENT TO")
    (ucs		. #x22E8)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SUCCEEDS BUT NOT EQUIVALENT TO")
    (ucs		. #x22E9)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "NOT NORMAL SUBGROUP OF")
    (ucs		. #x22EA)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22B2 #x0338)
    ))
(define-char
  '((name		. "DOES NOT CONTAIN AS NORMAL SUBGROUP")
    (ucs		. #x22EB)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22B3 #x0338)
    ))
(define-char
  '((name		. "NOT NORMAL SUBGROUP OF OR EQUAL TO")
    (ucs		. #x22EC)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22B4 #x0338)
    ))
(define-char
  '((name		. "DOES NOT CONTAIN AS NORMAL SUBGROUP OR EQUAL")
    (ucs		. #x22ED)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22B5 #x0338)
    ))
(define-char
  '((name		. "VERTICAL ELLIPSIS")
    (ucs		. #x22EE)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "MIDLINE HORIZONTAL ELLIPSIS")
    (ucs		. #x22EF)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "UP RIGHT DIAGONAL ELLIPSIS")
    (ucs		. #x22F0)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "DOWN RIGHT DIAGONAL ELLIPSIS")
    (ucs		. #x22F1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
