;;; ccs-viscii.el --- Mapping table for VISCII 1.1.

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
 'latin-viscii
 [?\u0000	; 0x00
  ?\u0001	; 0x01
  ?\u1EB2	; 0x02 (.2ŽÆ)
  ?\u0003	; 0x03
  ?\u0004	; 0x04
  ?\u1EB4	; 0x05 (ŽÇ)
  ?\u1EAA	; 0x06 (Žç)
  ?\u0007	; 0x07
  ?\u0008	; 0x08
  ?\u0009	; 0x09
  ?\u000A	; 0x0A
  ?\u000B	; 0x0B
  ?\u000C	; 0x0C
  ?\u000D	; 0x0D
  ?\u000E	; 0x0E
  ?\u000F	; 0x0F
  ?\u0010	; 0x10
  ?\u0011	; 0x11
  ?\u0012	; 0x12
  ?\u0013	; 0x13
  ?\u1EF6	; 0x14 (ŽÖ)
  ?\u0015	; 0x15
  ?\u0016	; 0x16
  ?\u0017	; 0x17
  ?\u0018	; 0x18
  ?\u1EF8	; 0x19 (ŽÛ)
  ?\u001A	; 0x1A
  ?\u001B	; 0x1B
  ?\u001C	; 0x1C
  ?\u001D	; 0x1D
  ?\u1EF4	; 0x1E (ŽÜ)
  ?\u001F	; 0x1F
  ?\u0020	; 0x20 ( )
  ?\u0021	; 0x21 (!)
  ?\u0022	; 0x22 (")
  ?\u0023	; 0x23 (#)
  ?\u0024	; 0x24 ($)
  ?\u0025	; 0x25 (%)
  ?\u0026	; 0x26 (&)
  ?\u0027	; 0x27 (')
  ?\u0028	; 0x28 (()
  ?\u0029	; 0x29 ())
  ?\u002A	; 0x2A (*)
  ?\u002B	; 0x2B (+)
  ?\u002C	; 0x2C (,)
  ?\u002D	; 0x2D (-)
  ?\u002E	; 0x2E (.)
  ?\u002F	; 0x2F (/)
  ?\u0030	; 0x30 (0)
  ?\u0031	; 0x31 (1)
  ?\u0032	; 0x32 (2)
  ?\u0033	; 0x33 (3)
  ?\u0034	; 0x34 (4)
  ?\u0035	; 0x35 (5)
  ?\u0036	; 0x36 (6)
  ?\u0037	; 0x37 (7)
  ?\u0038	; 0x38 (8)
  ?\u0039	; 0x39 (9)
  ?\u003A	; 0x3A (:)
  ?\u003B	; 0x3B (;)
  ?\u003C	; 0x3C (<)
  ?\u003D	; 0x3D (=)
  ?\u003E	; 0x3E (>)
  ?\u003F	; 0x3F (?)
  ?\u0040	; 0x40 (@)
  ?\u0041	; 0x41 (A)
  ?\u0042	; 0x42 (B)
  ?\u0043	; 0x43 (C)
  ?\u0044	; 0x44 (D)
  ?\u0045	; 0x45 (E)
  ?\u0046	; 0x46 (F)
  ?\u0047	; 0x47 (G)
  ?\u0048	; 0x48 (H)
  ?\u0049	; 0x49 (I)
  ?\u004A	; 0x4A (J)
  ?\u004B	; 0x4B (K)
  ?\u004C	; 0x4C (L)
  ?\u004D	; 0x4D (M)
  ?\u004E	; 0x4E (N)
  ?\u004F	; 0x4F (O)
  ?\u0050	; 0x50 (P)
  ?\u0051	; 0x51 (Q)
  ?\u0052	; 0x52 (R)
  ?\u0053	; 0x53 (S)
  ?\u0054	; 0x54 (T)
  ?\u0055	; 0x55 (U)
  ?\u0056	; 0x56 (V)
  ?\u0057	; 0x57 (W)
  ?\u0058	; 0x58 (X)
  ?\u0059	; 0x59 (Y)
  ?\u005A	; 0x5A (Z)
  ?\u005B	; 0x5B ([)
  ?\u005C	; 0x5C (\)
  ?\u005D	; 0x5D (])
  ?\u005E	; 0x5E (^)
  ?\u005F	; 0x5F (_)
  ?\u0060	; 0x60 (`)
  ?\u0061	; 0x61 (a)
  ?\u0062	; 0x62 (b)
  ?\u0063	; 0x63 (c)
  ?\u0064	; 0x64 (d)
  ?\u0065	; 0x65 (e)
  ?\u0066	; 0x66 (f)
  ?\u0067	; 0x67 (g)
  ?\u0068	; 0x68 (h)
  ?\u0069	; 0x69 (i)
  ?\u006A	; 0x6A (j)
  ?\u006B	; 0x6B (k)
  ?\u006C	; 0x6C (l)
  ?\u006D	; 0x6D (m)
  ?\u006E	; 0x6E (n)
  ?\u006F	; 0x6F (o)
  ?\u0070	; 0x70 (p)
  ?\u0071	; 0x71 (q)
  ?\u0072	; 0x72 (r)
  ?\u0073	; 0x73 (s)
  ?\u0074	; 0x74 (t)
  ?\u0075	; 0x75 (u)
  ?\u0076	; 0x76 (v)
  ?\u0077	; 0x77 (w)
  ?\u0078	; 0x78 (x)
  ?\u0079	; 0x79 (y)
  ?\u007A	; 0x7A (z)
  ?\u007B	; 0x7B ({)
  ?\u007C	; 0x7C (|)
  ?\u007D	; 0x7D (})
  ?\u007E	; 0x7E (~)
  ?\u007F	; 0x7F
  ?\u1EA0	; 0x80 (ŽÕ)
  ?\u1EAE	; 0x81 (Ž¡)
  ?\u1EB0	; 0x82 (Ž¢)
  ?\u1EB6	; 0x83 (Ž£)
  ?\u1EA4	; 0x84 (Ž¤)
  ?\u1EA6	; 0x85 (Ž¥)
  ?\u1EA8	; 0x86 (Ž¦)
  ?\u1EAC	; 0x87 (Ž§)
  ?\u1EBC	; 0x88 (Ž¨)
  ?\u1EB8	; 0x89 (Ž©)
  ?\u1EBE	; 0x8A (Žª)
  ?\u1EC0	; 0x8B (Ž«)
  ?\u1EC2	; 0x8C (Ž¬)
  ?\u1EC4	; 0x8D (Ž­)
  ?\u1EC6	; 0x8E (Ž®)
  ?\u1ED0	; 0x8F (Ž¯)
  ?\u1ED2	; 0x90 (Ž°)
  ?\u1ED4	; 0x91 (Ž±)
  ?\u1ED6	; 0x92 (Ž²)
  ?\u1ED8	; 0x93 (Žµ)
  ?\u1EE2	; 0x94 (Žþ)
  ?\u1EDA	; 0x95 (Ž¾)
  ?\u1EDC	; 0x96 (Ž¶)
  ?\u1EDE	; 0x97 (Ž·)
  ?\u1ECA	; 0x98 (Ž¸)
  ?\u1ECE	; 0x99 (Žö)
  ?\u1ECC	; 0x9A (Ž÷)
  ?\u1EC8	; 0x9B (Žï)
  ?\u1EE6	; 0x9C (Žü)
  ?\u0168	; 0x9D (Žû)
  ?\u1EE4	; 0x9E (Žø)
  ?\u1EF2	; 0x9F (ŽÏ)
  ?\u00D5	; 0xA0 (Žõ)
  ?\u1EAF	; 0xA1 (.1Ž¡)
  ?\u1EB1	; 0xA2 (Ž¢)
  ?\u1EB7	; 0xA3 (Ž£)
  ?\u1EA5	; 0xA4 (Ž¤)
  ?\u1EA7	; 0xA5 (Ž¥)
  ?\u1EA9	; 0xA6 (Ž¦)
  ?\u1EAD	; 0xA7 (Ž§)
  ?\u1EBD	; 0xA8 (Ž¨)
  ?\u1EB9	; 0xA9 (Ž©)
  ?\u1EBF	; 0xAA (Žª)
  ?\u1EC1	; 0xAB (Ž«)
  ?\u1EC3	; 0xAC (Ž¬)
  ?\u1EC5	; 0xAD (Ž­)
  ?\u1EC7	; 0xAE (Ž®)
  ?\u1ED1	; 0xAF (Ž¯)
  ?\u1ED3	; 0xB0 (Ž°)
  ?\u1ED5	; 0xB1 (Ž±)
  ?\u1ED7	; 0xB2 (Ž²)
  ?\u1EE0	; 0xB3 (.2ŽÞ)
  ?\u01A0	; 0xB4 (Ž½)
  ?\u1ED9	; 0xB5 (.1Žµ)
  ?\u1EDD	; 0xB6 (Ž¶)
  ?\u1EDF	; 0xB7 (Ž·)
  ?\u1ECB	; 0xB8 (Ž¸)
  ?\u1EF0	; 0xB9 (.2Žñ)
  ?\u1EE8	; 0xBA (ŽÑ)
  ?\u1EEA	; 0xBB (Ž×)
  ?\u1EEC	; 0xBC (ŽØ)
  ?\u01A1	; 0xBD (.1Ž½)
  ?\u1EDB	; 0xBE (Ž¾)
  ?\u01AF	; 0xBF (.2Žß)
  ?\u00C0	; 0xC0 (Žà)
  ?\u00C1	; 0xC1 (Žá)
  ?\u00C2	; 0xC2 (Žâ)
  ?\u00C3	; 0xC3 (Žã)
  ?\u1EA2	; 0xC4 (Žä)
  ?\u0102	; 0xC5 (Žå)
  ?\u1EB3	; 0xC6 (.1ŽÆ)
  ?\u1EB5	; 0xC7 (ŽÇ)
  ?\u00C8	; 0xC8 (.2Žè)
  ?\u00C9	; 0xC9 (Žé)
  ?\u00CA	; 0xCA (Žê)
  ?\u1EBA	; 0xCB (Žë)
  ?\u00CC	; 0xCC (Žì)
  ?\u00CD	; 0xCD (Ží)
  ?\u0128	; 0xCE (Žî)
  ?\u1EF3	; 0xCF (.1ŽÏ)
  ?\u0110	; 0xD0 (.2Žð)
  ?\u1EE9	; 0xD1 (.1ŽÑ)
  ?\u00D2	; 0xD2 (.2Žò)
  ?\u00D3	; 0xD3 (Žó)
  ?\u00D4	; 0xD4 (Žô)
  ?\u1EA1	; 0xD5 (.1ŽÕ)
  ?\u1EF7	; 0xD6 (ŽÖ)
  ?\u1EEB	; 0xD7 (Ž×)
  ?\u1EED	; 0xD8 (ŽØ)
  ?\u00D9	; 0xD9 (.2Žù)
  ?\u00DA	; 0xDA (Žú)
  ?\u1EF9	; 0xDB (.1ŽÛ)
  ?\u1EF5	; 0xDC (ŽÜ)
  ?\u00DD	; 0xDD (.2Žý)
  ?\u1EE1	; 0xDE (.1ŽÞ)
  ?\u01B0	; 0xDF (Žß)
  ?\u00E0	; 0xE0 (Žà)
  ?\u00E1	; 0xE1 (Žá)
  ?\u00E2	; 0xE2 (Žâ)
  ?\u00E3	; 0xE3 (Žã)
  ?\u1EA3	; 0xE4 (Žä)
  ?\u0103	; 0xE5 (Žå)
  ?\u1EEF	; 0xE6 (Žæ)
  ?\u1EAB	; 0xE7 (Žç)
  ?\u00E8	; 0xE8 (Žè)
  ?\u00E9	; 0xE9 (Žé)
  ?\u00EA	; 0xEA (Žê)
  ?\u1EBB	; 0xEB (Žë)
  ?\u00EC	; 0xEC (Žì)
  ?\u00ED	; 0xED (Ží)
  ?\u0129	; 0xEE (Žî)
  ?\u1EC9	; 0xEF (Žï)
  ?\u0111	; 0xF0 (Žð)
  ?\u1EF1	; 0xF1 (Žñ)
  ?\u00F2	; 0xF2 (Žò)
  ?\u00F3	; 0xF3 (Žó)
  ?\u00F4	; 0xF4 (Žô)
  ?\u00F5	; 0xF5 (Žõ)
  ?\u1ECF	; 0xF6 (Žö)
  ?\u1ECD	; 0xF7 (Ž÷)
  ?\u1EE5	; 0xF8 (Žø)
  ?\u00F9	; 0xF9 (Žù)
  ?\u00FA	; 0xFA (Žú)
  ?\u0169	; 0xFB (Žû)
  ?\u1EE7	; 0xFC (Žü)
  ?\u00FD	; 0xFD (Žý)
  ?\u1EE3	; 0xFE (Žþ)
  ?\u1EEE	; 0xFF (.2Žæ)
  ])

(set-charset-mapping-table
 'latin-viscii-lower
 [nil		; 0x20
  ?\u1eaf	; 0x21
  ?\u1eb1	; 0x22
  ?\u1eb7	; 0x23
  ?\u1ea5	; 0x24
  ?\u1ea7	; 0x25
  ?\u1ea9	; 0x26
  ?\u1ead	; 0x27
  ?\u1ebd	; 0x28
  ?\u1eb9	; 0x29
  ?\u1ebf	; 0x2a
  ?\u1ec1	; 0x2b
  ?\u1ec3	; 0x2c
  ?\u1ec5	; 0x2d
  ?\u1ec7	; 0x2e
  ?\u1ed1	; 0x2f
  ?\u1ed3	; 0x30
  ?\u1ed5	; 0x31
  ?\u1ed7	; 0x32
  nil		; 0x33
  nil		; 0x34
  ?\u1ed9	; 0x35
  ?\u1edd	; 0x36
  ?\u1edf	; 0x37
  ?\u1ecb	; 0x38
  nil		; 0x39
  nil		; 0x3A
  nil		; 0x3B
  nil		; 0x3C
  ?\u01a1	; 0x3d
  ?\u1edb	; 0x3e
  nil		; 0x3F
  nil		; 0x40
  nil		; 0x41
  nil		; 0x42
  nil		; 0x43
  nil		; 0x44
  nil		; 0x45
  ?\u1eb3	; 0x46
  ?\u1eb5	; 0x47
  nil		; 0x48
  nil		; 0x49
  nil		; 0x4A
  nil		; 0x4B
  nil		; 0x4C
  nil		; 0x4D
  nil		; 0x4E
  ?\u1ef3	; 0x4f
  nil		; 0x50
  ?\u1ee9	; 0x51
  nil		; 0x52
  nil		; 0x53
  nil		; 0x54
  ?\u1ea1	; 0x55
  ?\u1ef7	; 0x56
  ?\u1eeb	; 0x57
  ?\u1eed	; 0x58
  nil		; 0x59
  nil		; 0x5A
  ?\u1ef9	; 0x5b
  ?\u1ef5	; 0x5c
  nil		; 0x5D
  ?\u1ee1	; 0x5e
  ?\u01b0	; 0x5f
  ?\u00e0	; 0x60
  ?\u00e1	; 0x61
  ?\u00e2	; 0x62
  ?\u00e3	; 0x63
  ?\u1ea3	; 0x64
  ?\u0103	; 0x65
  ?\u1eef	; 0x66
  ?\u1eab	; 0x67
  ?\u00e8	; 0x68
  ?\u00e9	; 0x69
  ?\u00ea	; 0x6a
  ?\u1ebb	; 0x6b
  ?\u00ec	; 0x6c
  ?\u00ed	; 0x6d
  ?\u0129	; 0x6e
  ?\u1ec9	; 0x6f
  ?\u0111	; 0x70
  ?\u1ef1	; 0x71
  ?\u00f2	; 0x72
  ?\u00f3	; 0x73
  ?\u00f4	; 0x74
  ?\u00f5	; 0x75
  ?\u1ecf	; 0x76
  ?\u1ecd	; 0x77
  ?\u1ee5	; 0x78
  ?\u00f9	; 0x79
  ?\u00fa	; 0x7a
  ?\u0169	; 0x7b
  ?\u1ee7	; 0x7c
  ?\u00fd	; 0x7d
  ?\u1ee3	; 0x7e
  nil		; 0x7F
  ])

(set-charset-mapping-table
 'latin-viscii-upper
 [nil		; 0x20
  ?\u1eae	; 0x21
  ?\u1eb0	; 0x22
  ?\u1eb6	; 0x23
  ?\u1ea4	; 0x24
  ?\u1ea6	; 0x25
  ?\u1ea8	; 0x26
  ?\u1eac	; 0x27
  ?\u1ebc	; 0x28
  ?\u1eb8	; 0x29
  ?\u1ebe	; 0x2a
  ?\u1ec0	; 0x2b
  ?\u1ec2	; 0x2c
  ?\u1ec4	; 0x2d
  ?\u1ec6	; 0x2e
  ?\u1ed0	; 0x2f
  ?\u1ed2	; 0x30
  ?\u1ed4	; 0x31
  ?\u1ed6	; 0x32
  nil		; 0x33
  nil		; 0x34
  ?\u1ed8	; 0x35
  ?\u1edc	; 0x36
  ?\u1ede	; 0x37
  ?\u1eca	; 0x38
  nil		; 0x39
  nil		; 0x3a
  nil		; 0x3b
  nil		; 0x3c
  ?\u01a0	; 0x3d
  ?\u1eda	; 0x3e
  nil		; 0x3f
  nil		; 0x40
  nil		; 0x41
  nil		; 0x42
  nil		; 0x43
  nil		; 0x44
  nil		; 0x45
  ?\u1eb2	; 0x46
  ?\u1eb4	; 0x47
  nil		; 0x48
  nil		; 0x49
  nil		; 0x4a
  nil		; 0x4b
  nil		; 0x4c
  nil		; 0x4d
  nil		; 0x4e
  ?\u1ef2	; 0x4f
  nil		; 0x50
  ?\u1ee8	; 0x51
  nil		; 0x52
  nil		; 0x53
  nil		; 0x54
  ?\u1ea0	; 0x55
  ?\u1ef6	; 0x56
  ?\u1eea	; 0x57
  ?\u1eec	; 0x58
  nil		; 0x59
  nil		; 0x5a
  ?\u1ef8	; 0x5b
  ?\u1ef4	; 0x5c
  nil		; 0x5d
  ?\u1ee0	; 0x5e
  ?\u01af	; 0x5f
  ?\u00c0	; 0x60
  ?\u00c1	; 0x61
  ?\u00c2	; 0x62
  ?\u00c3	; 0x63
  ?\u1ea2	; 0x64
  ?\u0102	; 0x65
  ?\u1eee	; 0x66
  ?\u1eaa	; 0x67
  ?\u00c8	; 0x68
  ?\u00c9	; 0x69
  ?\u00ca	; 0x6a
  ?\u1eba	; 0x6b
  ?\u00cc	; 0x6c
  ?\u00cd	; 0x6d
  ?\u0128	; 0x6e
  ?\u1ec8	; 0x6f
  ?\u0110	; 0x70
  ?\u1ef0	; 0x71
  ?\u00d2	; 0x72
  ?\u00d3	; 0x73
  ?\u00d4	; 0x74
  ?\u00d5	; 0x75
  ?\u1ece	; 0x76
  ?\u1ecc	; 0x77
  ?\u1ee4	; 0x78
  ?\u00d9	; 0x79
  ?\u00da	; 0x7a
  ?\u0168	; 0x7b
  ?\u1ee6	; 0x7c
  ?\u00dd	; 0x7d
  ?\u1ee2	; 0x7e
  nil		; 0x7f
  ])

;;; ccs-viscii.el ends here
