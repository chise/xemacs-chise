;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name		. "FOR ALL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2200)	; ∀
    (=jis-x0208-1983	. #x224F)	; &I-J83-224F;
    (=ks-x1001		. #x2223)	; &I-K0-2223;
    (=jis-x0208-1990	. #x224F)	; &I-J90-224F;
    (=jef-china3	. #x7FDC)	; &I-JC3-7FDC;
    ))
(define-char
  '((name		. "COMPLEMENT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2201)	; ∁
    ))
(define-char
  '((name		. "PARTIAL DIFFERENTIAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2202)	; ∂
    (=jis-x0208-1983	. #x225F)	; &I-J83-225F;
    (=ks-x1001		. #x2153)	; &I-K0-2153;
    (=jis-x0208-1990	. #x225F)	; &I-J90-225F;
    (=jef-china3	. #x7FE1)	; &I-JC3-7FE1;
    ))
(define-char
  '((name		. "THERE EXISTS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2203)	; ∃
    (=jis-x0208-1983	. #x2250)	; &I-J83-2250;
    (=ks-x1001		. #x2224)	; &I-K0-2224;
    (=jis-x0208-1990	. #x2250)	; &I-J90-2250;
    (=jef-china3	. #x7FDD)	; &I-JC3-7FDD;
    ))
(define-char
  '((name		. "THERE DOES NOT EXIST")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2203 #x0338)
    (=ucs		. #x2204)	; ∄
    ))
(define-char
  '((name		. "EMPTY SET")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2205)	; ∅
    (=jis-x0213-1-2000	. #x2247)	; &I-JX1-2247;
    ))
(define-char
  '((name		. "INCREMENT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2206)	; ∆
    ))
(define-char
  '((name		. "NABLA")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2207)	; ∇
    (=jis-x0208-1983	. #x2260)	; &I-J83-2260;
    (=ks-x1001		. #x2154)	; &I-K0-2154;
    (=jis-x0208-1990	. #x2260)	; &I-J90-2260;
    (=jef-china3	. #x7FE2)	; &I-JC3-7FE2;
    ))
(define-char
  '((name		. "ELEMENT OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2208)	; ∈
    (=gb2312		. #x214A)	; &I-G0-214A;
    (=jis-x0208-1983	. #x223A)	; &I-J83-223A;
    (=ks-x1001		. #x2174)	; &I-K0-2174;
    (=jis-x0208-1990	. #x223A)	; &I-J90-223A;
    (=jef-china3	. #x7FD0)	; &I-JC3-7FD0;
    ))
(define-char
  '((name		. "NOT AN ELEMENT OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2208 #x0338)
    (=ucs		. #x2209)	; ∉
    (=jis-x0213-1-2000	. #x2246)	; &I-JX1-2246;
    ))
(define-char
  '((name		. "SMALL ELEMENT OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x220A)	; ∊
    ))
(define-char
  '((name		. "CONTAINS AS MEMBER")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x220B)	; ∋
    (=jis-x0208-1983	. #x223B)	; &I-J83-223B;
    (=ks-x1001		. #x2175)	; &I-K0-2175;
    (=jis-x0208-1990	. #x223B)	; &I-J90-223B;
    (=jef-china3	. #x7FD1)	; &I-JC3-7FD1;
    ))
(define-char
  '((name		. "DOES NOT CONTAIN AS MEMBER")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x220B #x0338)
    (=ucs		. #x220C)	; ∌
    ))
(define-char
  '((name		. "SMALL CONTAINS AS MEMBER")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x220D)	; ∍
    ))
(define-char
  '((name		. "END OF PROOF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x220E)	; ∎
    ))
(define-char
  '((name		. "N-ARY PRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x220F)	; ∏
    (=gb2312		. #x2147)	; &I-G0-2147;
    (=ks-x1001		. #x2233)	; &I-K0-2233;
    ))
(define-char
  '((name		. "N-ARY COPRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2210)	; ∐
    ))
(define-char
  '((name		. "N-ARY SUMMATION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2211)	; ∑
    (=gb2312		. #x2146)	; &I-G0-2146;
    (=ks-x1001		. #x2232)	; &I-K0-2232;
    ))
(define-char
  '((name		. "MINUS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x2212)	; −
    (=jis-x0208		. #x215D)	; &I-J90-215D;
    ))
(define-char
  '((name		. "MINUS-OR-PLUS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x2213)	; ∓
    (=jis-x0213-1-2000	. #x235B)	; &I-JX1-235B;
    ))
(define-char
  '((name		. "DOT PLUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2214)	; ∔
    ))
(define-char
  '((name		. "DIVISION SLASH")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2215)	; ∕
    (=cns11643-1	. #x2261)	; &I-C1-2261;
    (=big5		. #xA241)	; &I-B-A241;
    ))
(define-char
  '((name		. "SET MINUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2216)	; ∖
    ))
(define-char
  '((name		. "ASTERISK OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2217)	; ∗
    ))
(define-char
  '((name		. "RING OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2218)	; ∘
    ))
(define-char
  '((name		. "BULLET OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2219)	; ∙
    ))
(define-char
  '((name		. "SQUARE ROOT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x221A)	; √
    (=gb2312		. #x214C)	; &I-G0-214C;
    (=jis-x0208-1983	. #x2265)	; &I-J83-2265;
    (=ks-x1001		. #x216E)	; &I-K0-216E;
    (=jis-x0208-1990	. #x2265)	; &I-J90-2265;
    (=cns11643-1	. #x2235)	; &I-C1-2235;
    (=big5		. #xA1D4)	; &I-B-A1D4;
    ))
(define-char
  '((name		. "CUBE ROOT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x221B)	; ∛
    ))
(define-char
  '((name		. "FOURTH ROOT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x221C)	; ∜
    ))
(define-char
  '((name		. "PROPORTIONAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x221D)	; ∝
    (=gb2312		. #x2158)	; &I-G0-2158;
    (=jis-x0208-1983	. #x2267)	; &I-J83-2267;
    (=ks-x1001		. #x2170)	; &I-K0-2170;
    (=jis-x0208-1990	. #x2267)	; &I-J90-2267;
    (=jef-china3	. #x7FE7)	; &I-JC3-7FE7;
    ))
(define-char
  '((name		. "INFINITY")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x221E)	; ∞
    (=jis-x0208		. #x2167)	; &I-J90-2167;
    (=gb2312		. #x215E)	; &I-G0-215E;
    (=ks-x1001		. #x2144)	; &I-K0-2144;
    (=cns11643-1	. #x223C)	; &I-C1-223C;
    (=big5		. #xA1DB)	; &I-B-A1DB;
    ))
(define-char
  '((name		. "RIGHT ANGLE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x221F)	; ∟
    (=cns11643-1	. #x2249)	; &I-C1-2249;
    (=jis-x0213-1-2000	. #x2D78)	; &I-JX1-2D78;
    (=big5		. #xA1E8)	; &I-B-A1E8;
    ))
(define-char
  '((name		. "ANGLE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2220)	; ∠
    (=gb2312		. #x214F)	; &I-G0-214F;
    (=jis-x0208-1983	. #x225C)	; &I-J83-225C;
    (=ks-x1001		. #x2150)	; &I-K0-2150;
    (=jis-x0208-1990	. #x225C)	; &I-J90-225C;
    (=cns11643-1	. #x2248)	; &I-C1-2248;
    (=big5		. #xA1E7)	; &I-B-A1E7;
    (=jef-china3	. #x7FDE)	; &I-JC3-7FDE;
    ))
(define-char
  '((name		. "MEASURED ANGLE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2221)	; ∡
    ))
(define-char
  '((name		. "SPHERICAL ANGLE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2222)	; ∢
    ))
(define-char
  '((name		. "DIVIDES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2223)	; ∣
    (=big5		. #xA1FD)	; &I-B-A1FD;
    ))
(define-char
  '((name		. "DOES NOT DIVIDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2223 #x0338)
    (=ucs		. #x2224)	; ∤
    ))
(define-char
  '((name		. "PARALLEL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2225)	; ∥
    (=gb2312		. #x214E)	; &I-G0-214E;
    (=ks-x1001		. #x212B)	; &I-K0-212B;
    (=jis-x0213-1-2000	. #x2254)	; &I-JX1-2254;
    (=big5		. #xA1FC)	; &I-B-A1FC;
    ))
(define-char
  '((name		. "NOT PARALLEL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2225 #x0338)
    (=ucs		. #x2226)	; ∦
    (=jis-x0213-1-2000	. #x2255)	; &I-JX1-2255;
    ))
(define-char
  '((name		. "LOGICAL AND")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2227)	; ∧
    (=gb2312		. #x2144)	; &I-G0-2144;
    (=jis-x0208-1983	. #x224A)	; &I-J83-224A;
    (=ks-x1001		. #x217C)	; &I-K0-217C;
    (=jis-x0208-1990	. #x224A)	; &I-J90-224A;
    ))
(define-char
  '((name		. "LOGICAL OR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2228)	; ∨
    (=gb2312		. #x2145)	; &I-G0-2145;
    (=jis-x0208-1983	. #x224B)	; &I-J83-224B;
    (=ks-x1001		. #x217D)	; &I-K0-217D;
    (=jis-x0208-1990	. #x224B)	; &I-J90-224B;
    ))
(define-char
  '((name		. "INTERSECTION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2229)	; ∩
    (=gb2312		. #x2149)	; &I-G0-2149;
    (=jis-x0208-1983	. #x2241)	; &I-J83-2241;
    (=ks-x1001		. #x217B)	; &I-K0-217B;
    (=jis-x0208-1990	. #x2241)	; &I-J90-2241;
    (=cns11643-1	. #x2245)	; &I-C1-2245;
    (=big5		. #xA1E4)	; &I-B-A1E4;
    ))
(define-char
  '((name		. "UNION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x222A)	; ∪
    (=gb2312		. #x2148)	; &I-G0-2148;
    (=jis-x0208-1983	. #x2240)	; &I-J83-2240;
    (=ks-x1001		. #x217A)	; &I-K0-217A;
    (=jis-x0208-1990	. #x2240)	; &I-J90-2240;
    (=cns11643-1	. #x2246)	; &I-C1-2246;
    (=big5		. #xA1E5)	; &I-B-A1E5;
    ))
(define-char
  '((name		. "INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x222B)	; ∫
    (=gb2312		. #x2152)	; &I-G0-2152;
    (=jis-x0208-1983	. #x2269)	; &I-J83-2269;
    (=ks-x1001		. #x2172)	; &I-K0-2172;
    (=jis-x0208-1990	. #x2269)	; &I-J90-2269;
    (=cns11643-1	. #x224D)	; &I-C1-224D;
    (=big5		. #xA1EC)	; &I-B-A1EC;
    (=jef-china3	. #x7FE8)	; &I-JC3-7FE8;
    ))
(define-char
  '((name		. "DOUBLE INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	compat #x222B #x222B)
    (=ucs		. #x222C)	; ∬
    (=jis-x0208-1983	. #x226A)	; &I-J83-226A;
    (=ks-x1001		. #x2173)	; &I-K0-2173;
    (=jis-x0208-1990	. #x226A)	; &I-J90-226A;
    (=jef-china3	. #x7FE9)	; &I-JC3-7FE9;
    ))
(define-char
  '((name		. "TRIPLE INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	compat #x222B #x222B #x222B)
    (=ucs		. #x222D)	; ∭
    ))
(define-char
  '((name		. "CONTOUR INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x222E)	; ∮
    (=gb2312		. #x2153)	; &I-G0-2153;
    (=ks-x1001		. #x2231)	; &I-K0-2231;
    (=cns11643-1	. #x224E)	; &I-C1-224E;
    (=jis-x0213-1-2000	. #x2D73)	; &I-JX1-2D73;
    (=big5		. #xA1ED)	; &I-B-A1ED;
    ))
(define-char
  '((name		. "SURFACE INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	compat #x222E #x222E)
    (=ucs		. #x222F)	; ∯
    ))
(define-char
  '((name		. "VOLUME INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	compat #x222E #x222E #x222E)
    (=ucs		. #x2230)	; ∰
    ))
(define-char
  '((name		. "CLOCKWISE INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2231)	; ∱
    ))
(define-char
  '((name		. "CLOCKWISE CONTOUR INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2232)	; ∲
    ))
(define-char
  '((name		. "ANTICLOCKWISE CONTOUR INTEGRAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2233)	; ∳
    ))
(define-char
  '((name		. "THEREFORE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2234)	; ∴
    (=jis-x0208		. #x2168)	; &I-J90-2168;
    (=gb2312		. #x2160)	; &I-G0-2160;
    (=ks-x1001		. #x2145)	; &I-K0-2145;
    (=cns11643-1	. #x2250)	; &I-C1-2250;
    (=big5		. #xA1EF)	; &I-B-A1EF;
    ))
(define-char
  '((name		. "BECAUSE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2235)	; ∵
    (=gb2312		. #x215F)	; &I-G0-215F;
    (=jis-x0208-1983	. #x2268)	; &I-J83-2268;
    (=ks-x1001		. #x2171)	; &I-K0-2171;
    (=jis-x0208-1990	. #x2268)	; &I-J90-2268;
    (=cns11643-1	. #x224F)	; &I-C1-224F;
    (=big5		. #xA1EE)	; &I-B-A1EE;
    ))
(define-char
  '((name		. "RATIO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2236)	; ∶
    (=gb2312		. #x2143)	; &I-G0-2143;
    ))
(define-char
  '((name		. "PROPORTION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2237)	; ∷
    (=gb2312		. #x214B)	; &I-G0-214B;
    ))
(define-char
  '((name		. "DOT MINUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2238)	; ∸
    ))
(define-char
  '((name		. "EXCESS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2239)	; ∹
    ))
(define-char
  '((name		. "GEOMETRIC PROPORTION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x223A)	; ∺
    ))
(define-char
  '((name		. "HOMOTHETIC")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x223B)	; ∻
    ))
(define-char
  '((name		. "TILDE OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x223C)	; ∼
    (=ks-x1001		. #x212D)	; &I-K0-212D;
    (=cns11643-1	. #x2244)	; &I-C1-2244;
    (=big5		. #xA1E3)	; &I-B-A1E3;
    (=ucs@big5		. #xFF5E)	; ∼
    ))
(define-char
  '((name		. "REVERSED TILDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "lazy S")
    (=ucs		. #x223D)	; ∽
    (=gb2312		. #x2157)	; &I-G0-2157;
    (=jis-x0208-1983	. #x2266)	; &I-J83-2266;
    (=ks-x1001		. #x216F)	; &I-K0-216F;
    (=jis-x0208-1990	. #x2266)	; &I-J90-2266;
    (=jef-china3	. #x7FE6)	; &I-JC3-7FE6;
    ))
(define-char
  '((name		. "INVERTED LAZY S")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x223E)	; ∾
    ))
(define-char
  '((name		. "SINE WAVE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x223F)	; ∿
    ))
(define-char
  '((name		. "WREATH PRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2240)	; ≀
    ))
(define-char
  '((name		. "NOT TILDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x223C #x0338)
    (=ucs		. #x2241)	; ≁
    ))
(define-char
  '((name		. "MINUS TILDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2242)	; ≂
    ))
(define-char
  '((name		. "ASYMPTOTICALLY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2243)	; ≃
    (=jis-x0213-1-2000	. #x226C)	; &I-JX1-226C;
    ))
(define-char
  '((name		. "NOT ASYMPTOTICALLY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2243 #x0338)
    (=ucs		. #x2244)	; ≄
    ))
(define-char
  '((name		. "APPROXIMATELY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2245)	; ≅
    (=jis-x0213-1-2000	. #x226D)	; &I-JX1-226D;
    ))
(define-char
  '((name		. "APPROXIMATELY BUT NOT ACTUALLY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2246)	; ≆
    ))
(define-char
  '((name		. "NEITHER APPROXIMATELY NOR ACTUALLY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2245 #x0338)
    (=ucs		. #x2247)	; ≇
    ))
(define-char
  '((name		. "ALMOST EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2248)	; ≈
    (=gb2312		. #x2156)	; &I-G0-2156;
    (=jis-x0213-1-2000	. #x226E)	; &I-JX1-226E;
    ))
(define-char
  '((name		. "NOT ALMOST EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2248 #x0338)
    (=ucs		. #x2249)	; ≉
    ))
(define-char
  '((name		. "ALMOST EQUAL OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x224A)	; ≊
    ))
(define-char
  '((name		. "TRIPLE TILDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x224B)	; ≋
    ))
(define-char
  '((name		. "ALL EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x224C)	; ≌
    (=gb2312		. #x2155)	; &I-G0-2155;
    ))
(define-char
  '((name		. "EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x224D)	; ≍
    ))
(define-char
  '((name		. "GEOMETRICALLY EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x224E)	; ≎
    ))
(define-char
  '((name		. "DIFFERENCE BETWEEN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x224F)	; ≏
    ))
(define-char
  '((name		. "APPROACHES THE LIMIT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2250)	; ≐
    ))
(define-char
  '((name		. "GEOMETRICALLY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2251)	; ≑
    ))
(define-char
  '((name		. "APPROXIMATELY EQUAL TO OR THE IMAGE OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2252)	; ≒
    (=jis-x0208-1983	. #x2262)	; &I-J83-2262;
    (=ks-x1001		. #x2156)	; &I-K0-2156;
    (=jis-x0208-1990	. #x2262)	; &I-J90-2262;
    (=cns11643-1	. #x223D)	; &I-C1-223D;
    (=big5		. #xA1DC)	; &I-B-A1DC;
    ))
(define-char
  '((name		. "IMAGE OF OR APPROXIMATELY EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2253)	; ≓
    ))
(define-char
  '((name		. "COLON EQUALS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2254)	; ≔
    ))
(define-char
  '((name		. "EQUALS COLON")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2255)	; ≕
    ))
(define-char
  '((name		. "RING IN EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2256)	; ≖
    ))
(define-char
  '((name		. "RING EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2257)	; ≗
    ))
(define-char
  '((name		. "CORRESPONDS TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2258)	; ≘
    ))
(define-char
  '((name		. "ESTIMATES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2259)	; ≙
    ))
(define-char
  '((name		. "EQUIANGULAR TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x225A)	; ≚
    ))
(define-char
  '((name		. "STAR EQUALS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x225B)	; ≛
    ))
(define-char
  '((name		. "DELTA EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x225C)	; ≜
    ))
(define-char
  '((name		. "EQUAL TO BY DEFINITION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x225D)	; ≝
    ))
(define-char
  '((name		. "MEASURED BY")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x225E)	; ≞
    ))
(define-char
  '((name		. "QUESTIONED EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x225F)	; ≟
    ))
(define-char
  '((name		. "NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x003D #x0338)
    (=ucs		. #x2260)	; ≠
    (=jis-x0208		. #x2162)	; &I-J90-2162;
    (=gb2312		. #x2159)	; &I-G0-2159;
    (=ks-x1001		. #x2141)	; &I-K0-2141;
    (=cns11643-1	. #x223B)	; &I-C1-223B;
    (=big5		. #xA1DA)	; &I-B-A1DA;
    ))
(define-char
  '((name		. "IDENTICAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2261)	; ≡
    (=gb2312		. #x2154)	; &I-G0-2154;
    (=jis-x0208-1983	. #x2261)	; &I-J83-2261;
    (=ks-x1001		. #x2155)	; &I-K0-2155;
    (=jis-x0208-1990	. #x2261)	; &I-J90-2261;
    (=cns11643-1	. #x223E)	; &I-C1-223E;
    (=big5		. #xA1DD)	; &I-B-A1DD;
    ))
(define-char
  '((name		. "NOT IDENTICAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2261 #x0338)
    (=ucs		. #x2262)	; ≢
    (=jis-x0213-1-2000	. #x226B)	; &I-JX1-226B;
    ))
(define-char
  '((name		. "STRICTLY EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2263)	; ≣
    ))
(define-char
  '((name		. "LESS-THAN OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2264)	; ≤
    (=gb2312		. #x215C)	; &I-G0-215C;
    (=ks-x1001		. #x2142)	; &I-K0-2142;
    ))
(define-char
  '((name		. "GREATER-THAN OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2265)	; ≥
    (=gb2312		. #x215D)	; &I-G0-215D;
    (=ks-x1001		. #x2143)	; &I-K0-2143;
    ))
(define-char
  '((name		. "LESS-THAN OVER EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2266)	; ≦
    (=jis-x0208		. #x2165)	; &I-J90-2165;
    (=cns11643-1	. #x2239)	; &I-C1-2239;
    (=big5		. #xA1D8)	; &I-B-A1D8;
    ))
(define-char
  '((name		. "GREATER-THAN OVER EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2267)	; ≧
    (=jis-x0208		. #x2166)	; &I-J90-2166;
    (=cns11643-1	. #x223A)	; &I-C1-223A;
    (=big5		. #xA1D9)	; &I-B-A1D9;
    ))
(define-char
  '((name		. "LESS-THAN BUT NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2268)	; ≨
    ))
(define-char
  '((name		. "GREATER-THAN BUT NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2269)	; ≩
    ))
(define-char
  '((name		. "MUCH LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x226A)	; ≪
    (=jis-x0208-1983	. #x2263)	; &I-J83-2263;
    (=ks-x1001		. #x216C)	; &I-K0-216C;
    (=jis-x0208-1990	. #x2263)	; &I-J90-2263;
    (=jef-china3	. #x7FE3)	; &I-JC3-7FE3;
    ))
(define-char
  '((name		. "MUCH GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x226B)	; ≫
    (=jis-x0208-1983	. #x2264)	; &I-J83-2264;
    (=ks-x1001		. #x216D)	; &I-K0-216D;
    (=jis-x0208-1990	. #x2264)	; &I-J90-2264;
    (=jef-china3	. #x7FE4)	; &I-JC3-7FE4;
    ))
(define-char
  '((name		. "BETWEEN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x226C)	; ≬
    ))
(define-char
  '((name		. "NOT EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x224D #x0338)
    (=ucs		. #x226D)	; ≭
    ))
(define-char
  '((name		. "NOT LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x003C #x0338)
    (=ucs		. #x226E)	; ≮
    (=gb2312		. #x215A)	; &I-G0-215A;
    ))
(define-char
  '((name		. "NOT GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x003E #x0338)
    (=ucs		. #x226F)	; ≯
    (=gb2312		. #x215B)	; &I-G0-215B;
    ))
(define-char
  '((name		. "NEITHER LESS-THAN NOR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2264 #x0338)
    (=ucs		. #x2270)	; ≰
    ))
(define-char
  '((name		. "NEITHER GREATER-THAN NOR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2265 #x0338)
    (=ucs		. #x2271)	; ≱
    ))
(define-char
  '((name		. "LESS-THAN OR EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2272)	; ≲
    ))
(define-char
  '((name		. "GREATER-THAN OR EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2273)	; ≳
    ))
(define-char
  '((name		. "NEITHER LESS-THAN NOR EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2272 #x0338)
    (=ucs		. #x2274)	; ≴
    ))
(define-char
  '((name		. "NEITHER GREATER-THAN NOR EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2273 #x0338)
    (=ucs		. #x2275)	; ≵
    ))
(define-char
  '((name		. "LESS-THAN OR GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2276)	; ≶
    (=jis-x0213-1-2000	. #x226F)	; &I-JX1-226F;
    ))
(define-char
  '((name		. "GREATER-THAN OR LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2277)	; ≷
    (=jis-x0213-1-2000	. #x2270)	; &I-JX1-2270;
    ))
(define-char
  '((name		. "NEITHER LESS-THAN NOR GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2276 #x0338)
    (=ucs		. #x2278)	; ≸
    ))
(define-char
  '((name		. "NEITHER GREATER-THAN NOR LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2277 #x0338)
    (=ucs		. #x2279)	; ≹
    ))
(define-char
  '((name		. "PRECEDES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x227A)	; ≺
    ))
(define-char
  '((name		. "SUCCEEDS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x227B)	; ≻
    ))
(define-char
  '((name		. "PRECEDES OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x227C)	; ≼
    ))
(define-char
  '((name		. "SUCCEEDS OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x227D)	; ≽
    ))
(define-char
  '((name		. "PRECEDES OR EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x227E)	; ≾
    ))
(define-char
  '((name		. "SUCCEEDS OR EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x227F)	; ≿
    ))
(define-char
  '((name		. "DOES NOT PRECEDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x227A #x0338)
    (=ucs		. #x2280)	; ⊀
    ))
(define-char
  '((name		. "DOES NOT SUCCEED")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x227B #x0338)
    (=ucs		. #x2281)	; ⊁
    ))
(define-char
  '((name		. "SUBSET OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2282)	; ⊂
    (=jis-x0208-1983	. #x223E)	; &I-J83-223E;
    (=ks-x1001		. #x2178)	; &I-K0-2178;
    (=jis-x0208-1990	. #x223E)	; &I-J90-223E;
    (=jef-china3	. #x7FD4)	; &I-JC3-7FD4;
    ))
(define-char
  '((name		. "SUPERSET OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2283)	; ⊃
    (=jis-x0208-1983	. #x223F)	; &I-J83-223F;
    (=ks-x1001		. #x2179)	; &I-K0-2179;
    (=jis-x0208-1990	. #x223F)	; &I-J90-223F;
    (=jef-china3	. #x7FD5)	; &I-JC3-7FD5;
    ))
(define-char
  '((name		. "NOT A SUBSET OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2282 #x0338)
    (=ucs		. #x2284)	; ⊄
    (=jis-x0213-1-2000	. #x2242)	; &I-JX1-2242;
    ))
(define-char
  '((name		. "NOT A SUPERSET OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2283 #x0338)
    (=ucs		. #x2285)	; ⊅
    (=jis-x0213-1-2000	. #x2243)	; &I-JX1-2243;
    ))
(define-char
  '((name		. "SUBSET OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2286)	; ⊆
    (=jis-x0208-1983	. #x223C)	; &I-J83-223C;
    (=ks-x1001		. #x2176)	; &I-K0-2176;
    (=jis-x0208-1990	. #x223C)	; &I-J90-223C;
    (=jef-china3	. #x7FD2)	; &I-JC3-7FD2;
    ))
(define-char
  '((name		. "SUPERSET OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2287)	; ⊇
    (=jis-x0208-1983	. #x223D)	; &I-J83-223D;
    (=ks-x1001		. #x2177)	; &I-K0-2177;
    (=jis-x0208-1990	. #x223D)	; &I-J90-223D;
    (=jef-china3	. #x7FD3)	; &I-JC3-7FD3;
    ))
(define-char
  '((name		. "NEITHER A SUBSET OF NOR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2286 #x0338)
    (=ucs		. #x2288)	; ⊈
    ))
(define-char
  '((name		. "NEITHER A SUPERSET OF NOR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2287 #x0338)
    (=ucs		. #x2289)	; ⊉
    ))
(define-char
  '((name		. "SUBSET OF WITH NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x228A)	; ⊊
    (=jis-x0213-1-2000	. #x2244)	; &I-JX1-2244;
    ))
(define-char
  '((name		. "SUPERSET OF WITH NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x228B)	; ⊋
    (=jis-x0213-1-2000	. #x2245)	; &I-JX1-2245;
    ))
(define-char
  '((name		. "MULTISET")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x228C)	; ⊌
    ))
(define-char
  '((name		. "MULTISET MULTIPLICATION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x228D)	; ⊍
    ))
(define-char
  '((name		. "MULTISET UNION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x228E)	; ⊎
    ))
(define-char
  '((name		. "SQUARE IMAGE OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x228F)	; ⊏
    ))
(define-char
  '((name		. "SQUARE ORIGINAL OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2290)	; ⊐
    ))
(define-char
  '((name		. "SQUARE IMAGE OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2291)	; ⊑
    ))
(define-char
  '((name		. "SQUARE ORIGINAL OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2292)	; ⊒
    ))
(define-char
  '((name		. "SQUARE CAP")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2293)	; ⊓
    ))
(define-char
  '((name		. "SQUARE CUP")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2294)	; ⊔
    ))
(define-char
  '((name		. "CIRCLED PLUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2295)	; ⊕
    (=cns11643-1	. #x2253)	; &I-C1-2253;
    (=jis-x0213-1-2000	. #x2251)	; &I-JX1-2251;
    (=big5		. #xA1F2)	; &I-B-A1F2;
    ))
(define-char
  '((name		. "CIRCLED MINUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2296)	; ⊖
    (=jis-x0213-1-2000	. #x2252)	; &I-JX1-2252;
    ))
(define-char
  '((name		. "CIRCLED TIMES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2297)	; ⊗
    (=jis-x0213-1-2000	. #x2253)	; &I-JX1-2253;
    ))
(define-char
  '((name		. "CIRCLED DIVISION SLASH")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2298)	; ⊘
    ))
(define-char
  '((name		. "CIRCLED DOT OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2299)	; ⊙
    (=gb2312		. #x2151)	; &I-G0-2151;
    (=ks-x1001		. #x2241)	; &I-K0-2241;
    (=cns11643-1	. #x2254)	; &I-C1-2254;
    (=big5		. #xA1F3)	; &I-B-A1F3;
    ))
(define-char
  '((name		. "CIRCLED RING OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x229A)	; ⊚
    ))
(define-char
  '((name		. "CIRCLED ASTERISK OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x229B)	; ⊛
    ))
(define-char
  '((name		. "CIRCLED EQUALS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x229C)	; ⊜
    ))
(define-char
  '((name		. "CIRCLED DASH")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x229D)	; ⊝
    ))
(define-char
  '((name		. "SQUARED PLUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x229E)	; ⊞
    ))
(define-char
  '((name		. "SQUARED MINUS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x229F)	; ⊟
    ))
(define-char
  '((name		. "SQUARED TIMES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22A0)	; ⊠
    ))
(define-char
  '((name		. "SQUARED DOT OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22A1)	; ⊡
    ))
(define-char
  '((name		. "RIGHT TACK")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22A2)	; ⊢
    ))
(define-char
  '((name		. "LEFT TACK")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22A3)	; ⊣
    ))
(define-char
  '((name		. "DOWN TACK")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22A4)	; ⊤
    ))
(define-char
  '((name		. "UP TACK")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22A5)	; ⊥
    (=gb2312		. #x214D)	; &I-G0-214D;
    (=jis-x0208-1983	. #x225D)	; &I-J83-225D;
    (=ks-x1001		. #x2151)	; &I-K0-2151;
    (=jis-x0208-1990	. #x225D)	; &I-J90-225D;
    (=cns11643-1	. #x2247)	; &I-C1-2247;
    (=big5		. #xA1E6)	; &I-B-A1E6;
    ))
(define-char
  '((name		. "ASSERTION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22A6)	; ⊦
    ))
(define-char
  '((name		. "MODELS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22A7)	; ⊧
    ))
(define-char
  '((name		. "TRUE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22A8)	; ⊨
    ))
(define-char
  '((name		. "FORCES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22A9)	; ⊩
    ))
(define-char
  '((name		. "TRIPLE VERTICAL BAR RIGHT TURNSTILE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22AA)	; ⊪
    ))
(define-char
  '((name		. "DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22AB)	; ⊫
    ))
(define-char
  '((name		. "DOES NOT PROVE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22A2 #x0338)
    (=ucs		. #x22AC)	; ⊬
    ))
(define-char
  '((name		. "NOT TRUE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22A8 #x0338)
    (=ucs		. #x22AD)	; ⊭
    ))
(define-char
  '((name		. "DOES NOT FORCE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22A9 #x0338)
    (=ucs		. #x22AE)	; ⊮
    ))
(define-char
  '((name . "NEGATED DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22AB #x0338)
    (=ucs		. #x22AF)	; ⊯
    ))
(define-char
  '((name		. "PRECEDES UNDER RELATION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22B0)	; ⊰
    ))
(define-char
  '((name		. "SUCCEEDS UNDER RELATION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22B1)	; ⊱
    ))
(define-char
  '((name		. "NORMAL SUBGROUP OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22B2)	; ⊲
    ))
(define-char
  '((name		. "CONTAINS AS NORMAL SUBGROUP")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22B3)	; ⊳
    ))
(define-char
  '((name		. "NORMAL SUBGROUP OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22B4)	; ⊴
    ))
(define-char
  '((name		. "CONTAINS AS NORMAL SUBGROUP OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22B5)	; ⊵
    ))
(define-char
  '((name		. "ORIGINAL OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22B6)	; ⊶
    ))
(define-char
  '((name		. "IMAGE OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22B7)	; ⊷
    ))
(define-char
  '((name		. "MULTIMAP")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22B8)	; ⊸
    ))
(define-char
  '((name		. "HERMITIAN CONJUGATE MATRIX")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22B9)	; ⊹
    ))
(define-char
  '((name		. "INTERCALATE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22BA)	; ⊺
    ))
(define-char
  '((name		. "XOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22BB)	; ⊻
    ))
(define-char
  '((name		. "NAND")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22BC)	; ⊼
    ))
(define-char
  '((name		. "NOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22BD)	; ⊽
    ))
(define-char
  '((name		. "RIGHT ANGLE WITH ARC")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22BE)	; ⊾
    ))
(define-char
  '((name		. "RIGHT TRIANGLE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22BF)	; ⊿
    (=cns11643-1	. #x224A)	; &I-C1-224A;
    (=jis-x0213-1-2000	. #x2D79)	; &I-JX1-2D79;
    (=big5		. #xA1E9)	; &I-B-A1E9;
    ))
(define-char
  '((name		. "N-ARY LOGICAL AND")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22C0)	; ⋀
    (=jef-china3	. #x7FD8)	; &I-JC3-7FD8;
    ))
(define-char
  '((name		. "N-ARY LOGICAL OR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22C1)	; ⋁
    (=jef-china3	. #x7FD9)	; &I-JC3-7FD9;
    ))
(define-char
  '((name		. "N-ARY INTERSECTION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22C2)	; ⋂
    (=jef-china3	. #x7FD7)	; &I-JC3-7FD7;
    ))
(define-char
  '((name		. "N-ARY UNION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22C3)	; ⋃
    (=jef-china3	. #x7FD6)	; &I-JC3-7FD6;
    ))
(define-char
  '((name		. "DIAMOND OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22C4)	; ⋄
    ))
(define-char
  '((name		. "DOT OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22C5)	; ⋅
    ))
(define-char
  '((name		. "STAR OPERATOR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22C6)	; ⋆
    ))
(define-char
  '((name		. "DIVISION TIMES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22C7)	; ⋇
    ))
(define-char
  '((name		. "BOWTIE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22C8)	; ⋈
    ))
(define-char
  '((name		. "LEFT NORMAL FACTOR SEMIDIRECT PRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22C9)	; ⋉
    ))
(define-char
  '((name		. "RIGHT NORMAL FACTOR SEMIDIRECT PRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22CA)	; ⋊
    ))
(define-char
  '((name		. "LEFT SEMIDIRECT PRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22CB)	; ⋋
    ))
(define-char
  '((name		. "RIGHT SEMIDIRECT PRODUCT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22CC)	; ⋌
    ))
(define-char
  '((name		. "REVERSED TILDE EQUALS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22CD)	; ⋍
    ))
(define-char
  '((name		. "CURLY LOGICAL OR")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22CE)	; ⋎
    ))
(define-char
  '((name		. "CURLY LOGICAL AND")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22CF)	; ⋏
    ))
(define-char
  '((name		. "DOUBLE SUBSET")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22D0)	; ⋐
    ))
(define-char
  '((name		. "DOUBLE SUPERSET")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22D1)	; ⋑
    ))
(define-char
  '((name		. "DOUBLE INTERSECTION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22D2)	; ⋒
    ))
(define-char
  '((name		. "DOUBLE UNION")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22D3)	; ⋓
    ))
(define-char
  '((name		. "PITCHFORK")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22D4)	; ⋔
    ))
(define-char
  '((name		. "EQUAL AND PARALLEL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22D5)	; ⋕
    ))
(define-char
  '((name		. "LESS-THAN WITH DOT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22D6)	; ⋖
    ))
(define-char
  '((name		. "GREATER-THAN WITH DOT")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22D7)	; ⋗
    ))
(define-char
  '((name		. "VERY MUCH LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22D8)	; ⋘
    ))
(define-char
  '((name		. "VERY MUCH GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22D9)	; ⋙
    ))
(define-char
  '((name		. "LESS-THAN EQUAL TO OR GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22DA)	; ⋚
    (=jis-x0213-1-2000	. #x2776)	; &I-JX1-2776;
    ))
(define-char
  '((name		. "GREATER-THAN EQUAL TO OR LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22DB)	; ⋛
    (=jis-x0213-1-2000	. #x2777)	; &I-JX1-2777;
    ))
(define-char
  '((name		. "EQUAL TO OR LESS-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22DC)	; ⋜
    ))
(define-char
  '((name		. "EQUAL TO OR GREATER-THAN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22DD)	; ⋝
    ))
(define-char
  '((name		. "EQUAL TO OR PRECEDES")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22DE)	; ⋞
    ))
(define-char
  '((name		. "EQUAL TO OR SUCCEEDS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22DF)	; ⋟
    ))
(define-char
  '((name		. "DOES NOT PRECEDE OR EQUAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x227C #x0338)
    (=ucs		. #x22E0)	; ⋠
    ))
(define-char
  '((name		. "DOES NOT SUCCEED OR EQUAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x227D #x0338)
    (=ucs		. #x22E1)	; ⋡
    ))
(define-char
  '((name		. "NOT SQUARE IMAGE OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2291 #x0338)
    (=ucs		. #x22E2)	; ⋢
    ))
(define-char
  '((name		. "NOT SQUARE ORIGINAL OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x2292 #x0338)
    (=ucs		. #x22E3)	; ⋣
    ))
(define-char
  '((name		. "SQUARE IMAGE OF OR NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22E4)	; ⋤
    ))
(define-char
  '((name		. "SQUARE ORIGINAL OF OR NOT EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22E5)	; ⋥
    ))
(define-char
  '((name		. "LESS-THAN BUT NOT EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22E6)	; ⋦
    ))
(define-char
  '((name		. "GREATER-THAN BUT NOT EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22E7)	; ⋧
    ))
(define-char
  '((name		. "PRECEDES BUT NOT EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22E8)	; ⋨
    ))
(define-char
  '((name		. "SUCCEEDS BUT NOT EQUIVALENT TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22E9)	; ⋩
    ))
(define-char
  '((name		. "NOT NORMAL SUBGROUP OF")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22B2 #x0338)
    (=ucs		. #x22EA)	; ⋪
    ))
(define-char
  '((name		. "DOES NOT CONTAIN AS NORMAL SUBGROUP")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22B3 #x0338)
    (=ucs		. #x22EB)	; ⋫
    ))
(define-char
  '((name		. "NOT NORMAL SUBGROUP OF OR EQUAL TO")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22B4 #x0338)
    (=ucs		. #x22EC)	; ⋬
    ))
(define-char
  '((name		. "DOES NOT CONTAIN AS NORMAL SUBGROUP OR EQUAL")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->decomposition	#x22B5 #x0338)
    (=ucs		. #x22ED)	; ⋭
    ))
(define-char
  '((name		. "VERTICAL ELLIPSIS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22EE)	; ⋮
    ))
(define-char
  '((name		. "MIDLINE HORIZONTAL ELLIPSIS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x22EF)	; ⋯
    ))
(define-char
  '((name		. "UP RIGHT DIAGONAL ELLIPSIS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22F0)	; ⋰
    ))
(define-char
  '((name		. "DOWN RIGHT DIAGONAL ELLIPSIS")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x22F1)	; ⋱
    ))
