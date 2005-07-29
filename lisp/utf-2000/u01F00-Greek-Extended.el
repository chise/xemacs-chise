;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH PSILI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH PSILI")
      (=ucs		  . #x1F08)	; Ἀ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F00)	; ἀ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH DASIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH DASIA")
      (=ucs		  . #x1F09)	; Ἁ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F01)	; ἁ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND VARIA")
      (=ucs		  . #x1F0A)	; Ἂ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA WITH PSILI")
      (=ucs		  . #x1F00)	; ἀ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F02)	; ἂ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND VARIA")
      (=ucs		  . #x1F0B)	; Ἃ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA WITH DASIA")
      (=ucs		  . #x1F01)	; ἁ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F03)	; ἃ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH PSILI AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND OXIA")
      (=ucs		  . #x1F0C)	; Ἄ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA WITH PSILI")
      (=ucs		  . #x1F00)	; ἀ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F04)	; ἄ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH DASIA AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND OXIA")
      (=ucs		  . #x1F0D)	; Ἅ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA WITH DASIA")
      (=ucs		  . #x1F01)	; ἁ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F05)	; ἅ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F0E)	; Ἆ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA WITH PSILI")
      (=ucs		  . #x1F00)	; ἀ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F06)	; ἆ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F0F)	; Ἇ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA WITH DASIA")
      (=ucs		  . #x1F01)	; ἁ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F07)	; ἇ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH PSILI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA WITH PSILI")
      (=ucs		  . #x1F00)	; ἀ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Α
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F08)	; Ἀ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH DASIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA WITH DASIA")
      (=ucs		  . #x1F01)	; ἁ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Α
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F09)	; Ἁ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND VARIA")
      (=ucs		  . #x1F02)	; ἂ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH PSILI")
      (=ucs		  . #x1F08)	; Ἀ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F0A)	; Ἂ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND VARIA")
      (=ucs		  . #x1F03)	; ἃ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH DASIA")
      (=ucs		  . #x1F09)	; Ἁ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F0B)	; Ἃ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND OXIA")
      (=ucs		  . #x1F04)	; ἄ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH PSILI")
      (=ucs		  . #x1F08)	; Ἀ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F0C)	; Ἄ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND OXIA")
      (=ucs		  . #x1F05)	; ἅ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH DASIA")
      (=ucs		  . #x1F09)	; Ἁ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F0D)	; Ἅ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND PERISPOMENI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F06)	; ἆ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH PSILI")
      (=ucs		  . #x1F08)	; Ἀ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F0E)	; Ἆ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND PERISPOMENI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F07)	; ἇ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH DASIA")
      (=ucs		  . #x1F09)	; Ἁ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F0F)	; Ἇ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH PSILI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH PSILI")
      (=ucs		  . #x1F18)	; Ἐ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER EPSILON")
      (=ucs		  . #x03B5)	; ε
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F10)	; ἐ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH DASIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH DASIA")
      (=ucs		  . #x1F19)	; Ἑ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER EPSILON")
      (=ucs		  . #x03B5)	; ε
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F11)	; ἑ
    ))
(define-char
  '((name . "GREEK SMALL LETTER EPSILON WITH PSILI AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER EPSILON WITH PSILI AND VARIA")
      (=ucs		  . #x1F1A)	; Ἒ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER EPSILON WITH PSILI")
      (=ucs		  . #x1F10)	; ἐ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F12)	; ἒ
    ))
(define-char
  '((name . "GREEK SMALL LETTER EPSILON WITH DASIA AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER EPSILON WITH DASIA AND VARIA")
      (=ucs		  . #x1F1B)	; Ἓ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER EPSILON WITH DASIA")
      (=ucs		  . #x1F11)	; ἑ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F13)	; ἓ
    ))
(define-char
  '((name . "GREEK SMALL LETTER EPSILON WITH PSILI AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER EPSILON WITH PSILI AND OXIA")
      (=ucs		  . #x1F1C)	; Ἔ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER EPSILON WITH PSILI")
      (=ucs		  . #x1F10)	; ἐ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F14)	; ἔ
    ))
(define-char
  '((name . "GREEK SMALL LETTER EPSILON WITH DASIA AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER EPSILON WITH DASIA AND OXIA")
      (=ucs		  . #x1F1D)	; Ἕ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER EPSILON WITH DASIA")
      (=ucs		  . #x1F11)	; ἑ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F15)	; ἕ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON WITH PSILI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON WITH PSILI")
      (=ucs		  . #x1F10)	; ἐ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER EPSILON")
      (=ucs		  . #x0395)	; Ε
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F18)	; Ἐ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON WITH DASIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON WITH DASIA")
      (=ucs		  . #x1F11)	; ἑ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER EPSILON")
      (=ucs		  . #x0395)	; Ε
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F19)	; Ἑ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER EPSILON WITH PSILI AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER EPSILON WITH PSILI AND VARIA")
      (=ucs		  . #x1F12)	; ἒ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH PSILI")
      (=ucs		  . #x1F18)	; Ἐ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F1A)	; Ἒ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER EPSILON WITH DASIA AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER EPSILON WITH DASIA AND VARIA")
      (=ucs		  . #x1F13)	; ἓ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH DASIA")
      (=ucs		  . #x1F19)	; Ἑ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F1B)	; Ἓ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER EPSILON WITH PSILI AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER EPSILON WITH PSILI AND OXIA")
      (=ucs		  . #x1F14)	; ἔ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH PSILI")
      (=ucs		  . #x1F18)	; Ἐ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F1C)	; Ἔ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER EPSILON WITH DASIA AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER EPSILON WITH DASIA AND OXIA")
      (=ucs		  . #x1F15)	; ἕ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH DASIA")
      (=ucs		  . #x1F19)	; Ἑ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F1D)	; Ἕ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH PSILI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA WITH PSILI")
      (=ucs		  . #x1F28)	; Ἠ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA")
      (=ucs		  . #x03B7)	; η
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F20)	; ἠ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH DASIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA WITH DASIA")
      (=ucs		  . #x1F29)	; Ἡ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA")
      (=ucs		  . #x03B7)	; η
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F21)	; ἡ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH PSILI AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND VARIA")
      (=ucs		  . #x1F2A)	; Ἢ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH PSILI")
      (=ucs		  . #x1F20)	; ἠ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F22)	; ἢ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH DASIA AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND VARIA")
      (=ucs		  . #x1F2B)	; Ἣ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH DASIA")
      (=ucs		  . #x1F21)	; ἡ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F23)	; ἣ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH PSILI AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND OXIA")
      (=ucs		  . #x1F2C)	; Ἤ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH PSILI")
      (=ucs		  . #x1F20)	; ἠ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F24)	; ἤ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH DASIA AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND OXIA")
      (=ucs		  . #x1F2D)	; Ἥ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH DASIA")
      (=ucs		  . #x1F21)	; ἡ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F25)	; ἥ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH PSILI AND PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F2E)	; Ἦ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH PSILI")
      (=ucs		  . #x1F20)	; ἠ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F26)	; ἦ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH DASIA AND PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F2F)	; Ἧ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH DASIA")
      (=ucs		  . #x1F21)	; ἡ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F27)	; ἧ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH PSILI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA WITH PSILI")
      (=ucs		  . #x1F20)	; ἠ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (=ucs		  . #x0397)	; Η
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F28)	; Ἠ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH DASIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA WITH DASIA")
      (=ucs		  . #x1F21)	; ἡ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (=ucs		  . #x0397)	; Η
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F29)	; Ἡ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ETA WITH PSILI AND VARIA")
      (=ucs		  . #x1F22)	; ἢ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ETA WITH PSILI")
      (=ucs		  . #x1F28)	; Ἠ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F2A)	; Ἢ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ETA WITH DASIA AND VARIA")
      (=ucs		  . #x1F23)	; ἣ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ETA WITH DASIA")
      (=ucs		  . #x1F29)	; Ἡ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F2B)	; Ἣ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH PSILI AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA WITH PSILI AND OXIA")
      (=ucs		  . #x1F24)	; ἤ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ETA WITH PSILI")
      (=ucs		  . #x1F28)	; Ἠ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F2C)	; Ἤ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH DASIA AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA WITH DASIA AND OXIA")
      (=ucs		  . #x1F25)	; ἥ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ETA WITH DASIA")
      (=ucs		  . #x1F29)	; Ἡ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F2D)	; Ἥ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND PERISPOMENI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ETA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F26)	; ἦ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ETA WITH PSILI")
      (=ucs		  . #x1F28)	; Ἠ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F2E)	; Ἦ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND PERISPOMENI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ETA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F27)	; ἧ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ETA WITH DASIA")
      (=ucs		  . #x1F29)	; Ἡ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F2F)	; Ἧ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH PSILI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH PSILI")
      (=ucs		  . #x1F38)	; Ἰ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F30)	; ἰ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH DASIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DASIA")
      (=ucs		  . #x1F39)	; Ἱ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F31)	; ἱ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH PSILI AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER IOTA WITH PSILI AND VARIA")
      (=ucs		  . #x1F3A)	; Ἲ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA WITH PSILI")
      (=ucs		  . #x1F30)	; ἰ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F32)	; ἲ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH DASIA AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER IOTA WITH DASIA AND VARIA")
      (=ucs		  . #x1F3B)	; Ἳ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA WITH DASIA")
      (=ucs		  . #x1F31)	; ἱ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F33)	; ἳ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH PSILI AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER IOTA WITH PSILI AND OXIA")
      (=ucs		  . #x1F3C)	; Ἴ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA WITH PSILI")
      (=ucs		  . #x1F30)	; ἰ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F34)	; ἴ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH DASIA AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER IOTA WITH DASIA AND OXIA")
      (=ucs		  . #x1F3D)	; Ἵ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA WITH DASIA")
      (=ucs		  . #x1F31)	; ἱ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F35)	; ἵ
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH PSILI AND PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER IOTA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F3E)	; Ἶ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA WITH PSILI")
      (=ucs		  . #x1F30)	; ἰ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F36)	; ἶ
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DASIA AND PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER IOTA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F3F)	; Ἷ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA WITH DASIA")
      (=ucs		  . #x1F31)	; ἱ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F37)	; ἷ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH PSILI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH PSILI")
      (=ucs		  . #x1F30)	; ἰ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Ι
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F38)	; Ἰ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH DASIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH DASIA")
      (=ucs		  . #x1F31)	; ἱ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Ι
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F39)	; Ἱ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER IOTA WITH PSILI AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER IOTA WITH PSILI AND VARIA")
      (=ucs		  . #x1F32)	; ἲ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH PSILI")
      (=ucs		  . #x1F38)	; Ἰ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F3A)	; Ἲ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER IOTA WITH DASIA AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER IOTA WITH DASIA AND VARIA")
      (=ucs		  . #x1F33)	; ἳ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DASIA")
      (=ucs		  . #x1F39)	; Ἱ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F3B)	; Ἳ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER IOTA WITH PSILI AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER IOTA WITH PSILI AND OXIA")
      (=ucs		  . #x1F34)	; ἴ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH PSILI")
      (=ucs		  . #x1F38)	; Ἰ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F3C)	; Ἴ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER IOTA WITH DASIA AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER IOTA WITH DASIA AND OXIA")
      (=ucs		  . #x1F35)	; ἵ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DASIA")
      (=ucs		  . #x1F39)	; Ἱ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F3D)	; Ἵ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER IOTA WITH PSILI AND PERISPOMENI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER IOTA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F36)	; ἶ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH PSILI")
      (=ucs		  . #x1F38)	; Ἰ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F3E)	; Ἶ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER IOTA WITH DASIA AND PERISPOMENI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER IOTA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F37)	; ἷ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DASIA")
      (=ucs		  . #x1F39)	; Ἱ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F3F)	; Ἷ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH PSILI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH PSILI")
      (=ucs		  . #x1F48)	; Ὀ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMICRON")
      (=ucs		  . #x03BF)	; ο
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F40)	; ὀ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH DASIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH DASIA")
      (=ucs		  . #x1F49)	; Ὁ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMICRON")
      (=ucs		  . #x03BF)	; ο
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F41)	; ὁ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMICRON WITH PSILI AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMICRON WITH PSILI AND VARIA")
      (=ucs		  . #x1F4A)	; Ὂ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMICRON WITH PSILI")
      (=ucs		  . #x1F40)	; ὀ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F42)	; ὂ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMICRON WITH DASIA AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMICRON WITH DASIA AND VARIA")
      (=ucs		  . #x1F4B)	; Ὃ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMICRON WITH DASIA")
      (=ucs		  . #x1F41)	; ὁ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F43)	; ὃ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMICRON WITH PSILI AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMICRON WITH PSILI AND OXIA")
      (=ucs		  . #x1F4C)	; Ὄ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMICRON WITH PSILI")
      (=ucs		  . #x1F40)	; ὀ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F44)	; ὄ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMICRON WITH DASIA AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMICRON WITH DASIA AND OXIA")
      (=ucs		  . #x1F4D)	; Ὅ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMICRON WITH DASIA")
      (=ucs		  . #x1F41)	; ὁ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F45)	; ὅ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH PSILI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON WITH PSILI")
      (=ucs		  . #x1F40)	; ὀ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMICRON")
      (=ucs		  . #x039F)	; Ο
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F48)	; Ὀ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH DASIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON WITH DASIA")
      (=ucs		  . #x1F41)	; ὁ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMICRON")
      (=ucs		  . #x039F)	; Ο
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F49)	; Ὁ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMICRON WITH PSILI AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMICRON WITH PSILI AND VARIA")
      (=ucs		  . #x1F42)	; ὂ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH PSILI")
      (=ucs		  . #x1F48)	; Ὀ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F4A)	; Ὂ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMICRON WITH DASIA AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMICRON WITH DASIA AND VARIA")
      (=ucs		  . #x1F43)	; ὃ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH DASIA")
      (=ucs		  . #x1F49)	; Ὁ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F4B)	; Ὃ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMICRON WITH PSILI AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMICRON WITH PSILI AND OXIA")
      (=ucs		  . #x1F44)	; ὄ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH PSILI")
      (=ucs		  . #x1F48)	; Ὀ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F4C)	; Ὄ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMICRON WITH DASIA AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMICRON WITH DASIA AND OXIA")
      (=ucs		  . #x1F45)	; ὅ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH DASIA")
      (=ucs		  . #x1F49)	; Ὁ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F4D)	; Ὅ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH PSILI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; υ
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F50)	; ὐ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH DASIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH DASIA")
      (=ucs		  . #x1F59)	; Ὑ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; υ
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F51)	; ὑ
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH PSILI AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON WITH PSILI")
      (=ucs		  . #x1F50)	; ὐ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F52)	; ὒ
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DASIA AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER UPSILON WITH DASIA AND VARIA")
      (=ucs		  . #x1F5B)	; Ὓ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DASIA")
      (=ucs		  . #x1F51)	; ὑ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F53)	; ὓ
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH PSILI AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON WITH PSILI")
      (=ucs		  . #x1F50)	; ὐ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F54)	; ὔ
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DASIA AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER UPSILON WITH DASIA AND OXIA")
      (=ucs		  . #x1F5D)	; Ὕ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DASIA")
      (=ucs		  . #x1F51)	; ὑ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F55)	; ὕ
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH PSILI AND PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON WITH PSILI")
      (=ucs		  . #x1F50)	; ὐ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F56)	; ὖ
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DASIA AND PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER UPSILON WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F5F)	; Ὗ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DASIA")
      (=ucs		  . #x1F51)	; ὑ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F57)	; ὗ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH DASIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DASIA")
      (=ucs		  . #x1F51)	; ὑ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (=ucs		  . #x03A5)	; Υ
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F59)	; Ὑ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER UPSILON WITH DASIA AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER UPSILON WITH DASIA AND VARIA")
      (=ucs		  . #x1F53)	; ὓ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH DASIA")
      (=ucs		  . #x1F59)	; Ὑ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F5B)	; Ὓ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER UPSILON WITH DASIA AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER UPSILON WITH DASIA AND OXIA")
      (=ucs		  . #x1F55)	; ὕ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH DASIA")
      (=ucs		  . #x1F59)	; Ὑ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F5D)	; Ὕ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER UPSILON WITH DASIA AND PERISPOMENI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER UPSILON WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F57)	; ὗ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH DASIA")
      (=ucs		  . #x1F59)	; Ὑ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F5F)	; Ὗ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH PSILI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH PSILI")
      (=ucs		  . #x1F68)	; Ὠ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (=ucs		  . #x03C9)	; ω
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F60)	; ὠ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH DASIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH DASIA")
      (=ucs		  . #x1F69)	; Ὡ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (=ucs		  . #x03C9)	; ω
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F61)	; ὡ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND VARIA")
      (=ucs		  . #x1F6A)	; Ὢ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA WITH PSILI")
      (=ucs		  . #x1F60)	; ὠ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F62)	; ὢ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND VARIA")
      (=ucs		  . #x1F6B)	; Ὣ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA WITH DASIA")
      (=ucs		  . #x1F61)	; ὡ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F63)	; ὣ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH PSILI AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND OXIA")
      (=ucs		  . #x1F6C)	; Ὤ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA WITH PSILI")
      (=ucs		  . #x1F60)	; ὠ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F64)	; ὤ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH DASIA AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND OXIA")
      (=ucs		  . #x1F6D)	; Ὥ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA WITH DASIA")
      (=ucs		  . #x1F61)	; ὡ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F65)	; ὥ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F6E)	; Ὦ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA WITH PSILI")
      (=ucs		  . #x1F60)	; ὠ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F66)	; ὦ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F6F)	; Ὧ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA WITH DASIA")
      (=ucs		  . #x1F61)	; ὡ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F67)	; ὧ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH PSILI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA WITH PSILI")
      (=ucs		  . #x1F60)	; ὠ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (=ucs		  . #x03A9)	; Ω
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1F68)	; Ὠ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH DASIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA WITH DASIA")
      (=ucs		  . #x1F61)	; ὡ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (=ucs		  . #x03A9)	; Ω
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1F69)	; Ὡ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND VARIA")
      (=ucs		  . #x1F62)	; ὢ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH PSILI")
      (=ucs		  . #x1F68)	; Ὠ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F6A)	; Ὢ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND VARIA")
      (=ucs		  . #x1F63)	; ὣ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH DASIA")
      (=ucs		  . #x1F69)	; Ὡ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F6B)	; Ὣ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND OXIA")
      (=ucs		  . #x1F64)	; ὤ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH PSILI")
      (=ucs		  . #x1F68)	; Ὠ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F6C)	; Ὤ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND OXIA")
      (=ucs		  . #x1F65)	; ὥ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH DASIA")
      (=ucs		  . #x1F69)	; Ὡ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1F6D)	; Ὥ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND PERISPOMENI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F66)	; ὦ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH PSILI")
      (=ucs		  . #x1F68)	; Ὠ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F6E)	; Ὦ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND PERISPOMENI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F67)	; ὧ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH DASIA")
      (=ucs		  . #x1F69)	; Ὡ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1F6F)	; Ὧ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH VARIA")
      (=ucs		  . #x1FBA)	; Ὰ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F70)	; ὰ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ALPHA WITH GRAVE")
    (=>ucs		. #x1F70)	; ὰ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER ALPHA")
      (=ucs		  . #x0251)	; ɑ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=jis-x0213-1-2000	. #x2B46)	; &JX1-2B46; [11-38]
    (=ucs@jis		. #x1F70)	; &JX1-2B46;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK SMALL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x03AC)	; ά
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH OXIA")
      (=ucs		  . #x1FBB)	; Ά
      ))
    (=ucs		. #x1F71)	; ά
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ALPHA WITH ACUTE")
    (=>ucs		. #x1F71)	; ά
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER ALPHA")
      (=ucs		  . #x0251)	; ɑ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=jis-x0213-1-2000	. #x2B47)	; &JX1-2B47; [11-39]
    (=ucs@jis		. #x1F71)	; &JX1-2B47;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH VARIA")
      (=ucs		  . #x1FC8)	; Ὲ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER EPSILON")
      (=ucs		  . #x03B5)	; ε
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F72)	; ὲ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER OPEN E WITH GRAVE")
    (=>ucs		. #x1F72)	; ὲ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER OPEN E WITH GRAVE")
      ))
    (=decomposition
     ((name		  . "LATIN SMALL LETTER OPEN E")
      (=ucs		  . #x025B)	; ɛ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=jis-x0213-1-2000	. #x2B50)	; &JX1-2B50; [11-48]
    (=ucs@jis		. #x1F72)	; &JX1-2B50;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK SMALL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x03AD)	; έ
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH OXIA")
      (=ucs		  . #x1FC9)	; Έ
      ))
    (=ucs		. #x1F73)	; έ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER OPEN E WITH ACUTE")
    (=>ucs		. #x1F73)	; έ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER OPEN E WITH ACUTE")
      ))
    (=decomposition
     ((name		  . "LATIN SMALL LETTER OPEN E")
      (=ucs		  . #x025B)	; ɛ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=jis-x0213-1-2000	. #x2B51)	; &JX1-2B51; [11-49]
    (=ucs@jis		. #x1F73)	; &JX1-2B51;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA WITH VARIA")
      (=ucs		  . #x1FCA)	; Ὴ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA")
      (=ucs		  . #x03B7)	; η
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F74)	; ὴ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK SMALL LETTER ETA WITH TONOS")
      (=ucs		  . #x03AE)	; ή
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA WITH OXIA")
      (=ucs		  . #x1FCB)	; Ή
      ))
    (=ucs		. #x1F75)	; ή
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH VARIA")
      (=ucs		  . #x1FDA)	; Ὶ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F76)	; ὶ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK SMALL LETTER IOTA WITH TONOS")
      (=ucs		  . #x03AF)	; ί
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH OXIA")
      (=ucs		  . #x1FDB)	; Ί
      ))
    (=ucs		. #x1F77)	; ί
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH VARIA")
      (=ucs		  . #x1FF8)	; Ὸ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMICRON")
      (=ucs		  . #x03BF)	; ο
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F78)	; ὸ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK SMALL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x03CC)	; ό
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH OXIA")
      (=ucs		  . #x1FF9)	; Ό
      ))
    (=ucs		. #x1F79)	; ό
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH VARIA")
      (=ucs		  . #x1FEA)	; Ὺ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; υ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F7A)	; ὺ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK SMALL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x03CD)	; ύ
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH OXIA")
      (=ucs		  . #x1FEB)	; Ύ
      ))
    (=ucs		. #x1F7B)	; ύ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH VARIA")
      (=ucs		  . #x1FFA)	; Ὼ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (=ucs		  . #x03C9)	; ω
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1F7C)	; ὼ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK SMALL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x03CE)	; ώ
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH OXIA")
      (=ucs		  . #x1FFB)	; Ώ
      ))
    (=ucs		. #x1F7D)	; ώ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND PROSGEGRAMMENI")
      (=ucs		  . #x1F88)	; ᾈ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA WITH PSILI")
      (=ucs		  . #x1F00)	; ἀ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F80)	; ᾀ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1F89)	; ᾉ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA WITH DASIA")
      (=ucs		  . #x1F01)	; ἁ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F81)	; ᾁ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND VARIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND VARIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1F8A)	; ᾊ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND VARIA")
      (=ucs		  . #x1F02)	; ἂ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F82)	; ᾂ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND VARIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND VARIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1F8B)	; ᾋ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND VARIA")
      (=ucs		  . #x1F03)	; ἃ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F83)	; ᾃ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND OXIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND OXIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1F8C)	; ᾌ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND OXIA")
      (=ucs		  . #x1F04)	; ἄ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F84)	; ᾄ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND OXIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND OXIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1F8D)	; ᾍ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND OXIA")
      (=ucs		  . #x1F05)	; ἅ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F85)	; ᾅ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI")
      (=ucs		  . #x1F8E)	; ᾎ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F06)	; ἆ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F86)	; ᾆ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI")
      (=ucs		  . #x1F8F)	; ᾏ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F07)	; ἇ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F87)	; ᾇ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND YPOGEGRAMMENI")
      (=ucs		  . #x1F80)	; ᾀ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH PSILI")
      (=ucs		  . #x1F08)	; Ἀ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F88)	; ᾈ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1F81)	; ᾁ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH DASIA")
      (=ucs		  . #x1F09)	; Ἁ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F89)	; ᾉ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND VARIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND VARIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1F82)	; ᾂ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND VARIA")
      (=ucs		  . #x1F0A)	; Ἂ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F8A)	; ᾊ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND VARIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND VARIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1F83)	; ᾃ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND VARIA")
      (=ucs		  . #x1F0B)	; Ἃ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F8B)	; ᾋ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND OXIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND OXIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1F84)	; ᾄ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND OXIA")
      (=ucs		  . #x1F0C)	; Ἄ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F8C)	; ᾌ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND OXIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND OXIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1F85)	; ᾅ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND OXIA")
      (=ucs		  . #x1F0D)	; Ἅ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F8D)	; ᾍ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI")
      (=ucs		  . #x1F86)	; ᾆ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER ALPHA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F0E)	; Ἆ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F8E)	; ᾎ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI")
      (=ucs		  . #x1F87)	; ᾇ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER ALPHA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F0F)	; Ἇ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F8F)	; ᾏ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH PSILI AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND PROSGEGRAMMENI")
      (=ucs		  . #x1F98)	; ᾘ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH PSILI")
      (=ucs		  . #x1F20)	; ἠ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F90)	; ᾐ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH DASIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1F99)	; ᾙ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH DASIA")
      (=ucs		  . #x1F21)	; ἡ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F91)	; ᾑ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH PSILI AND VARIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND VARIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1F9A)	; ᾚ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER ETA WITH PSILI AND VARIA")
      (=ucs		  . #x1F22)	; ἢ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F92)	; ᾒ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH DASIA AND VARIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND VARIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1F9B)	; ᾛ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER ETA WITH DASIA AND VARIA")
      (=ucs		  . #x1F23)	; ἣ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F93)	; ᾓ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH PSILI AND OXIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND OXIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1F9C)	; ᾜ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH PSILI AND OXIA")
      (=ucs		  . #x1F24)	; ἤ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F94)	; ᾔ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH DASIA AND OXIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND OXIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1F9D)	; ᾝ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH DASIA AND OXIA")
      (=ucs		  . #x1F25)	; ἥ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F95)	; ᾕ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI")
      (=ucs		  . #x1F9E)	; ᾞ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER ETA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F26)	; ἦ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F96)	; ᾖ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI")
      (=ucs		  . #x1F9F)	; ᾟ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER ETA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F27)	; ἧ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F97)	; ᾗ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ETA WITH PSILI AND YPOGEGRAMMENI")
      (=ucs		  . #x1F90)	; ᾐ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ETA WITH PSILI")
      (=ucs		  . #x1F28)	; Ἠ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F98)	; ᾘ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ETA WITH DASIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1F91)	; ᾑ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ETA WITH DASIA")
      (=ucs		  . #x1F29)	; Ἡ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F99)	; ᾙ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND VARIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ETA WITH PSILI AND VARIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1F92)	; ᾒ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND VARIA")
      (=ucs		  . #x1F2A)	; Ἢ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F9A)	; ᾚ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND VARIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ETA WITH DASIA AND VARIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1F93)	; ᾓ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND VARIA")
      (=ucs		  . #x1F2B)	; Ἣ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F9B)	; ᾛ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND OXIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ETA WITH PSILI AND OXIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1F94)	; ᾔ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND OXIA")
      (=ucs		  . #x1F2C)	; Ἤ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F9C)	; ᾜ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND OXIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ETA WITH DASIA AND OXIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1F95)	; ᾕ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND OXIA")
      (=ucs		  . #x1F2D)	; Ἥ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F9D)	; ᾝ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ETA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI")
      (=ucs		  . #x1F96)	; ᾖ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER ETA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F2E)	; Ἦ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F9E)	; ᾞ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ETA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI")
      (=ucs		  . #x1F97)	; ᾗ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER ETA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F2F)	; Ἧ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1F9F)	; ᾟ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND PROSGEGRAMMENI")
      (=ucs		  . #x1FA8)	; ᾨ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA WITH PSILI")
      (=ucs		  . #x1F60)	; ὠ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FA0)	; ᾠ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1FA9)	; ᾩ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA WITH DASIA")
      (=ucs		  . #x1F61)	; ὡ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FA1)	; ᾡ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND VARIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND VARIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1FAA)	; ᾪ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND VARIA")
      (=ucs		  . #x1F62)	; ὢ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FA2)	; ᾢ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND VARIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND VARIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1FAB)	; ᾫ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND VARIA")
      (=ucs		  . #x1F63)	; ὣ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FA3)	; ᾣ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND OXIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND OXIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1FAC)	; ᾬ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND OXIA")
      (=ucs		  . #x1F64)	; ὤ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FA4)	; ᾤ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND OXIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND OXIA AND PROSGEGRAMMENI")
      (=ucs		  . #x1FAD)	; ᾭ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND OXIA")
      (=ucs		  . #x1F65)	; ὥ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FA5)	; ᾥ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI")
      (=ucs		  . #x1FAE)	; ᾮ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F66)	; ὦ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FA6)	; ᾦ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI")
      (=ucs		  . #x1FAF)	; ᾯ
      ))
    (=decomposition
     ((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F67)	; ὧ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FA7)	; ᾧ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND YPOGEGRAMMENI")
      (=ucs		  . #x1FA0)	; ᾠ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH PSILI")
      (=ucs		  . #x1F68)	; Ὠ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FA8)	; ᾨ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1FA1)	; ᾡ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH DASIA")
      (=ucs		  . #x1F69)	; Ὡ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FA9)	; ᾩ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND VARIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND VARIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1FA2)	; ᾢ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND VARIA")
      (=ucs		  . #x1F6A)	; Ὢ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FAA)	; ᾪ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND VARIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND VARIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1FA3)	; ᾣ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND VARIA")
      (=ucs		  . #x1F6B)	; Ὣ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FAB)	; ᾫ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND OXIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND OXIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1FA4)	; ᾤ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND OXIA")
      (=ucs		  . #x1F6C)	; Ὤ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FAC)	; ᾬ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND OXIA AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND OXIA AND YPOGEGRAMMENI")
      (=ucs		  . #x1FA5)	; ᾥ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND OXIA")
      (=ucs		  . #x1F6D)	; Ὥ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FAD)	; ᾭ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI")
      (=ucs		  . #x1FA6)	; ᾦ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER OMEGA WITH PSILI AND PERISPOMENI")
      (=ucs		  . #x1F6E)	; Ὦ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FAE)	; ᾮ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI")
      (=ucs		  . #x1FA7)	; ᾧ
      ))
    (=decomposition
     ((name . "GREEK CAPITAL LETTER OMEGA WITH DASIA AND PERISPOMENI")
      (=ucs		  . #x1F6F)	; Ὧ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FAF)	; ᾯ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH VRACHY")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH VRACHY")
      (=ucs		  . #x1FB8)	; Ᾰ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x1FB0)	; ᾰ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH MACRON")
      (=ucs		  . #x1FB9)	; Ᾱ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x1FB1)	; ᾱ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH VARIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA WITH VARIA")
      (=ucs		  . #x1F70)	; ὰ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FB2)	; ᾲ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ALPHA WITH PROSGEGRAMMENI")
      (=ucs		  . #x1FBC)	; ᾼ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FB3)	; ᾳ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH OXIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x03AC)	; ά
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FB4)	; ᾴ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1FB6)	; ᾶ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ALPHA WITH PERISPOMENI AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ALPHA WITH PERISPOMENI")
      (=ucs		  . #x1FB6)	; ᾶ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FB7)	; ᾷ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH VRACHY")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA WITH VRACHY")
      (=ucs		  . #x1FB0)	; ᾰ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Α
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x1FB8)	; Ᾰ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA WITH MACRON")
      (=ucs		  . #x1FB1)	; ᾱ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Α
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x1FB9)	; Ᾱ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA WITH VARIA")
      (=ucs		  . #x1F70)	; ὰ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Α
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1FBA)	; Ὰ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x0386)	; Ά
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA WITH OXIA")
      (=ucs		  . #x1F71)	; ά
      ))
    (=ucs		. #x1FBB)	; Ά
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER ALPHA WITH PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER ALPHA WITH YPOGEGRAMMENI")
      (=ucs		  . #x1FB3)	; ᾳ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Α
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FBC)	; ᾼ
    ))
(define-char
  '((name		. "GREEK KORONIS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1FBD)	; ᾽
    ))
(define-char
  '((name		. "GREEK PROSGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Ι
      ))
    (=ucs		. #x1FBE)	; ι
    ))
(define-char
  '((name		. "GREEK PSILI")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1FBF)	; ᾿
    ))
(define-char
  '((name		. "GREEK PERISPOMENI")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1FC0)	; ῀
    ))
(define-char
  '((name		. "GREEK DIALYTIKA AND PERISPOMENI")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "DIAERESIS")
      (=ucs		  . #x00A8)	; ¨
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1FC1)	; ῁
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH VARIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH VARIA")
      (=ucs		  . #x1F74)	; ὴ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FC2)	; ῂ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER ETA WITH PROSGEGRAMMENI")
      (=ucs		  . #x1FCC)	; ῌ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA")
      (=ucs		  . #x03B7)	; η
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FC3)	; ῃ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH OXIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH TONOS")
      (=ucs		  . #x03AE)	; ή
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FC4)	; ῄ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA")
      (=ucs		  . #x03B7)	; η
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1FC6)	; ῆ
    ))
(define-char
  '((name . "GREEK SMALL LETTER ETA WITH PERISPOMENI AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER ETA WITH PERISPOMENI")
      (=ucs		  . #x1FC6)	; ῆ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FC7)	; ῇ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON WITH VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON WITH VARIA")
      (=ucs		  . #x1F72)	; ὲ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER EPSILON")
      (=ucs		  . #x0395)	; Ε
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1FC8)	; Ὲ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON WITH OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x0388)	; Έ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON WITH OXIA")
      (=ucs		  . #x1F73)	; έ
      ))
    (=ucs		. #x1FC9)	; Έ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA WITH VARIA")
      (=ucs		  . #x1F74)	; ὴ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (=ucs		  . #x0397)	; Η
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1FCA)	; Ὴ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK CAPITAL LETTER ETA WITH TONOS")
      (=ucs		  . #x0389)	; Ή
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA WITH OXIA")
      (=ucs		  . #x1F75)	; ή
      ))
    (=ucs		. #x1FCB)	; Ή
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA WITH YPOGEGRAMMENI")
      (=ucs		  . #x1FC3)	; ῃ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (=ucs		  . #x0397)	; Η
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FCC)	; ῌ
    ))
(define-char
  '((name		. "GREEK PSILI AND VARIA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK PSILI")
      (=ucs		  . #x1FBF)	; ᾿
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1FCD)	; ῍
    ))
(define-char
  '((name		. "GREEK PSILI AND OXIA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK PSILI")
      (=ucs		  . #x1FBF)	; ᾿
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1FCE)	; ῎
    ))
(define-char
  '((name		. "GREEK PSILI AND PERISPOMENI")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK PSILI")
      (=ucs		  . #x1FBF)	; ᾿
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1FCF)	; ῏
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH VRACHY")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH VRACHY")
      (=ucs		  . #x1FD8)	; Ῐ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x1FD0)	; ῐ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH MACRON")
      (=ucs		  . #x1FD9)	; Ῑ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x1FD1)	; ῑ
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03CA)	; ϊ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1FD2)	; ῒ
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
      (=ucs		  . #x0390)	; ΐ
      ))
    (=ucs		. #x1FD3)	; ΐ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1FD6)	; ῖ
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03CA)	; ϊ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1FD7)	; ῗ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH VRACHY")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH VRACHY")
      (=ucs		  . #x1FD0)	; ῐ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Ι
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x1FD8)	; Ῐ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH MACRON")
      (=ucs		  . #x1FD1)	; ῑ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Ι
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x1FD9)	; Ῑ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH VARIA")
      (=ucs		  . #x1F76)	; ὶ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Ι
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1FDA)	; Ὶ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH TONOS")
      (=ucs		  . #x038A)	; Ί
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH OXIA")
      (=ucs		  . #x1F77)	; ί
      ))
    (=ucs		. #x1FDB)	; Ί
    ))
(define-char
  '((name		. "GREEK DASIA AND VARIA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK DASIA")
      (=ucs		  . #x1FFE)	; ῾
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1FDD)	; ῝
    ))
(define-char
  '((name		. "GREEK DASIA AND OXIA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK DASIA")
      (=ucs		  . #x1FFE)	; ῾
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x1FDE)	; ῞
    ))
(define-char
  '((name		. "GREEK DASIA AND PERISPOMENI")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK DASIA")
      (=ucs		  . #x1FFE)	; ῾
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1FDF)	; ῟
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH VRACHY")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH VRACHY")
      (=ucs		  . #x1FE8)	; Ῠ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; υ
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x1FE0)	; ῠ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH MACRON")
      (=ucs		  . #x1FE9)	; Ῡ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; υ
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x1FE1)	; ῡ
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND VARIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03CB)	; ϋ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1FE2)	; ῢ
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND OXIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
      (=ucs		  . #x03B0)	; ΰ
      ))
    (=ucs		. #x1FE3)	; ΰ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER RHO WITH PSILI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER RHO")
      (=ucs		  . #x03C1)	; ρ
      )
     ((name		  . "COMBINING COMMA ABOVE")
      (=ucs		  . #x0313)	; ̓
      ))
    (=ucs		. #x1FE4)	; ῤ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER RHO WITH DASIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER RHO WITH DASIA")
      (=ucs		  . #x1FEC)	; Ῥ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER RHO")
      (=ucs		  . #x03C1)	; ρ
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1FE5)	; ῥ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; υ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1FE6)	; ῦ
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03CB)	; ϋ
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1FE7)	; ῧ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH VRACHY")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH VRACHY")
      (=ucs		  . #x1FE0)	; ῠ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (=ucs		  . #x03A5)	; Υ
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x1FE8)	; Ῠ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH MACRON")
      (=ucs		  . #x1FE1)	; ῡ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (=ucs		  . #x03A5)	; Υ
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x1FE9)	; Ῡ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH VARIA")
      (=ucs		  . #x1F7A)	; ὺ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (=ucs		  . #x03A5)	; Υ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1FEA)	; Ὺ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x038E)	; Ύ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH OXIA")
      (=ucs		  . #x1F7B)	; ύ
      ))
    (=ucs		. #x1FEB)	; Ύ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER RHO WITH DASIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER RHO WITH DASIA")
      (=ucs		  . #x1FE5)	; ῥ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (=ucs		  . #x03A1)	; Ρ
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1FEC)	; Ῥ
    ))
(define-char
  '((name		. "GREEK DIALYTIKA AND VARIA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "DIAERESIS")
      (=ucs		  . #x00A8)	; ¨
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1FED)	; ῭
    ))
(define-char
  '((name		. "GREEK DIALYTIKA AND OXIA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK DIALYTIKA TONOS")
      (=ucs		  . #x0385)	; ΅
      ))
    (=ucs		. #x1FEE)	; ΅
    ))
(define-char
  '((name		. "GREEK VARIA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GRAVE ACCENT")
      (=ucs		  . #x0060)	; `
      ))
    (=ucs		. #x1FEF)	; `
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH VARIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA WITH VARIA")
      (=ucs		  . #x1F7C)	; ὼ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FF2)	; ῲ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER OMEGA WITH PROSGEGRAMMENI")
      (=ucs		  . #x1FFC)	; ῼ
      ))
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (=ucs		  . #x03C9)	; ω
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FF3)	; ῳ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH OXIA AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x03CE)	; ώ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FF4)	; ῴ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH PERISPOMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (=ucs		  . #x03C9)	; ω
      )
     ((name		  . "COMBINING GREEK PERISPOMENI")
      (=ucs		  . #x0342)	; ͂
      ))
    (=ucs		. #x1FF6)	; ῶ
    ))
(define-char
  '((name . "GREEK SMALL LETTER OMEGA WITH PERISPOMENI AND YPOGEGRAMMENI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "GREEK SMALL LETTER OMEGA WITH PERISPOMENI")
      (=ucs		  . #x1FF6)	; ῶ
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FF7)	; ῷ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON WITH VARIA")
      (=ucs		  . #x1F78)	; ὸ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMICRON")
      (=ucs		  . #x039F)	; Ο
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1FF8)	; Ὸ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x038C)	; Ό
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON WITH OXIA")
      (=ucs		  . #x1F79)	; ό
      ))
    (=ucs		. #x1FF9)	; Ό
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH VARIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA WITH VARIA")
      (=ucs		  . #x1F7C)	; ὼ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (=ucs		  . #x03A9)	; Ω
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x1FFA)	; Ὼ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH OXIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x038F)	; Ώ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA WITH OXIA")
      (=ucs		  . #x1F7D)	; ώ
      ))
    (=ucs		. #x1FFB)	; Ώ
    ))
(define-char
  '((name . "GREEK CAPITAL LETTER OMEGA WITH PROSGEGRAMMENI")
    (general-category	letter titlecase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "GREEK SMALL LETTER OMEGA WITH YPOGEGRAMMENI")
      (=ucs		  . #x1FF3)	; ῳ
      ))
    (=decomposition
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (=ucs		  . #x03A9)	; Ω
      )
     ((name		  . "COMBINING GREEK YPOGEGRAMMENI")
      (=ucs		  . #x0345)	; ͅ
      ))
    (=ucs		. #x1FFC)	; ῼ
    ))
(define-char
  '((name		. "GREEK OXIA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->canonical
     ((name		  . "ACUTE ACCENT")
      (=ucs		  . #x00B4)	; ´
      ))
    (=ucs		. #x1FFD)	; ´
    ))
(define-char
  '((name		. "GREEK DASIA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      )
     ((name		  . "COMBINING REVERSED COMMA ABOVE")
      (=ucs		  . #x0314)	; ̔
      ))
    (=ucs		. #x1FFE)	; ῾
    ))
