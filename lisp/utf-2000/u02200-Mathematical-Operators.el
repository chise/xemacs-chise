(define-char
  '((name		. "FOR ALL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208		. #x224F)	; �����
    (korean-ksc5601		. #x2223)	; �����
    (japanese-jisx0208-1990	. #x224F)	; �����
    (ucs			. #x2200)	; ∀
    ))
(define-char
  '((name		. "COMPLEMENT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2201)	; ∁
    ))
(define-char
  '((name		. "PARTIAL DIFFERENTIAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208		. #x225F)	; �����
    (korean-ksc5601		. #x2153)	; �����
    (japanese-jisx0208-1990	. #x225F)	; �����
    (ucs			. #x2202)	; ∂
    ))
(define-char
  '((name		. "THERE EXISTS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208		. #x2250)	; �����
    (korean-ksc5601		. #x2224)	; �����
    (japanese-jisx0208-1990	. #x2250)	; �����
    (ucs			. #x2203)	; ∃
    ))
(define-char
  '((name		. "THERE DOES NOT EXIST")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2203 #x0338)
    (ucs		. #x2204)	; ∄
    ))
(define-char
  '((name		. "EMPTY SET")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0213-1	. #x2247)	; �����
    (ucs			. #x2205)	; ∅
    ))
(define-char
  '((name		. "INCREMENT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2206)	; ∆
    ))
(define-char
  '((name		. "NABLA")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208		. #x2260)	; �����
    (korean-ksc5601		. #x2154)	; �����
    (japanese-jisx0208-1990	. #x2260)	; �����
    (ucs			. #x2207)	; ∇
    ))
(define-char
  '((name		. "ELEMENT OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312		. #x214A)	; �����
    (japanese-jisx0208		. #x223A)	; �����
    (korean-ksc5601		. #x2174)	; �����
    (japanese-jisx0208-1990	. #x223A)	; �����
    (ucs			. #x2208)	; ∈
    ))
(define-char
  '((name		. "NOT AN ELEMENT OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2208 #x0338)
    (japanese-jisx0213-1	. #x2246)	; �����
    (ucs			. #x2209)	; ∉
    ))
(define-char
  '((name		. "SMALL ELEMENT OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x220A)	; ∊
    ))
(define-char
  '((name		. "CONTAINS AS MEMBER")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208		. #x223B)	; �����
    (korean-ksc5601		. #x2175)	; �����
    (japanese-jisx0208-1990	. #x223B)	; �����
    (ucs			. #x220B)	; ∋
    ))
(define-char
  '((name		. "DOES NOT CONTAIN AS MEMBER")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x220B #x0338)
    (ucs		. #x220C)	; ∌
    ))
(define-char
  '((name		. "SMALL CONTAINS AS MEMBER")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x220D)	; ∍
    ))
(define-char
  '((name		. "END OF PROOF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x220E)	; ∎
    ))
(define-char
  '((name		. "N-ARY PRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	. #x2147)	; �����
    (korean-ksc5601	. #x2233)	; �����
    (ucs		. #x220F)	; ∏
    ))
(define-char
  '((name		. "N-ARY COPRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2210)	; ∐
    ))
(define-char
  '((name		. "N-ARY SUMMATION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	. #x2146)	; �����
    (korean-ksc5601	. #x2232)	; �����
    (ucs		. #x2211)	; ∑
    ))
(define-char
  '((name		. "MINUS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (japanese-jisx0208-1978	. #x215D)	; �����
    (japanese-jisx0208		. #x215D)	; �����
    (japanese-jisx0208-1990	. #x215D)	; �����
    (ucs			. #x2212)	; −
    ))
(define-char
  '((name		. "MINUS-OR-PLUS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (japanese-jisx0213-1	. #x235B)	; �����
    (ucs			. #x2213)	; ∓
    ))
(define-char
  '((name		. "DOT PLUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2214)	; ∔
    ))
(define-char
  '((name		. "DIVISION SLASH")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-cns11643-1 . #x2261)	; �����
    (chinese-big5	. #xA241)	; �����
    (ucs		. #x2215)	; ∕
    ))
(define-char
  '((name		. "SET MINUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-big5	. #xA242)	; �����
    (ucs		. #x2216)	; ∖
    ))
(define-char
  '((name		. "ASTERISK OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2217)	; ∗
    ))
(define-char
  '((name		. "RING OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-big5	. #xA258)	; �����
    (ucs		. #x2218)	; ∘
    ))
(define-char
  '((name		. "BULLET OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2219)	; ∙
    ))
(define-char
  '((name		. "SQUARE ROOT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312		. #x214C)	; �����
    (japanese-jisx0208		. #x2265)	; �����
    (korean-ksc5601		. #x216E)	; �����
    (chinese-cns11643-1		. #x2235)	; �����
    (japanese-jisx0208-1990	. #x2265)	; �����
    (chinese-big5		. #xA1D4)	; �����
    (ucs			. #x221A)	; √
    ))
(define-char
  '((name		. "CUBE ROOT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x221B)	; ∛
    ))
(define-char
  '((name		. "FOURTH ROOT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x221C)	; ∜
    ))
(define-char
  '((name		. "PROPORTIONAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312		. #x2158)	; �����
    (japanese-jisx0208		. #x2267)	; �����
    (korean-ksc5601		. #x2170)	; �����
    (japanese-jisx0208-1990	. #x2267)	; �����
    (ucs			. #x221D)	; ∝
    ))
(define-char
  '((name		. "INFINITY")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	. #x2167)	; �����
    (chinese-gb2312		. #x215E)	; �����
    (japanese-jisx0208		. #x2167)	; �����
    (korean-ksc5601		. #x2144)	; �����
    (chinese-cns11643-1		. #x223C)	; �����
    (japanese-jisx0208-1990	. #x2167)	; �����
    (chinese-big5		. #xA1DB)	; �����
    (ucs			. #x221E)	; ∞
    ))
(define-char
  '((name		. "RIGHT ANGLE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-cns11643-1		. #x2249)	; �����
    (japanese-jisx0213-1	. #x2D78)	; �����
    (chinese-big5		. #xA1E8)	; �����
    (ucs			. #x221F)	; ∟
    ))
(define-char
  '((name		. "ANGLE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312		. #x214F)	; �����
    (japanese-jisx0208		. #x225C)	; �����
    (korean-ksc5601		. #x2150)	; �����
    (chinese-cns11643-1		. #x2248)	; �����
    (japanese-jisx0208-1990	. #x225C)	; �����
    (chinese-big5		. #xA1E7)	; �����
    (ucs			. #x2220)	; ∠
    ))
(define-char
  '((name		. "MEASURED ANGLE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2221)	; ∡
    ))
(define-char
  '((name		. "SPHERICAL ANGLE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2222)	; ∢
    ))
(define-char
  '((name		. "DIVIDES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-big5	. #xA1FD)	; �����
    (ucs		. #x2223)	; ∣
    ))
(define-char
  '((name		. "DOES NOT DIVIDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2223 #x0338)
    (ucs		. #x2224)	; ∤
    ))
(define-char
  '((name		. "PARALLEL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312		. #x214E)	; �����
    (korean-ksc5601		. #x212B)	; �����
    (japanese-jisx0213-1	. #x2254)	; �����
    (chinese-big5		. #xA1FC)	; �����
    (ucs			. #x2225)	; ∥
    ))
(define-char
  '((name		. "NOT PARALLEL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2225 #x0338)
    (japanese-jisx0213-1	. #x2255)	; �����
    (ucs			. #x2226)	; ∦
    ))
(define-char
  '((name		. "LOGICAL AND")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312		. #x2144)	; �����
    (japanese-jisx0208		. #x224A)	; �����
    (korean-ksc5601		. #x217C)	; �����
    (japanese-jisx0208-1990	. #x224A)	; �����
    (ucs			. #x2227)	; ∧
    ))
(define-char
  '((name		. "LOGICAL OR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312		. #x2145)	; �����
    (japanese-jisx0208		. #x224B)	; �����
    (korean-ksc5601		. #x217D)	; �����
    (japanese-jisx0208-1990	. #x224B)	; �����
    (ucs			. #x2228)	; ∨
    ))
(define-char
  '((name		. "INTERSECTION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312		. #x2149)	; �����
    (japanese-jisx0208		. #x2241)	; �����
    (korean-ksc5601		. #x217B)	; �����
    (chinese-cns11643-1		. #x2245)	; �����
    (japanese-jisx0208-1990	. #x2241)	; �����
    (chinese-big5		. #xA1E4)	; �����
    (ucs			. #x2229)	; ∩
    ))
(define-char
  '((name		. "UNION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312		. #x2148)	; �����
    (japanese-jisx0208		. #x2240)	; �����
    (korean-ksc5601		. #x217A)	; �����
    (chinese-cns11643-1		. #x2246)	; �����
    (japanese-jisx0208-1990	. #x2240)	; �����
    (chinese-big5		. #xA1E5)	; �����
    (ucs			. #x222A)	; ∪
    ))
(define-char
  '((name		. "INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312		. #x2152)	; �����
    (japanese-jisx0208		. #x2269)	; �����
    (korean-ksc5601		. #x2172)	; �����
    (chinese-cns11643-1		. #x224D)	; �����
    (japanese-jisx0208-1990	. #x2269)	; �����
    (chinese-big5		. #xA1EC)	; �����
    (ucs			. #x222B)	; ∫
    ))
(define-char
  '((name		. "DOUBLE INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	compat #x222B #x222B)
    (japanese-jisx0208		. #x226A)	; �����
    (korean-ksc5601		. #x2173)	; �����
    (japanese-jisx0208-1990	. #x226A)	; �����
    (ucs			. #x222C)	; ∬
    ))
(define-char
  '((name		. "TRIPLE INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	compat #x222B #x222B #x222B)
    (ucs		. #x222D)	; ∭
    ))
(define-char
  '((name		. "CONTOUR INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312		. #x2153)	; �����
    (korean-ksc5601		. #x2231)	; �����
    (chinese-cns11643-1		. #x224E)	; �����
    (japanese-jisx0213-1	. #x2D73)	; �����
    (chinese-big5		. #xA1ED)	; �����
    (ucs			. #x222E)	; ∮
    ))
(define-char
  '((name		. "SURFACE INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	compat #x222E #x222E)
    (ucs		. #x222F)	; ∯
    ))
(define-char
  '((name		. "VOLUME INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	compat #x222E #x222E #x222E)
    (ucs		. #x2230)	; ∰
    ))
(define-char
  '((name		. "CLOCKWISE INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2231)	; ∱
    ))
(define-char
  '((name		. "CLOCKWISE CONTOUR INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2232)	; ∲
    ))
(define-char
  '((name		. "ANTICLOCKWISE CONTOUR INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2233)	; ∳
    ))
(define-char
  '((name		. "THEREFORE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	. #x2168)	; �����
    (chinese-gb2312		. #x2160)	; �����
    (japanese-jisx0208		. #x2168)	; �����
    (korean-ksc5601		. #x2145)	; �����
    (chinese-cns11643-1		. #x2250)	; �����
    (japanese-jisx0208-1990	. #x2168)	; �����
    (chinese-big5		. #xA1EF)	; �����
    (ucs			. #x2234)	; ∴
    ))
(define-char
  '((name		. "BECAUSE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312		. #x215F)	; �����
    (japanese-jisx0208		. #x2268)	; �����
    (korean-ksc5601		. #x2171)	; �����
    (chinese-cns11643-1		. #x224F)	; �����
    (japanese-jisx0208-1990	. #x2268)	; �����
    (chinese-big5		. #xA1EE)	; �����
    (ucs			. #x2235)	; ∵
    ))
(define-char
  '((name		. "RATIO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	. #x2143)	; �����
    (ucs		. #x2236)	; ∶
    ))
(define-char
  '((name		. "PROPORTION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	. #x214B)	; �����
    (ucs		. #x2237)	; ∷
    ))
(define-char
  '((name		. "DOT MINUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2238)	; ∸
    ))
(define-char
  '((name		. "EXCESS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2239)	; ∹
    ))
(define-char
  '((name		. "GEOMETRIC PROPORTION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x223A)	; ∺
    ))
(define-char
  '((name		. "HOMOTHETIC")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x223B)	; ∻
    ))
(define-char
  '((name		. "TILDE OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (korean-ksc5601	. #x212D)	; �����
    (chinese-cns11643-1 . #x2244)	; �����
    (chinese-big5	. #xA1E3)	; �����
    (ucs		. #x223C)	; ∼
    ))
(define-char
  '((name		. "REVERSED TILDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "lazy S")
    (chinese-gb2312		. #x2157)	; �����
    (japanese-jisx0208		. #x2266)	; �����
    (korean-ksc5601		. #x216F)	; �����
    (japanese-jisx0208-1990	. #x2266)	; �����
    (ucs			. #x223D)	; ∽
    ))
(define-char
  '((name		. "INVERTED LAZY S")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x223E)	; ∾
    ))
(define-char
  '((name		. "SINE WAVE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x223F)	; ∿
    ))
(define-char
  '((name		. "WREATH PRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2240)	; ≀
    ))
(define-char
  '((name		. "NOT TILDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x223C #x0338)
    (ucs		. #x2241)	; ≁
    ))
(define-char
  '((name		. "MINUS TILDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2242)	; ≂
    ))
(define-char
  '((name		. "ASYMPTOTICALLY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0213-1	. #x226C)	; �����
    (ucs			. #x2243)	; ≃
    ))
(define-char
  '((name		. "NOT ASYMPTOTICALLY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2243 #x0338)
    (ucs		. #x2244)	; ≄
    ))
(define-char
  '((name		. "APPROXIMATELY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0213-1	. #x226D)	; �����
    (ucs			. #x2245)	; ≅
    ))
(define-char
  '((name		. "APPROXIMATELY BUT NOT ACTUALLY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2246)	; ≆
    ))
(define-char
  '((name		. "NEITHER APPROXIMATELY NOR ACTUALLY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2245 #x0338)
    (ucs		. #x2247)	; ≇
    ))
(define-char
  '((name		. "ALMOST EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312		. #x2156)	; �����
    (japanese-jisx0213-1	. #x226E)	; �����
    (ucs			. #x2248)	; ≈
    ))
(define-char
  '((name		. "NOT ALMOST EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2248 #x0338)
    (ucs		. #x2249)	; ≉
    ))
(define-char
  '((name		. "ALMOST EQUAL OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x224A)	; ≊
    ))
(define-char
  '((name		. "TRIPLE TILDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x224B)	; ≋
    ))
(define-char
  '((name		. "ALL EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	. #x2155)	; �����
    (ucs		. #x224C)	; ≌
    ))
(define-char
  '((name		. "EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x224D)	; ≍
    ))
(define-char
  '((name		. "GEOMETRICALLY EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x224E)	; ≎
    ))
(define-char
  '((name		. "DIFFERENCE BETWEEN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x224F)	; ≏
    ))
(define-char
  '((name		. "APPROACHES THE LIMIT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2250)	; ≐
    ))
(define-char
  '((name		. "GEOMETRICALLY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2251)	; ≑
    ))
(define-char
  '((name		. "APPROXIMATELY EQUAL TO OR THE IMAGE OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208		. #x2262)	; �����
    (korean-ksc5601		. #x2156)	; �����
    (chinese-cns11643-1		. #x223D)	; �����
    (japanese-jisx0208-1990	. #x2262)	; �����
    (chinese-big5		. #xA1DC)	; �����
    (ucs			. #x2252)	; ≒
    ))
(define-char
  '((name		. "IMAGE OF OR APPROXIMATELY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2253)	; ≓
    ))
(define-char
  '((name		. "COLON EQUALS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2254)	; ≔
    ))
(define-char
  '((name		. "EQUALS COLON")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2255)	; ≕
    ))
(define-char
  '((name		. "RING IN EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2256)	; ≖
    ))
(define-char
  '((name		. "RING EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2257)	; ≗
    ))
(define-char
  '((name		. "CORRESPONDS TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2258)	; ≘
    ))
(define-char
  '((name		. "ESTIMATES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2259)	; ≙
    ))
(define-char
  '((name		. "EQUIANGULAR TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x225A)	; ≚
    ))
(define-char
  '((name		. "STAR EQUALS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x225B)	; ≛
    ))
(define-char
  '((name		. "DELTA EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x225C)	; ≜
    ))
(define-char
  '((name		. "EQUAL TO BY DEFINITION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x225D)	; ≝
    ))
(define-char
  '((name		. "MEASURED BY")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x225E)	; ≞
    ))
(define-char
  '((name		. "QUESTIONED EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x225F)	; ≟
    ))
(define-char
  '((name		. "NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x003D #x0338)
    (japanese-jisx0208-1978	. #x2162)	; �����
    (chinese-gb2312		. #x2159)	; �����
    (japanese-jisx0208		. #x2162)	; �����
    (korean-ksc5601		. #x2141)	; �����
    (chinese-cns11643-1		. #x223B)	; �����
    (japanese-jisx0208-1990	. #x2162)	; �����
    (chinese-big5		. #xA1DA)	; �����
    (ucs			. #x2260)	; ≠
    ))
(define-char
  '((name		. "IDENTICAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312		. #x2154)	; �����
    (japanese-jisx0208		. #x2261)	; �����
    (korean-ksc5601		. #x2155)	; �����
    (chinese-cns11643-1		. #x223E)	; �����
    (japanese-jisx0208-1990	. #x2261)	; �����
    (chinese-big5		. #xA1DD)	; �����
    (ucs			. #x2261)	; ≡
    ))
(define-char
  '((name		. "NOT IDENTICAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2261 #x0338)
    (japanese-jisx0213-1	. #x226B)	; �����
    (ucs			. #x2262)	; ≢
    ))
(define-char
  '((name		. "STRICTLY EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2263)	; ≣
    ))
(define-char
  '((name		. "LESS-THAN OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	. #x215C)	; �����
    (korean-ksc5601	. #x2142)	; �����
    (ucs		. #x2264)	; ≤
    ))
(define-char
  '((name		. "GREATER-THAN OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-gb2312	. #x215D)	; �����
    (korean-ksc5601	. #x2143)	; �����
    (ucs		. #x2265)	; ≥
    ))
(define-char
  '((name		. "LESS-THAN OVER EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208-1978	. #x2165)	; �����
    (japanese-jisx0208		. #x2165)	; �����
    (chinese-cns11643-1		. #x2239)	; �����
    (japanese-jisx0208-1990	. #x2165)	; �����
    (chinese-big5		. #xA1D8)	; �����
    (ucs			. #x2266)	; ≦
    ))
(define-char
  '((name		. "GREATER-THAN OVER EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208-1978	. #x2166)	; �����
    (japanese-jisx0208		. #x2166)	; �����
    (chinese-cns11643-1		. #x223A)	; �����
    (japanese-jisx0208-1990	. #x2166)	; �����
    (chinese-big5		. #xA1D9)	; �����
    (ucs			. #x2267)	; ≧
    ))
(define-char
  '((name		. "LESS-THAN BUT NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2268)	; ≨
    ))
(define-char
  '((name		. "GREATER-THAN BUT NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2269)	; ≩
    ))
(define-char
  '((name		. "MUCH LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208		. #x2263)	; �����
    (korean-ksc5601		. #x216C)	; �����
    (japanese-jisx0208-1990	. #x2263)	; �����
    (ucs			. #x226A)	; ≪
    ))
(define-char
  '((name		. "MUCH GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208		. #x2264)	; �����
    (korean-ksc5601		. #x216D)	; �����
    (japanese-jisx0208-1990	. #x2264)	; �����
    (ucs			. #x226B)	; ≫
    ))
(define-char
  '((name		. "BETWEEN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x226C)	; ≬
    ))
(define-char
  '((name		. "NOT EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x224D #x0338)
    (ucs		. #x226D)	; ≭
    ))
(define-char
  '((name		. "NOT LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x003C #x0338)
    (chinese-gb2312	. #x215A)	; �����
    (ucs		. #x226E)	; ≮
    ))
(define-char
  '((name		. "NOT GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x003E #x0338)
    (chinese-gb2312	. #x215B)	; �����
    (ucs		. #x226F)	; ≯
    ))
(define-char
  '((name		. "NEITHER LESS-THAN NOR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2264 #x0338)
    (ucs		. #x2270)	; ≰
    ))
(define-char
  '((name		. "NEITHER GREATER-THAN NOR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2265 #x0338)
    (ucs		. #x2271)	; ≱
    ))
(define-char
  '((name		. "LESS-THAN OR EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2272)	; ≲
    ))
(define-char
  '((name		. "GREATER-THAN OR EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2273)	; ≳
    ))
(define-char
  '((name		. "NEITHER LESS-THAN NOR EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2272 #x0338)
    (ucs		. #x2274)	; ≴
    ))
(define-char
  '((name		. "NEITHER GREATER-THAN NOR EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2273 #x0338)
    (ucs		. #x2275)	; ≵
    ))
(define-char
  '((name		. "LESS-THAN OR GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0213-1	. #x226F)	; �����
    (ucs			. #x2276)	; ≶
    ))
(define-char
  '((name		. "GREATER-THAN OR LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0213-1	. #x2270)	; �����
    (ucs			. #x2277)	; ≷
    ))
(define-char
  '((name		. "NEITHER LESS-THAN NOR GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2276 #x0338)
    (ucs		. #x2278)	; ≸
    ))
(define-char
  '((name		. "NEITHER GREATER-THAN NOR LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2277 #x0338)
    (ucs		. #x2279)	; ≹
    ))
(define-char
  '((name		. "PRECEDES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x227A)	; ≺
    ))
(define-char
  '((name		. "SUCCEEDS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x227B)	; ≻
    ))
(define-char
  '((name		. "PRECEDES OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x227C)	; ≼
    ))
(define-char
  '((name		. "SUCCEEDS OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x227D)	; ≽
    ))
(define-char
  '((name		. "PRECEDES OR EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x227E)	; ≾
    ))
(define-char
  '((name		. "SUCCEEDS OR EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x227F)	; ≿
    ))
(define-char
  '((name		. "DOES NOT PRECEDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x227A #x0338)
    (ucs		. #x2280)	; ⊀
    ))
(define-char
  '((name		. "DOES NOT SUCCEED")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x227B #x0338)
    (ucs		. #x2281)	; ⊁
    ))
(define-char
  '((name		. "SUBSET OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208		. #x223E)	; �����
    (korean-ksc5601		. #x2178)	; �����
    (japanese-jisx0208-1990	. #x223E)	; �����
    (ucs			. #x2282)	; ⊂
    ))
(define-char
  '((name		. "SUPERSET OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208		. #x223F)	; �����
    (korean-ksc5601		. #x2179)	; �����
    (japanese-jisx0208-1990	. #x223F)	; �����
    (ucs			. #x2283)	; ⊃
    ))
(define-char
  '((name		. "NOT A SUBSET OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2282 #x0338)
    (japanese-jisx0213-1	. #x2242)	; �����
    (ucs			. #x2284)	; ⊄
    ))
(define-char
  '((name		. "NOT A SUPERSET OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2283 #x0338)
    (japanese-jisx0213-1	. #x2243)	; �����
    (ucs			. #x2285)	; ⊅
    ))
(define-char
  '((name		. "SUBSET OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208		. #x223C)	; �����
    (korean-ksc5601		. #x2176)	; �����
    (japanese-jisx0208-1990	. #x223C)	; �����
    (ucs			. #x2286)	; ⊆
    ))
(define-char
  '((name		. "SUPERSET OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0208		. #x223D)	; �����
    (korean-ksc5601		. #x2177)	; �����
    (japanese-jisx0208-1990	. #x223D)	; �����
    (ucs			. #x2287)	; ⊇
    ))
(define-char
  '((name		. "NEITHER A SUBSET OF NOR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2286 #x0338)
    (ucs		. #x2288)	; ⊈
    ))
(define-char
  '((name		. "NEITHER A SUPERSET OF NOR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2287 #x0338)
    (ucs		. #x2289)	; ⊉
    ))
(define-char
  '((name		. "SUBSET OF WITH NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0213-1	. #x2244)	; �����
    (ucs			. #x228A)	; ⊊
    ))
(define-char
  '((name		. "SUPERSET OF WITH NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0213-1	. #x2245)	; �����
    (ucs			. #x228B)	; ⊋
    ))
(define-char
  '((name		. "MULTISET")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x228C)	; ⊌
    ))
(define-char
  '((name		. "MULTISET MULTIPLICATION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x228D)	; ⊍
    ))
(define-char
  '((name		. "MULTISET UNION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x228E)	; ⊎
    ))
(define-char
  '((name		. "SQUARE IMAGE OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x228F)	; ⊏
    ))
(define-char
  '((name		. "SQUARE ORIGINAL OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2290)	; ⊐
    ))
(define-char
  '((name		. "SQUARE IMAGE OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2291)	; ⊑
    ))
(define-char
  '((name		. "SQUARE ORIGINAL OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2292)	; ⊒
    ))
(define-char
  '((name		. "SQUARE CAP")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2293)	; ⊓
    ))
(define-char
  '((name		. "SQUARE CUP")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2294)	; ⊔
    ))
(define-char
  '((name		. "CIRCLED PLUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-cns11643-1		. #x2253)	; �����
    (japanese-jisx0213-1	. #x2251)	; �����
    (chinese-big5		. #xA1F2)	; �����
    (ucs			. #x2295)	; ⊕
    ))
(define-char
  '((name		. "CIRCLED MINUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0213-1	. #x2252)	; �����
    (ucs			. #x2296)	; ⊖
    ))
(define-char
  '((name		. "CIRCLED TIMES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0213-1	. #x2253)	; �����
    (ucs			. #x2297)	; ⊗
    ))
(define-char
  '((name		. "CIRCLED DIVISION SLASH")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2298)	; ⊘
    ))
(define-char
  '((name		. "CIRCLED DOT OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	. #x2151)	; �����
    (korean-ksc5601	. #x2241)	; �����
    (chinese-cns11643-1 . #x2254)	; �����
    (chinese-big5	. #xA1F3)	; �����
    (ucs		. #x2299)	; ⊙
    ))
(define-char
  '((name		. "CIRCLED RING OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x229A)	; ⊚
    ))
(define-char
  '((name		. "CIRCLED ASTERISK OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x229B)	; ⊛
    ))
(define-char
  '((name		. "CIRCLED EQUALS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x229C)	; ⊜
    ))
(define-char
  '((name		. "CIRCLED DASH")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x229D)	; ⊝
    ))
(define-char
  '((name		. "SQUARED PLUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x229E)	; ⊞
    ))
(define-char
  '((name		. "SQUARED MINUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x229F)	; ⊟
    ))
(define-char
  '((name		. "SQUARED TIMES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22A0)	; ⊠
    ))
(define-char
  '((name		. "SQUARED DOT OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22A1)	; ⊡
    ))
(define-char
  '((name		. "RIGHT TACK")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22A2)	; ⊢
    ))
(define-char
  '((name		. "LEFT TACK")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22A3)	; ⊣
    ))
(define-char
  '((name		. "DOWN TACK")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22A4)	; ⊤
    ))
(define-char
  '((name		. "UP TACK")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312		. #x214D)	; �����
    (japanese-jisx0208		. #x225D)	; �����
    (korean-ksc5601		. #x2151)	; �����
    (chinese-cns11643-1		. #x2247)	; �����
    (japanese-jisx0208-1990	. #x225D)	; �����
    (chinese-big5		. #xA1E6)	; �����
    (ucs			. #x22A5)	; ⊥
    ))
(define-char
  '((name		. "ASSERTION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22A6)	; ⊦
    ))
(define-char
  '((name		. "MODELS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22A7)	; ⊧
    ))
(define-char
  '((name		. "TRUE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22A8)	; ⊨
    ))
(define-char
  '((name		. "FORCES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22A9)	; ⊩
    ))
(define-char
  '((name		. "TRIPLE VERTICAL BAR RIGHT TURNSTILE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22AA)	; ⊪
    ))
(define-char
  '((name		. "DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22AB)	; ⊫
    ))
(define-char
  '((name		. "DOES NOT PROVE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22A2 #x0338)
    (ucs		. #x22AC)	; ⊬
    ))
(define-char
  '((name		. "NOT TRUE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22A8 #x0338)
    (ucs		. #x22AD)	; ⊭
    ))
(define-char
  '((name		. "DOES NOT FORCE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22A9 #x0338)
    (ucs		. #x22AE)	; ⊮
    ))
(define-char
  '((name . "NEGATED DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22AB #x0338)
    (ucs		. #x22AF)	; ⊯
    ))
(define-char
  '((name		. "PRECEDES UNDER RELATION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22B0)	; ⊰
    ))
(define-char
  '((name		. "SUCCEEDS UNDER RELATION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22B1)	; ⊱
    ))
(define-char
  '((name		. "NORMAL SUBGROUP OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22B2)	; ⊲
    ))
(define-char
  '((name		. "CONTAINS AS NORMAL SUBGROUP")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22B3)	; ⊳
    ))
(define-char
  '((name		. "NORMAL SUBGROUP OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22B4)	; ⊴
    ))
(define-char
  '((name		. "CONTAINS AS NORMAL SUBGROUP OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22B5)	; ⊵
    ))
(define-char
  '((name		. "ORIGINAL OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22B6)	; ⊶
    ))
(define-char
  '((name		. "IMAGE OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22B7)	; ⊷
    ))
(define-char
  '((name		. "MULTIMAP")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22B8)	; ⊸
    ))
(define-char
  '((name		. "HERMITIAN CONJUGATE MATRIX")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22B9)	; ⊹
    ))
(define-char
  '((name		. "INTERCALATE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22BA)	; ⊺
    ))
(define-char
  '((name		. "XOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22BB)	; ⊻
    ))
(define-char
  '((name		. "NAND")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22BC)	; ⊼
    ))
(define-char
  '((name		. "NOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22BD)	; ⊽
    ))
(define-char
  '((name		. "RIGHT ANGLE WITH ARC")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22BE)	; ⊾
    ))
(define-char
  '((name		. "RIGHT TRIANGLE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (chinese-cns11643-1		. #x224A)	; �����
    (japanese-jisx0213-1	. #x2D79)	; �����
    (chinese-big5		. #xA1E9)	; �����
    (ucs			. #x22BF)	; ⊿
    ))
(define-char
  '((name		. "N-ARY LOGICAL AND")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22C0)	; ⋀
    ))
(define-char
  '((name		. "N-ARY LOGICAL OR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22C1)	; ⋁
    ))
(define-char
  '((name		. "N-ARY INTERSECTION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22C2)	; ⋂
    ))
(define-char
  '((name		. "N-ARY UNION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22C3)	; ⋃
    ))
(define-char
  '((name		. "DIAMOND OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22C4)	; ⋄
    ))
(define-char
  '((name		. "DOT OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22C5)	; ⋅
    ))
(define-char
  '((name		. "STAR OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22C6)	; ⋆
    ))
(define-char
  '((name		. "DIVISION TIMES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22C7)	; ⋇
    ))
(define-char
  '((name		. "BOWTIE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22C8)	; ⋈
    ))
(define-char
  '((name		. "LEFT NORMAL FACTOR SEMIDIRECT PRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22C9)	; ⋉
    ))
(define-char
  '((name		. "RIGHT NORMAL FACTOR SEMIDIRECT PRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22CA)	; ⋊
    ))
(define-char
  '((name		. "LEFT SEMIDIRECT PRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22CB)	; ⋋
    ))
(define-char
  '((name		. "RIGHT SEMIDIRECT PRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22CC)	; ⋌
    ))
(define-char
  '((name		. "REVERSED TILDE EQUALS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22CD)	; ⋍
    ))
(define-char
  '((name		. "CURLY LOGICAL OR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22CE)	; ⋎
    ))
(define-char
  '((name		. "CURLY LOGICAL AND")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22CF)	; ⋏
    ))
(define-char
  '((name		. "DOUBLE SUBSET")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22D0)	; ⋐
    ))
(define-char
  '((name		. "DOUBLE SUPERSET")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22D1)	; ⋑
    ))
(define-char
  '((name		. "DOUBLE INTERSECTION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22D2)	; ⋒
    ))
(define-char
  '((name		. "DOUBLE UNION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22D3)	; ⋓
    ))
(define-char
  '((name		. "PITCHFORK")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22D4)	; ⋔
    ))
(define-char
  '((name		. "EQUAL AND PARALLEL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22D5)	; ⋕
    ))
(define-char
  '((name		. "LESS-THAN WITH DOT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22D6)	; ⋖
    ))
(define-char
  '((name		. "GREATER-THAN WITH DOT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22D7)	; ⋗
    ))
(define-char
  '((name		. "VERY MUCH LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22D8)	; ⋘
    ))
(define-char
  '((name		. "VERY MUCH GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22D9)	; ⋙
    ))
(define-char
  '((name		. "LESS-THAN EQUAL TO OR GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0213-1	. #x2776)	; �����
    (ucs			. #x22DA)	; ⋚
    ))
(define-char
  '((name		. "GREATER-THAN EQUAL TO OR LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (japanese-jisx0213-1	. #x2777)	; �����
    (ucs			. #x22DB)	; ⋛
    ))
(define-char
  '((name		. "EQUAL TO OR LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22DC)	; ⋜
    ))
(define-char
  '((name		. "EQUAL TO OR GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22DD)	; ⋝
    ))
(define-char
  '((name		. "EQUAL TO OR PRECEDES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22DE)	; ⋞
    ))
(define-char
  '((name		. "EQUAL TO OR SUCCEEDS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22DF)	; ⋟
    ))
(define-char
  '((name		. "DOES NOT PRECEDE OR EQUAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x227C #x0338)
    (ucs		. #x22E0)	; ⋠
    ))
(define-char
  '((name		. "DOES NOT SUCCEED OR EQUAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x227D #x0338)
    (ucs		. #x22E1)	; ⋡
    ))
(define-char
  '((name		. "NOT SQUARE IMAGE OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2291 #x0338)
    (ucs		. #x22E2)	; ⋢
    ))
(define-char
  '((name		. "NOT SQUARE ORIGINAL OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2292 #x0338)
    (ucs		. #x22E3)	; ⋣
    ))
(define-char
  '((name		. "SQUARE IMAGE OF OR NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22E4)	; ⋤
    ))
(define-char
  '((name		. "SQUARE ORIGINAL OF OR NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22E5)	; ⋥
    ))
(define-char
  '((name		. "LESS-THAN BUT NOT EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22E6)	; ⋦
    ))
(define-char
  '((name		. "GREATER-THAN BUT NOT EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22E7)	; ⋧
    ))
(define-char
  '((name		. "PRECEDES BUT NOT EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22E8)	; ⋨
    ))
(define-char
  '((name		. "SUCCEEDS BUT NOT EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22E9)	; ⋩
    ))
(define-char
  '((name		. "NOT NORMAL SUBGROUP OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22B2 #x0338)
    (ucs		. #x22EA)	; ⋪
    ))
(define-char
  '((name		. "DOES NOT CONTAIN AS NORMAL SUBGROUP")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22B3 #x0338)
    (ucs		. #x22EB)	; ⋫
    ))
(define-char
  '((name		. "NOT NORMAL SUBGROUP OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22B4 #x0338)
    (ucs		. #x22EC)	; ⋬
    ))
(define-char
  '((name		. "DOES NOT CONTAIN AS NORMAL SUBGROUP OR EQUAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22B5 #x0338)
    (ucs		. #x22ED)	; ⋭
    ))
(define-char
  '((name		. "VERTICAL ELLIPSIS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22EE)	; ⋮
    ))
(define-char
  '((name		. "MIDLINE HORIZONTAL ELLIPSIS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x22EF)	; ⋯
    ))
(define-char
  '((name		. "UP RIGHT DIAGONAL ELLIPSIS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22F0)	; ⋰
    ))
(define-char
  '((name		. "DOWN RIGHT DIAGONAL ELLIPSIS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x22F1)	; ⋱
    ))
