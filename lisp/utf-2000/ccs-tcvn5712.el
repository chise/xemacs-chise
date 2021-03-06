;;; ccs-viscii.el --- Mapping table for TCVN 5712.

;; Copyright (C) 1999 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.

;; Author: MORIOKA Tomohiko <tomo@m17n.org>
;; Keywords: coded character set

;; This file is part of UTF-2000.

;; UTF-2000 is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; UTF-2000 is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with UTF-2000; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(set-charset-mapping-table
 'latin-tcvn5712
 [?\u00A0 ; 0xA0  NO-BREAK SPACE
  ?\u0102 ; 0xA1  LATIN CAPITAL LETTER A WITH BREVE
  ?\u00C2 ; 0xA2  LATIN CAPITAL LETTER A WITH CIRCUMFLEX ; VISCII-1.1-C2
  ?\u00CA ; 0xA3  LATIN CAPITAL LETTER E WITH CIRCUMFLEX ; VISCII-1.1-CA
  ?\u00D4 ; 0xA4  LATIN CAPITAL LETTER O WITH CIRCUMFLEX ; VISCII-1.1-D4
  ?\u01A0 ; 0xA5  LATIN CAPITAL LETTER O WITH HORN
  ?\u01AF ; 0xA6  LATIN CAPITAL LETTER U WITH HORN
  ?\u0110 ; 0xA7  LATIN CAPITAL LETTER D WITH STROKE
  ?\u0103 ; 0xA8  LATIN SMALL LETTER A WITH BREVE
  ?\u00E2 ; 0xA9  LATIN SMALL LETTER A WITH CIRCUMFLEX ; VISCII-1.1-E2
  ?\u00EA ; 0xAA  LATIN SMALL LETTER E WITH CIRCUMFLEX
  ?\u00F4 ; 0xAB  LATIN SMALL LETTER O WITH CIRCUMFLEX
  ?\u01A1 ; 0xAC  LATIN SMALL LETTER O WITH HORN
  ?\u01B0 ; 0xAD  LATIN SMALL LETTER U WITH HORN
  ?\u0111 ; 0xAE  LATIN SMALL LETTER D WITH STROKE
  ?\u1EB0 ; 0xAF  LATIN CAPITAL LETTER A WITH BREVE AND GRAVE
  ?\u0300 ; 0xB0  COMBINING GRAVE ACCENT
  ?\u0309 ; 0xB1  COMBINING HOOK ABOVE
  ?\u0303 ; 0xB2  COMBINING TILDE
  ?\u0301 ; 0xB3  COMBINING ACUTE ACCENT
  ?\u0323 ; 0xB4  COMBINING DOT BELOW
  ?\u00E0 ; 0xB5  LATIN SMALL LETTER A WITH GRAVE ; VISCII-1.1-E0
  ?\u1EA3 ; 0xB6  LATIN SMALL LETTER A WITH HOOK ABOVE
  ?\u00E3 ; 0xB7  LATIN SMALL LETTER A WITH TILDE ; VISCII-1.1-E3
  ?\u00E1 ; 0xB8  LATIN SMALL LETTER A WITH ACUTE ; VISCII-1.1-E1
  ?\u1EA1 ; 0xB9  LATIN SMALL LETTER A WITH DOT BELOW
  ?\u1EB2 ; 0xBA  LATIN CAPITAL LETTER A WITH BREVE AND HOOK ABOVE
  ?\u1EB1 ; 0xBB  LATIN SMALL LETTER A WITH BREVE AND GRAVE
  ?\u1EB3 ; 0xBC  LATIN SMALL LETTER A WITH BREVE AND HOOK ABOVE
  ?\u1EB5 ; 0xBD  LATIN SMALL LETTER A WITH BREVE AND TILDE
  ?\u1EAF ; 0xBE  LATIN SMALL LETTER A WITH BREVE AND ACUTE
  ?\u1EB4 ; 0xBF  LATIN CAPITAL LETTER A WITH BREVE AND TILDE
  ?\u1EAE ; 0xC0  LATIN CAPITAL LETTER A WITH BREVE AND ACUTE
  ?\u1EA6 ; 0xC1  LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND GRAVE
  ?\u1EA8 ; 0xC2  LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE
  ?\u1EAA ; 0xC3  LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND TILDE
  ?\u1EA4 ; 0xC4  LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND ACUTE
  ?\u1EC0 ; 0xC5  LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND GRAVE
  ?\u1EB7 ; 0xC6  LATIN SMALL LETTER A WITH BREVE AND DOT BELOW
  ?\u1EA7 ; 0xC7  LATIN SMALL LETTER A WITH CIRCUMFLEX AND GRAVE
  ?\u1EA9 ; 0xC8  LATIN SMALL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE
  ?\u1EAB ; 0xC9  LATIN SMALL LETTER A WITH CIRCUMFLEX AND TILDE
  ?\u1EA5 ; 0xCA  LATIN SMALL LETTER A WITH CIRCUMFLEX AND ACUTE
  ?\u1EAD ; 0xCB  LATIN SMALL LETTER A WITH CIRCUMFLEX AND DOT BELOW
  ?\u00E8 ; 0xCC  LATIN SMALL LETTER E WITH GRAVE ; VISCII-1.1-E8
  ?\u1EC2 ; 0xCD  LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE
  ?\u1EBB ; 0xCE  LATIN SMALL LETTER E WITH HOOK ABOVE
  ?\u1EBD ; 0xCF  LATIN SMALL LETTER E WITH TILDE
  ?\u00E9 ; 0xD0  LATIN SMALL LETTER E WITH ACUTE
  ?\u1EB9 ; 0xD1  LATIN SMALL LETTER E WITH DOT BELOW
  ?\u1EC1 ; 0xD2  LATIN SMALL LETTER E WITH CIRCUMFLEX AND GRAVE
  ?\u1EC3 ; 0xD3  LATIN SMALL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE
  ?\u1EC5 ; 0xD4  LATIN SMALL LETTER E WITH CIRCUMFLEX AND TILDE
  ?\u1EBF ; 0xD5  LATIN SMALL LETTER E WITH CIRCUMFLEX AND ACUTE
  ?\u1EC7 ; 0xD6  LATIN SMALL LETTER E WITH CIRCUMFLEX AND DOT BELOW
  ?\u00EC ; 0xD7  LATIN SMALL LETTER I WITH GRAVE
  ?\u1EC9 ; 0xD8  LATIN SMALL LETTER I WITH HOOK ABOVE
  ?\u1EC4 ; 0xD9  LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND TILDE
  ?\u1EBE ; 0xDA  LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND ACUTE
  ?\u1ED2 ; 0xDB  LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND GRAVE
  ?\u0129 ; 0xDC  LATIN SMALL LETTER I WITH TILDE
  ?\u00ED ; 0xDD  LATIN SMALL LETTER I WITH ACUTE
  ?\u1ECB ; 0xDE  LATIN SMALL LETTER I WITH DOT BELOW
  ?\u00F2 ; 0xDF  LATIN SMALL LETTER O WITH GRAVE
  ?\u1ED4 ; 0xE0  LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE
  ?\u1ECF ; 0xE1  LATIN SMALL LETTER O WITH HOOK ABOVE
  ?\u00F5 ; 0xE2  LATIN SMALL LETTER O WITH TILDE
  ?\u00F3 ; 0xE3  LATIN SMALL LETTER O WITH ACUTE
  ?\u1ECD ; 0xE4  LATIN SMALL LETTER O WITH DOT BELOW
  ?\u1ED3 ; 0xE5  LATIN SMALL LETTER O WITH CIRCUMFLEX AND GRAVE
  ?\u1ED5 ; 0xE6  LATIN SMALL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE
  ?\u1ED7 ; 0xE7  LATIN SMALL LETTER O WITH CIRCUMFLEX AND TILDE
  ?\u1ED1 ; 0xE8  LATIN SMALL LETTER O WITH CIRCUMFLEX AND ACUTE
  ?\u1ED9 ; 0xE9  LATIN SMALL LETTER O WITH CIRCUMFLEX AND DOT BELOW
  ?\u1EDD ; 0xEA  LATIN SMALL LETTER O WITH HORN AND GRAVE
  ?\u1EDF ; 0xEB  LATIN SMALL LETTER O WITH HORN AND HOOK ABOVE
  ?\u1EE1 ; 0xEC  LATIN SMALL LETTER O WITH HORN AND TILDE
  ?\u1EDB ; 0xED  LATIN SMALL LETTER O WITH HORN AND ACUTE
  ?\u1EE3 ; 0xEE  LATIN SMALL LETTER O WITH HORN AND DOT BELOW
  ?\u00F9 ; 0xEF  LATIN SMALL LETTER U WITH GRAVE
  ?\u1ED6 ; 0xF0  LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND TILDE
  ?\u1EE7 ; 0xF1  LATIN SMALL LETTER U WITH HOOK ABOVE
  ?\u0169 ; 0xF2  LATIN SMALL LETTER U WITH TILDE
  ?\u00FA ; 0xF3  LATIN SMALL LETTER U WITH ACUTE
  ?\u1EE5 ; 0xF4  LATIN SMALL LETTER U WITH DOT BELOW
  ?\u1EEB ; 0xF5  LATIN SMALL LETTER U WITH HORN AND GRAVE
  ?\u1EED ; 0xF6  LATIN SMALL LETTER U WITH HORN AND HOOK ABOVE
  ?\u1EEF ; 0xF7  LATIN SMALL LETTER U WITH HORN AND TILDE
  ?\u1EE9 ; 0xF8  LATIN SMALL LETTER U WITH HORN AND ACUTE
  ?\u1EF1 ; 0xF9  LATIN SMALL LETTER U WITH HORN AND DOT BELOW
  ?\u1EF3 ; 0xFA  LATIN SMALL LETTER Y WITH GRAVE
  ?\u1EF7 ; 0xFB  LATIN SMALL LETTER Y WITH HOOK ABOVE
  ?\u1EF9 ; 0xFC  LATIN SMALL LETTER Y WITH TILDE
  ?\u00FD ; 0xFD  LATIN SMALL LETTER Y WITH ACUTE
  ?\u1EF5 ; 0xFE  LATIN SMALL LETTER Y WITH DOT BELOW
  ?\u1ED0 ; 0xFF  LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND ACUTE
  ])

;;; ccs-tcvn5712.el ends here
