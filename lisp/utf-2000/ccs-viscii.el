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
