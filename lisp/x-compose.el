;;; x-compose.el --- Compose-key processing in XEmacs

;; Copyright (C) 1992, 1993, 1997 Free Software Foundation, Inc.

;; Author: Jamie Zawinski <jwz@netscape.com>
;; Maintainer: XEmacs Development Team
;; Rewritten by Martin Buchholz far too many times.
;;
;; Changed: 11 Jun 1997 by Heiko Muenkel <muenkel@tnt.uni-hannover.de>
;;	The degree sign couldn't be inserted with the old version.
;; Keywords: i18n

;; This file is part of XEmacs.

;; XEmacs is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; XEmacs is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Synched up with: Not in FSF.

;;; Commentary:

;; created by jwz, 14-jun-92.
;;; changed by Jan Vroonhof, July 1997: Use function-key-map instead
;;;                                     of global map.
;;;                                     Preliminary support for
;;;                                     XFree86 deadkeys

;; This file implements DEC-, OpenWindows-, and HP-compatible "Compose"
;; processing for XEmacs.

;; If you are running a version of X which already does compose processing,
;; then you don't need this file.  But the MIT R4 and R5 distributions don't
;; do compose processing, so you may want to fake it by using this code.

;; The basic idea is that there are several ways to generate keysyms which
;; do not have keys devoted to them on your keyboard.

;; The first method is by using "dead" keys.  A dead key is a key which,
;; when typed, does not insert a character.  Instead it modifies the
;; following character typed.  So if you typed "dead-tilde" followed by "A",
;; then "A-tilde" would be inserted.  Of course, this requires you to modify
;; your keyboard to include a "dead-tilde" key on it somewhere.

;; The second method is by using a "Compose" key.  With a Compose key, you
;; would type "Compose" then "tilde" then "A" to insert "A-tilde".

;; There are a small number of dead keys: acute, grave, cedilla, diaeresis,
;; circumflex, tilde, and ring.  There are a larger number of accented and
;; other characters accessible via the Compose key, so both are useful.

;; To use this code, you will need to have a Compose key on your keyboard.
;; The default configuration of most X keyboards doesn't contain one.  You
;; can, for example, turn the right "Meta" key into a "Compose" key with
;; this command:

;;    xmodmap -e "remove mod1 = Meta_R" -e "keysym Meta_R = Multi_key"

;; Multi-key is the name that X (and emacs) know the "Compose" key by.
;; The "remove..." command is necessary because the "Compose" key must not
;; have any modifier bits associated with it.  This exact command may not
;; work, depending on what system and keyboard you are using.  If it
;; doesn't, you'll have to read the man page for xmodmap.  You might want
;; to get the "xkeycaps" program from
;; <URL:http://people.netscape.com/jwz/xkeycaps/>,
;; which is a graphical front end to xmodmap
;; that hides xmodmap's arcane syntax from you.

;; If for some reason you don't want to have a dedicated compose key on your
;; keyboard, you can use some other key as the prefix.  For example, to make
;; "Meta-Shift-C" act as a compose key (so that "M-C , c" would insert the
;; character "ccedilla") you could do

;;    (global-set-key "\M-C" compose-map)

;; I believe the bindings encoded in this file are the same as those used
;; by OpenWindows versions 2 and 3, and DEC VT320 terminals.  Please let me
;; know if you think otherwise.

;; Much thanks to Justin Bur <justin@crim.ca> for helping me understand how
;; this stuff is supposed to work.

;; You also might want to consider getting Justin's patch for the MIT Xlib
;; that implements compose processing in the library.  This will enable
;; compose processing in applications other than emacs as well.  You can
;; get it from export.lcs.mit.edu in contrib/compose.tar.Z.

;; This code has one feature that a more "builtin" Compose mechanism could
;; not have: at any point you can type C-h to get a list of the possible
;; completions of what you have typed so far.

;;; Code:

(require 'x-iso8859-1)

(defun make-compose-map (map-sym)
  (let ((map (make-sparse-keymap)))
    (set map-sym map)
    (set-keymap-name map map-sym)
    ;; Required to tell XEmacs the keymaps were actually autoloaded.
    ;; #### Make this unnecessary!
    (fset map-sym map)))

(make-compose-map 'compose-map)
(make-compose-map 'compose-acute-map)
(make-compose-map 'compose-grave-map)
(make-compose-map 'compose-cedilla-map)
(make-compose-map 'compose-diaeresis-map)
(make-compose-map 'compose-circumflex-map)
(make-compose-map 'compose-tilde-map)
(make-compose-map 'compose-ring-map)

(unintern 'make-compose-map)

(define-key compose-map 'acute	    compose-acute-map)
(define-key compose-map 'grave	    compose-grave-map)
(define-key compose-map 'cedilla    compose-cedilla-map)
(define-key compose-map 'diaeresis  compose-diaeresis-map)
(define-key compose-map 'circumflex compose-circumflex-map)
(define-key compose-map 'tilde      compose-tilde-map)
(define-key compose-map 'degree	    compose-ring-map)

;;(eval-when-compile
;;  (defsubst define-dead-key-map (key map)
;;    (define-key function-key-map key map)
;;    (define-key compose-map key map)))

;;;###utoload (autoload 'compose-map           "x-compose" nil t 'keymap)
;;;###utoload (autoload 'compose-acute-map     "x-compose" nil t 'keymap)
;;;###utoload (autoload 'compose-grave-map     "x-compose" nil t 'keymap)
;;;###utoload (autoload 'compose-cedilla-map   "x-compose" nil t 'keymap)
;;;###utoload (autoload 'compose-diaeresis-map "x-compose" nil t 'keymap)
;;;###utoload (autoload 'compose-degree-map    "x-compose" nil t 'keymap)
;;;###utoload (define-key function-key-map [acute]     'compose-acute-map)
;;;###utoload (define-key function-key-map [grave]     'compose-grave-map)
;;;###utoload (define-key function-key-map [cedilla]   'compose-cedilla-map)
;;;###utoload (define-key function-key-map [diaeresis] 'compose-diaeresis-map)
;;;###utoload (define-key function-key-map [degree]    'compose-degree-map)
;;;###utoload (define-key function-key-map [multi-key] 'compose-map)
;;;###utoload (define-key global-map       [multi-key] 'compose-map)

;;(define-key function-key-map [multi-key] compose-map)


;; The following is necessary, because one can't rebind [degree]
;; and use it to insert the degree sign!
;;(defun compose-insert-degree ()
;;  "Inserts a degree sign."
;;  (interactive)
;;  (insert ?\260))

;; The "Dead" keys:
;;
;;(define-dead-key-map [acute]	 compose-acute-map)
;;(define-dead-key-map [cedilla]	 compose-cedilla-map)
;;(define-dead-key-map [diaeresis] compose-diaeresis-map)
;;(define-dead-key-map [degree]	 compose-ring-map)

(define-key compose-map [acute]		compose-acute-map)
(define-key compose-map [?']		compose-acute-map)
(define-key compose-map [grave]		compose-grave-map)
(define-key compose-map [?`]		compose-grave-map)
(define-key compose-map [cedilla]	compose-cedilla-map)
(define-key compose-map [?,]		compose-cedilla-map)
(define-key compose-map [diaeresis]	compose-diaeresis-map)
(define-key compose-map [?\"]		compose-diaeresis-map)
(define-key compose-map [circumflex]	compose-circumflex-map)
(define-key compose-map [?^]		compose-circumflex-map)
(define-key compose-map [tilde]		compose-tilde-map)
(define-key compose-map [~]		compose-tilde-map)
(define-key compose-map [degree]	compose-ring-map)
(define-key compose-map [?*]		compose-ring-map)


;;; The dead keys might really be called just about anything, depending
;;; on the vendor.  MIT thinks that the prefixes are "SunFA_", "D", and
;;; "hpmute_" for Sun, DEC, and HP respectively.  However, OpenWindows 3
;;; thinks that the prefixes are "SunXK_FA_", "DXK_", and "hpXK_mute_".
;;; And HP (who don't mention Sun and DEC at all) use "XK_mute_".
;;; Go figure.

;;; Presumably if someone is running OpenWindows, they won't be using
;;; the DEC or HP keysyms, but if they are defined then that is possible,
;;; so in that case we accept them all.

;;; If things seem not to be working, you might want to check your
;;; /usr/lib/X11/XKeysymDB file to see if your vendor has an equally
;;; mixed up view of what these keys should be called.

;; Sun according to MIT:
;;

;;(when (x-valid-keysym-name-p "SunFA_Acute")
;;  (define-dead-key-map [SunFA_Acute]		compose-acute-map)
;;  (define-dead-key-map [SunFA_Grave]		compose-grave-map)
;;  (define-dead-key-map [SunFA_Cedilla]		compose-cedilla-map)
;;  (define-dead-key-map [SunFA_Diaeresis]	compose-diaeresis-map)
;;  (define-dead-key-map [SunFA_Circum]		compose-circumflex-map)
;;  (define-dead-key-map [SunFA_Tilde]		compose-tilde-map)
;;  )
;;
;;;; Sun according to OpenWindows 2:
;;;;
;;(when (x-valid-keysym-name-p "Dead_Grave")
;;  (define-dead-key-map [Dead_Grave]		compose-grave-map)
;;  (define-dead-key-map [Dead_Circum]		compose-circumflex-map)
;;  (define-dead-key-map [Dead_Tilde]		compose-tilde-map)
;;  )
;;
;;;; Sun according to OpenWindows 3:
;;;;
;;(when (x-valid-keysym-name-p "SunXK_FA_Acute")
;;  (define-dead-key-map [SunXK_FA_Acute]		compose-acute-map)
;;  (define-dead-key-map [SunXK_FA_Grave]		compose-grave-map)
;;  (define-dead-key-map [SunXK_FA_Cedilla]	compose-cedilla-map)
;;  (define-dead-key-map [SunXK_FA_Diaeresis]	compose-diaeresis-map)
;;  (define-dead-key-map [SunXK_FA_Circum]	compose-circumflex-map)
;;  (define-dead-key-map [SunXK_FA_Tilde]		compose-tilde-map)
;;  )
;;
;;;; DEC according to MIT:
;;;;
;;(when (x-valid-keysym-name-p "Dacute_accent")
;;  (define-dead-key-map [Dacute_accent]		compose-acute-map)
;;  (define-dead-key-map [Dgrave_accent]		compose-grave-map)
;;  (define-dead-key-map [Dcedilla_accent]	compose-cedilla-map)
;;  (define-dead-key-map [Dcircumflex_accent]	compose-circumflex-map)
;;  (define-dead-key-map [Dtilde]			compose-tilde-map)
;;  (define-dead-key-map [Dring_accent]		compose-ring-map)
;;  )
;;
;;;; DEC according to OpenWindows 3:
;;;;
;;(when (x-valid-keysym-name-p "DXK_acute_accent")
;;  (define-dead-key-map [DXK_acute_accent]	compose-acute-map)
;;  (define-dead-key-map [DXK_grave_accent]	compose-grave-map)
;;  (define-dead-key-map [DXK_cedilla_accent]	compose-cedilla-map)
;;  (define-dead-key-map [DXK_circumflex_accent]	compose-circumflex-map)
;;  (define-dead-key-map [DXK_tilde]		compose-tilde-map)
;;  (define-dead-key-map [DXK_ring_accent]	compose-ring-map)
;;  )
;;
;;;; HP according to MIT:
;;;;
;;(when (x-valid-keysym-name-p "hpmute_acute")
;;  (define-dead-key-map [hpmute_acute]		compose-acute-map)
;;  (define-dead-key-map [hpmute_grave]		compose-grave-map)
;;  (define-dead-key-map [hpmute_diaeresis]	compose-diaeresis-map)
;;  (define-dead-key-map [hpmute_asciicircum]	compose-circumflex-map)
;;  (define-dead-key-map [hpmute_asciitilde]	compose-tilde-map)
;;  )
;;
;;;; HP according to OpenWindows 3:
;;;;
;;(when (x-valid-keysym-name-p "hpXK_mute_acute")
;;  (define-dead-key-map [hpXK_mute_acute]	compose-acute-map)
;;  (define-dead-key-map [hpXK_mute_grave]	compose-grave-map)
;;  (define-dead-key-map [hpXK_mute_diaeresis]	compose-diaeresis-map)
;;  (define-dead-key-map [hpXK_mute_asciicircum]	compose-circumflex-map)
;;  (define-dead-key-map [hpXK_mute_asciitilde]	compose-tilde-map)
;;  )
;;
;;;; HP according to HP-UX 8.0:
;;;;
;;(when (x-valid-keysym-name-p "XK_mute_acute")
;;  (define-dead-key-map [XK_mute_acute]		compose-acute-map)
;;  (define-dead-key-map [XK_mute_grave]		compose-grave-map)
;;  (define-dead-key-map [XK_mute_diaeresis]	compose-diaeresis-map)
;;  (define-dead-key-map [XK_mute_asciicircum]	compose-circumflex-map)
;;  (define-dead-key-map [XK_mute_asciitilde]	compose-tilde-map)
;;  )
;;
;;;; Xfree seems to use lower case and a hyphen
;;(when (x-valid-keysym-name-p "dead-tilde")
;;  (define-dead-key-map [dead-acute]		compose-acute-map)
;;  (define-dead-key-map [dead-grave]		compose-grave-map)
;;  (define-dead-key-map [dead-cedilla]		compose-cedilla-map)
;;  (define-dead-key-map [dead-diaeresis]		compose-diaeresis-map)
;;  (define-dead-key-map [dead-circum]		compose-circumflex-map)
;;  (define-dead-key-map [dead-tilde]		compose-tilde-map)
;;  )



;;; The contents of the "dead key" maps.  These are shared by the
;;; compose-map.

(define-key compose-acute-map [space]	"'")
(define-key compose-acute-map [?']	[acute])
(define-key compose-acute-map [?A]	[Aacute])
(define-key compose-acute-map [E]	[Eacute])
(define-key compose-acute-map [I]	[Iacute])
(define-key compose-acute-map [O]	[Oacute])
(define-key compose-acute-map [U]	[Uacute])
(define-key compose-acute-map [Y]	[Yacute])
(define-key compose-acute-map [a]	[aacute])
(define-key compose-acute-map [e]	[eacute])
(define-key compose-acute-map [i]	[iacute])
(define-key compose-acute-map [o]	[oacute])
(define-key compose-acute-map [u]	[uacute])
(define-key compose-acute-map [y]	[yacute])

(define-key compose-grave-map [space]	"`")
(define-key compose-grave-map [?`]	[grave])
(define-key compose-grave-map [A]	[Agrave])
(define-key compose-grave-map [E]	[Egrave])
(define-key compose-grave-map [I]	[Igrave])
(define-key compose-grave-map [O]	[Ograve])
(define-key compose-grave-map [U]	[Ugrave])
(define-key compose-grave-map [a]	[agrave])
(define-key compose-grave-map [e]	[egrave])
(define-key compose-grave-map [i]	[igrave])
(define-key compose-grave-map [o]	[ograve])
(define-key compose-grave-map [u]	[ugrave])

(define-key compose-cedilla-map [space]	",")
(define-key compose-cedilla-map [?,]	[cedilla])
(define-key compose-cedilla-map [C]	[Ccedilla])
(define-key compose-cedilla-map [c]	[ccedilla])

(define-key compose-diaeresis-map [space] [diaeresis])
(define-key compose-diaeresis-map [?\"]	[diaeresis])
(define-key compose-diaeresis-map [A]	[Adiaeresis])
(define-key compose-diaeresis-map [E]	[Ediaeresis])
(define-key compose-diaeresis-map [I]	[Idiaeresis])
(define-key compose-diaeresis-map [O]	[Odiaeresis])
(define-key compose-diaeresis-map [U]	[Udiaeresis])
(define-key compose-diaeresis-map [a]	[adiaeresis])
(define-key compose-diaeresis-map [e]	[ediaeresis])
(define-key compose-diaeresis-map [i]	[idiaeresis])
(define-key compose-diaeresis-map [o]	[odiaeresis])
(define-key compose-diaeresis-map [u]	[udiaeresis])
(define-key compose-diaeresis-map [y]	[ydiaeresis])

(define-key compose-circumflex-map [space] "^")
(define-key compose-circumflex-map [?/]	"|")
(define-key compose-circumflex-map [?!]	[brokenbar])
(define-key compose-circumflex-map [?-]	[macron])
(define-key compose-circumflex-map [?_]	[macron])
(define-key compose-circumflex-map [?0]	[degree])
(define-key compose-circumflex-map [?1]	[onesuperior])
(define-key compose-circumflex-map [?2]	[twosuperior])
(define-key compose-circumflex-map [?3]	[threesuperior])
(define-key compose-circumflex-map [?.]	[periodcentered])
(define-key compose-circumflex-map [A]	[Acircumflex])
(define-key compose-circumflex-map [E]	[Ecircumflex])
(define-key compose-circumflex-map [I]	[Icircumflex])
(define-key compose-circumflex-map [O]	[Ocircumflex])
(define-key compose-circumflex-map [U]	[Ucircumflex])
(define-key compose-circumflex-map [a]	[acircumflex])
(define-key compose-circumflex-map [e]	[ecircumflex])
(define-key compose-circumflex-map [i]	[icircumflex])
(define-key compose-circumflex-map [o]	[ocircumflex])
(define-key compose-circumflex-map [u]	[ucircumflex])

(define-key compose-tilde-map [space]	"~")
(define-key compose-tilde-map [A]	[Atilde])
(define-key compose-tilde-map [N]	[Ntilde])
(define-key compose-tilde-map [O]	[Otilde])
(define-key compose-tilde-map [a]	[atilde])
(define-key compose-tilde-map [n]	[ntilde])
(define-key compose-tilde-map [o]	[otilde])

(define-key compose-ring-map [space]	[degree])
(define-key compose-ring-map [A]	[Aring])
(define-key compose-ring-map [a]	[aring])


;;; The rest of the compose-map.  These are the composed characters
;;; that are not accessible via "dead" keys.

(define-key compose-map " '"	"'")
(define-key compose-map " ^"	"^")
(define-key compose-map " `"	"`")
(define-key compose-map " ~"	"~")
(define-key compose-map "  "	[nobreakspace])
(define-key compose-map " \""	[diaeresis])
(define-key compose-map " :"	[diaeresis])
(define-key compose-map " *"	[degree])

(define-key compose-map "!!"	[exclamdown])
(define-key compose-map "!^"	[brokenbar])
(define-key compose-map "!S"	[section])
(define-key compose-map "!s"	[section])
(define-key compose-map "!P"	[paragraph])
(define-key compose-map "!p"	[paragraph])

(define-key compose-map "(("	"[")
(define-key compose-map "(-"	"{")

(define-key compose-map "))"	"]")
(define-key compose-map ")-"	"}")

(define-key compose-map "++"	"#")
(define-key compose-map "+-"	[plusminus])

(define-key compose-map "-("	"{")
(define-key compose-map "-)"	"}")
(define-key compose-map "--"	"-")
(define-key compose-map "-L"	[sterling])
(define-key compose-map "-l"	[sterling])
(define-key compose-map "-Y"	[yen])
(define-key compose-map "-y"	[yen])
(define-key compose-map "-,"	[notsign])
(define-key compose-map "-|"	[notsign])
(define-key compose-map "-^"	[macron])
(define-key compose-map "-+"	[plusminus])
(define-key compose-map "-:"	[division])
(define-key compose-map "-D"	[ETH])
(define-key compose-map "-d"	[eth])
(define-key compose-map "-a"    [ordfeminine])

(define-key compose-map ".^"	[periodcentered])

(define-key compose-map "//"	"\\")
(define-key compose-map "/<"	"\\")
(define-key compose-map "/^"	"|")
(define-key compose-map "/C"	[cent])
(define-key compose-map "/c"	[cent])
(define-key compose-map "/U"	[mu])
(define-key compose-map "/u"	[mu])
(define-key compose-map "/O"	[Ooblique])
(define-key compose-map "/o"	[oslash])

(define-key compose-map "0X"	[currency])
(define-key compose-map "0x"	[currency])
(define-key compose-map "0S"	[section])
(define-key compose-map "0s"	[section])
(define-key compose-map "0C"	[copyright])
(define-key compose-map "0c"	[copyright])
(define-key compose-map "0R"	[registered])
(define-key compose-map "0r"	[registered])
(define-key compose-map "0^"	[degree])

(define-key compose-map "1^"	[onesuperior])
(define-key compose-map "14"	[onequarter])
(define-key compose-map "12"	[onehalf])

(define-key compose-map "2^"	[twosuperior])

(define-key compose-map "3^"	[threesuperior])
(define-key compose-map "34"	[threequarters])

(define-key compose-map ":-"	[division])

(define-key compose-map "</"	"\\")
(define-key compose-map "<<"	[guillemotleft])

(define-key compose-map "=L"	[sterling])
(define-key compose-map "=l"	[sterling])
(define-key compose-map "=Y"	[yen])
(define-key compose-map "=y"	[yen])

(define-key compose-map ">>"	[guillemotright])

(define-key compose-map "??"	[questiondown])

(define-key compose-map "AA"	"@")
(define-key compose-map "Aa"	"@")
(define-key compose-map "A_"	[ordfeminine])
(define-key compose-map "A`"	[Agrave])
(define-key compose-map "A'"	[Aacute])
(define-key compose-map "A^"	[Acircumflex])
(define-key compose-map "A~"	[Atilde])
(define-key compose-map "A\""	[Adiaeresis])
(define-key compose-map "A*"	[Aring])
(define-key compose-map "AE"	[AE])

(define-key compose-map "C/"	[cent])
(define-key compose-map "C|"	[cent])
(define-key compose-map "C0"	[copyright])
(define-key compose-map "CO"	[copyright])
(define-key compose-map "Co"	[copyright])
(define-key compose-map "C,"	[Ccedilla])

(define-key compose-map "D-"	[ETH])

(define-key compose-map "E`"	[Egrave])
(define-key compose-map "E'"	[Eacute])
(define-key compose-map "E^"	[Ecircumflex])
(define-key compose-map "E\""	[Ediaeresis])

(define-key compose-map "I`"	[Igrave])
(define-key compose-map "I'"	[Iacute])
(define-key compose-map "I^"	[Icircumflex])
(define-key compose-map "I\""	[Idiaeresis])

(define-key compose-map "L-"	[sterling])
(define-key compose-map "L="	[sterling])

(define-key compose-map "N~"	[Ntilde])

(define-key compose-map "OX"	[currency])
(define-key compose-map "Ox"	[currency])
(define-key compose-map "OS"	[section])
(define-key compose-map "Os"	[section])
(define-key compose-map "OC"	[copyright])
(define-key compose-map "Oc"	[copyright])
(define-key compose-map "OR"	[registered])
(define-key compose-map "Or"	[registered])
(define-key compose-map "O_"	[masculine])
(define-key compose-map "O`"	[Ograve])
(define-key compose-map "O'"	[Oacute])
(define-key compose-map "O^"	[Ocircumflex])
(define-key compose-map "O~"	[Otilde])
(define-key compose-map "O\""	[Odiaeresis])
(define-key compose-map "O/"	[Ooblique])

(define-key compose-map "P!"	[paragraph])

(define-key compose-map "R0"	[registered])
(define-key compose-map "RO"	[registered])
(define-key compose-map "Ro"	[registered])

(define-key compose-map "S!"	[section])
(define-key compose-map "S0"	[section])
(define-key compose-map "SO"	[section])
(define-key compose-map "So"	[section])
(define-key compose-map "SS"	[ssharp])

(define-key compose-map "TH"	[THORN])

(define-key compose-map "U`"	[Ugrave])
(define-key compose-map "U'"	[Uacute])
(define-key compose-map "U^"	[Ucircumflex])
(define-key compose-map "U\""	[Udiaeresis])

(define-key compose-map "X0"	[currency])
(define-key compose-map "XO"	[currency])
(define-key compose-map "Xo"	[currency])

(define-key compose-map "Y-"	[yen])
(define-key compose-map "Y="	[yen])
(define-key compose-map "Y'"	[Yacute])

(define-key compose-map "_A"	[ordfeminine])
(define-key compose-map "_a"	[ordfeminine])
(define-key compose-map "_^"	[macron])
(define-key compose-map "_O"	[masculine])
(define-key compose-map "_o"	[masculine])

(define-key compose-map "aA"	"@")
(define-key compose-map "aa"	"@")
(define-key compose-map "a_"	[ordfeminine])
(define-key compose-map "a-"    [ordfeminine])
(define-key compose-map "a`"	[agrave])
(define-key compose-map "a'"	[aacute])
(define-key compose-map "a^"	[acircumflex])
(define-key compose-map "a~"	[atilde])
(define-key compose-map "a\""	[adiaeresis])
(define-key compose-map "a*"	[aring])
(define-key compose-map "ae"	[ae])

(define-key compose-map "c/"	[cent])
(define-key compose-map "c|"	[cent])
(define-key compose-map "c0"	[copyright])
(define-key compose-map "cO"	[copyright])
(define-key compose-map "co"	[copyright])
(define-key compose-map "c,"	[ccedilla])

(define-key compose-map "d-"	[eth])

(define-key compose-map "e`"	[egrave])
(define-key compose-map "e'"	[eacute])
(define-key compose-map "e^"	[ecircumflex])
(define-key compose-map "e\""	[ediaeresis])

(define-key compose-map "i`"	[igrave])
(define-key compose-map "i'"	[iacute])
(define-key compose-map "i^"	[icircumflex])
(define-key compose-map "i\""	[idiaeresis])
(define-key compose-map "i:"	[idiaeresis])

(define-key compose-map "l-"	[sterling])
(define-key compose-map "l="	[sterling])

(define-key compose-map "n~"	[ntilde])

(define-key compose-map "oX"	[currency])
(define-key compose-map "ox"	[currency])
(define-key compose-map "oC"	[copyright])
(define-key compose-map "oc"	[copyright])
(define-key compose-map "oR"	[registered])
(define-key compose-map "or"	[registered])
(define-key compose-map "oS"	[section])
(define-key compose-map "os"	[section])
(define-key compose-map "o_"	[masculine])
(define-key compose-map "o`"	[ograve])
(define-key compose-map "o'"	[oacute])
(define-key compose-map "o^"	[ocircumflex])
(define-key compose-map "o~"	[otilde])
(define-key compose-map "o\""	[odiaeresis])
(define-key compose-map "o/"	[oslash])

(define-key compose-map "p!"	[paragraph])

(define-key compose-map "r0"	[registered])
(define-key compose-map "rO"	[registered])
(define-key compose-map "ro"	[registered])

(define-key compose-map "s!"	[section])
(define-key compose-map "s0"	[section])
(define-key compose-map "sO"	[section])
(define-key compose-map "so"	[section])
(define-key compose-map "ss"	[ssharp])

(define-key compose-map "th"	[thorn])

(define-key compose-map "u`"	[ugrave])
(define-key compose-map "u'"	[uacute])
(define-key compose-map "u^"	[ucircumflex])
(define-key compose-map "u\""	[udiaeresis])
(define-key compose-map "u/"	[mu])

(define-key compose-map "x0"	[currency])
(define-key compose-map "xO"	[currency])
(define-key compose-map "xo"	[currency])
(define-key compose-map "xx"	[multiply])

(define-key compose-map "y-"	[yen])
(define-key compose-map "y="	[yen])
(define-key compose-map "y'"	[yacute])
(define-key compose-map "y\""	[ydiaeresis])

(define-key compose-map "|C"	[cent])
(define-key compose-map "|c"	[cent])
(define-key compose-map "||"	[brokenbar])


;; Suppose we type these three physical keys: [Multi_key " a]
;; Xlib can deliver these keys as the following sequences of keysyms:
;;
;; - [Multi_key " a] (no surprise here)
;; - [adiaeresis] (OK, Xlib is doing compose processing for us)
;; - [Multi_key " adiaeresis] (Huh?)
;;
;; It is the last possibility that is arguably a bug.  Xlib can't
;; decide whether it's really doing compose processing or not (or
;; actually, different parts of Xlib disagree).
;;
;; So we'll just convert [Multi_key " adiaeresis] to [adiaeresis]
(defun xlib-input-method-bug-workaround (keymap)
  (map-keymap
   (lambda (key value)
     (cond
      ((keymapp value)
       (xlib-input-method-bug-workaround value))
      ((and (sequencep value)
	    (eq 1 (length value))
	    (null (lookup-key keymap value)))
       (define-key keymap value value))))
   keymap))
(xlib-input-method-bug-workaround compose-map)
(unintern 'xlib-input-method-bug-workaround)

;; While we're at it, a similar mechanism will make colon equivalent
;; to doublequote for diaeresis processing.  Some Xlibs do this.
(defun alias-colon-to-doublequote (keymap)
  (map-keymap
   (lambda (key value)
     (when (keymapp value)
       (alias-colon-to-doublequote value))
     (when (eq key '\")
       (define-key keymap ":" value)))
   keymap))
(alias-colon-to-doublequote compose-map)
(unintern 'alias-colon-to-doublequote)

;;; Electric dead keys: making a' mean a-acute.


(defun electric-diacritic (&optional count)
  "Modify the previous character with an accent.
For example, if `:' is bound to this command, then typing `a:'
will first insert `a' and then turn it into `\344' (adiaeresis).
The keys to which this command may be bound (and the accents
which it understands) are:

   '  (acute)       \301\311\315\323\332\335 \341\351\355\363\372\375
   `  (grave)       \300\310\314\322\331 \340\350\354\362\371
   :  (diaeresis)   \304\313\317\326\334 \344\353\357\366\374\377
   ^  (circumflex)  \302\312\316\324\333 \342\352\356\364\373
   ,  (cedilla)     \307\347
   .  (ring)        \305\345"
  (interactive "p")
  (or count (setq count 1))

  (if (not (eq last-command 'self-insert-command))
      ;; Only do the magic if the two chars were typed in succession.
      (self-insert-command count)

    ;; This is so that ``a : C-x u'' will transform `adiaeresis' back into `a:'
    (self-insert-command count)
    (undo-boundary)
    (delete-char (- count))

    (let* ((c last-command-char)
	   (map (cond ((eq c ?') compose-acute-map)
		      ((eq c ?`) compose-grave-map)
		      ((eq c ?,) compose-cedilla-map)
		      ((eq c ?:) compose-diaeresis-map)
		      ((eq c ?^) compose-circumflex-map)
		      ((eq c ?~) compose-tilde-map)
		      ((eq c ?.) compose-ring-map)
		      (t (error "unknown diacritic: %s (%c)" c c))))
	   (base-char (preceding-char))
	   (mod-char (and (>= (downcase base-char) ?a) ; only do alphabetics?
			  (<= (downcase base-char) ?z)
			  (lookup-key map (make-string 1 base-char)))))
      (if (and (vectorp mod-char) (= (length mod-char) 1))
	  (setq mod-char (aref mod-char 0)))
      (if (and mod-char (symbolp mod-char))
	  (setq mod-char (or (get mod-char character-set-property) mod-char)))
      (if (and mod-char (> count 0))
	  (delete-char -1)
	(setq mod-char c))
      (while (> count 0)
	(insert mod-char)
	(setq count (1- count))))))

;; should "::" mean "¨" and ": " mean ":"?
;; should we also do
;;    (?~
;;     (?A "\303")
;;     (?C "\307")
;;     (?D "\320")
;;     (?N "\321")
;;     (?O "\325")
;;     (?a "\343")
;;     (?c "\347")
;;     (?d "\360")
;;     (?n "\361")
;;     (?o "\365")
;;     (?> "\273")
;;     (?< "\253")
;;     (?  "~")) ; no special code
;;    (?\/
;;     (?A "\305") ;; A-with-ring (Norwegian and Danish)
;;     (?E "\306") ;; AE-ligature (Norwegian and Danish)
;;     (?O "\330")
;;     (?a "\345") ;; a-with-ring (Norwegian and Danish)
;;     (?e "\346") ;; ae-ligature (Norwegian and Danish)
;;     (?o "\370")
;;     (?  "/")) ; no special code


;;; Providing help in the middle of a compose sequence.  (Way cool.)

(eval-when-compile
  (defsubst next-composable-event ()
    (let (event)
      (while (progn
	       (setq event (next-command-event))
	       (not (or (key-press-event-p event)
			(button-press-event-p event))))
	(dispatch-event event))
      event)))

(defun compose-help (ignore-prompt)
  (let* ((keys (apply 'vector (nbutlast (append (this-command-keys) nil))))
	 (map (or (lookup-key function-key-map keys)
		  (error "can't find map?  %s %s" keys (this-command-keys))))
	 binding)
    (save-excursion
      (with-output-to-temp-buffer "*Help*"
	(set-buffer "*Help*")
	(erase-buffer)
	(message "Working...")
	(setq ctl-arrow 'compose) ; non-t-non-nil
	(insert "You are typing a compose sequence.  So far you have typed: ")
	(insert (key-description keys))
	(insert "\nCompletions from here are:\n\n")
	(map-keymap 'compose-help-mapper map t)
	(message "? ")))
    (while (keymapp map)
      (setq binding (lookup-key map (vector (next-composable-event))))
      (if (null binding)
	  (message "No such key in keymap. Try again.")
	(setq map binding)))
    binding))

(put 'compose-help 'isearch-command t)	; so that it doesn't terminate isearch

(defun compose-help-mapper (key binding)
  (if (and (symbolp key)
	   (get key character-set-property))
      (setq key (get key character-set-property)))
  (if (eq binding 'compose-help) ; suppress that...
      nil
    (if (keymapp binding)
	(let ((p (point)))
	  (map-keymap 'compose-help-mapper binding t)
	  (goto-char p)
	  (while (not (eobp))
	    (if (characterp key)
		(insert (make-string 1 key))
	      (insert (single-key-description key)))
	    (insert " ")
	    (forward-line 1)))
      (if (characterp key)
	  (insert (make-string 1 key))
	(insert (single-key-description key)))
      (indent-to 16)
      (let ((code (and (vectorp binding)
		       (= 1 (length binding))
		       (get (aref binding 0) character-set-property))))
	(if code
	    (insert (make-string 1 code))
	  (if (stringp binding)
	      (insert binding)
	    (insert (prin1-to-string binding)))))
      (when (and (vectorp binding) (= 1 (length binding)))
	(indent-to 32)
	(insert (symbol-name (aref binding 0)))))
    (insert "\n")))

;; define it at top-level in the compose map...
;;(define-key compose-map [(control h)] 'compose-help)
;;(define-key compose-map [help]        'compose-help)
;; and then define it in each sub-map of the compose map.
(map-keymap
 (lambda (key binding)
   (when (keymapp binding)
;;     (define-key binding [(control h)] 'compose-help)
;;     (define-key binding [help]        'compose-help)
     ))
 compose-map nil)

;; Make redisplay display the accented letters
(if (memq (default-value 'ctl-arrow) '(t nil))
    (setq-default ctl-arrow 'iso-8859/1))


(provide 'x-compose)

;;; x-compose.el ends here
