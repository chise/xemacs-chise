
(setq preloaded-file-list
      (assemble-list
        "backquote" 		; needed for defsubst etc.
	"bytecomp-runtime"	; define defsubst
	"find-paths"
	"packages"		; Bootstrap run-time lisp environment
	"setup-paths"
	"dump-paths"
	"subr" 			; load the most basic Lisp functions
	"replace" 		; match-string used in version.el.
	; Ignore compiled-by-mistake version.elc
	"version.el"
	"cl"
	"cl-extra"
	"cl-seq"
	"widget"
	"custom"		; Before the world so everything can be
				; customized
	"cus-start"		; for customization of builtin variables
	"cmdloop"
	"keymap"
	"syntax"
	"device"
	"console"
	"obsolete"
	"specifier"
	"faces"			; must be loaded before any make-face call
;;(pureload "facemenu") #### not yet ported
	"glyphs"
	"objects"
	"extents"
	"events"
	"text-props"
	"process" ;; This is bad. network-streams may not be defined.
	(when-feature multicast "multicast") ; #+network-streams implicitly true
	"frame"			; move up here cause some stuff needs it here
	"map-ynp"
	"simple"
	"keydefs"		; Before loaddefs so that keymap vars exist.
	"abbrev"
	"derived"
	"minibuf"
	"list-mode"
	"modeline"		; needs simple.el to be loaded first
;; If SparcWorks support is included some additional packages are
;; dumped which would normally have autoloads.  To avoid
;; duplicate doc string warnings, SparcWorks uses a separate
;; autoloads file with the dumped packages removed.
;; After fixing, eos/loaddefs-eos and loaddefs appear identical?!!
;; So just make loaddefs-eos go away...
;;(pureload (if (featurep 'sparcworks) "eos/loaddefs-eos" "loaddefs"))
	"cus-file"
	"startup"		; For initialization of
				;  `emacs-user-extension-dir'
	"misc"
	;; (pureload "profile")
	(unless-feature mule "help-nomule")
	"help"
	;; (pureload "hyper-apropos")  Soon...
	(unless-feature file-coding "files-nomule")
	"files"
	"lib-complete"
	"format"
	"indent"
	"isearch-mode"
	"buffer"
	"buff-menu"
	"undo-stack"
	"window"
	"window-xemacs"
	"paths.el"		; don't get confused if paths compiled.
	"lisp"
	"page"
	"register"
	"iso8859-1"		; This must be before any modes
					; (sets standard syntax table.)
	"paragraphs"
	"easymenu"		; Added for 20.3.
	"lisp-mode"
	"text-mode"
	"fill"
	"auto-save"		; Added for 20.4
	"movemail"              ; Added for 21.2
	(when-feature windows-nt "win32-native")
	(when-feature lisp-float-type "float-sup")
	"itimer"		; for vars auto-save-timeout and
				; auto-gc-threshold
	"itimer-autosave"
	"printer"

	;;;;;;;;;;;;;;;;;; GUI support
	(when-feature window-system "gui")
	(when-feature window-system "mouse")
	(when-feature window-system "mode-motion")
	(when-feature toolbar "toolbar")
	(when-feature scrollbar "scrollbar")
	(when-feature menubar "menubar")
	(when-feature dialog "dialog")
	(when-feature gutter "gutter")
	(when-feature dragdrop-api "dragdrop")
	"select"

	;;;;;;;;;;;;;;;;;; Content for GUI's
	;; There used to be window-system inserted in the when-feature,
	;; but IMHO your configure script should turn off the menubar,
	;; toolbar, etc. features when there is no window system.  We
	;; should just be able to assume that, if (featurep 'menubar),
	;; the menubar should work and if items are added, they can be
	;; seen clearly and usefully.
	(when-feature (and (not infodock) menubar) "menubar-items")
	(when-feature (and gutter) "gutter-items")
	(when-feature (and (not infodock) toolbar) "toolbar-items")
	(when-feature (and (not infodock) dialog) "dialog-items")

	;;;;;;;;;;;;;;;;;; Coding-system support
	(when-feature file-coding "coding")
	(when-feature file-coding "code-files")
	;; Handle process with encoding/decoding coding-system.
	(when-feature file-coding "code-process")
	;; Provide basic commands to set coding systems to user
	(when-feature file-coding "code-cmds")
	;;;;;;;;;;;;;;;;;; MULE support
	(when-feature mule "mule-conf")
	(when-feature utf-2000 "isolated-char")
	(when-feature utf-2000 "u00000-C0")
	(when-feature utf-2000 "u00020-Basic-Latin")
	(when-feature utf-2000 "u00080-C1")
	(when-feature utf-2000 "u000A0-Latin-1-Supplement")
	(when-feature utf-2000 "u00100-Latin-Extended-A")
	(when-feature utf-2000 "u00180-Latin-Extended-B")
	(when-feature utf-2000 "u00250-IPA-Extensions")
	(when-feature utf-2000 "u002B0-Spacing-Modifier-Letters")
	(when-feature utf-2000 "u00300-Combining-Diacritical-Marks")
	(when-feature utf-2000 "u00370-Greek")
	(when-feature utf-2000 "u00400-Cyrillic")
	(when-feature utf-2000 "u00530-Armenian")
	(when-feature utf-2000 "u00590-Hebrew")
	(when-feature utf-2000 "u00600-Arabic")
	(when-feature utf-2000 "u00700-Syriac")
	(when-feature utf-2000 "u00780-Thaana")
	(when-feature utf-2000 "u00900-Devanagari")
	(when-feature utf-2000 "u00980-Bengali")
	(when-feature utf-2000 "u00A00-Gurmukhi")
	(when-feature utf-2000 "u00A80-Gujarati")
	(when-feature utf-2000 "u00B00-Oriya")
	(when-feature utf-2000 "u00B80-Tamil")
	(when-feature utf-2000 "u00C00-Telugu")
	(when-feature utf-2000 "u00C80-Kannada")
	(when-feature utf-2000 "u00D00-Malayalam")
	(when-feature utf-2000 "u00D80-Sinhala")
	(when-feature utf-2000 "u00E00-Thai")
	(when-feature utf-2000 "u00E80-Lao")
	(when-feature utf-2000 "u00F00-Tibetan")
	(when-feature utf-2000 "u01000-Myanmar")
	(when-feature utf-2000 "u010A0-Georgian")
	(when-feature utf-2000 "u01100-Hangul-Jamo")
	(when-feature utf-2000 "u01200-Ethiopic")
	(when-feature utf-2000 "u013A0-Cherokee")
	(when-feature utf-2000 "u01400-Canadian")
	(when-feature utf-2000 "u01680-Ogham")
	(when-feature utf-2000 "u016A0-Runic")
	(when-feature utf-2000 "u01780-Khmer")
	(when-feature utf-2000 "u01800-Mongolian")
	(when-feature utf-2000 "u01E00-Latin-Extended-Additional")
	(when-feature utf-2000 "u01F00-Greek-Extended")
	(when-feature utf-2000 "u02000-General-Punctuation")
	(when-feature utf-2000 "u02070-Superscripts")
	(when-feature utf-2000 "u02080-Subscripts")
	(when-feature utf-2000 "u020A0-Currency-Symbols")
	(when-feature utf-2000
		      "u020D0-Combining-Diacritical-Marks-for-Symbols")
	(when-feature utf-2000 "u02100-Letterlike-Symbols")
	(when-feature utf-2000 "u02150-Number-Forms")
	(when-feature utf-2000 "u02190-Arrows")
	(when-feature utf-2000 "u02200-Mathematical-Operators")
	(when-feature utf-2000 "u02300-Miscellaneous-Technical")
	(when-feature utf-2000 "u02400-Control-Pictures")
	(when-feature utf-2000 "u02440-OCR")
	(when-feature utf-2000 "u02460-Enclosed-Alphanumerics")
	(when-feature utf-2000 "u02500-Box-Drawing")
	(when-feature utf-2000 "u02580-Block-Elements")
	(when-feature utf-2000 "u025A0-Geometric-Shapes")
	(when-feature utf-2000 "u02600-Miscellaneous-Symbols")
	(when-feature utf-2000 "u02700-Dingbats")
	(when-feature utf-2000 "u02800-Braille-Patterns")
	(when-feature utf-2000 "u02E00-CJK-Radical-Supplement")
	(when-feature utf-2000 "u02F00-Kangxi-Radicals")
	(when-feature utf-2000 "u02FF0-Ideographic-Description-Characters")
	(when-feature utf-2000 "u03000-CJK-Symbols-and-Punctuation")
	(when-feature utf-2000 "u03040-Hiragana")
	(when-feature utf-2000 "u030A0-Katakana")
	(when-feature utf-2000 "u03100-Bopomofo")
	(when-feature utf-2000 "u03130-Hangul-Compatibility-Jamo")
	(when-feature utf-2000 "u03190-Kanbun")
	(when-feature utf-2000 "u031A0-Extended-Bopomofo")
	(when-feature utf-2000 "u03200-Enclosed-CJK-Letters-and-Months")
	(when-feature utf-2000 "u03300-CJK-Compatibility")
	(when-feature utf-2000 "Ideograph-R001-One")
	(when-feature utf-2000 "Ideograph-R002-Line")
	(when-feature utf-2000 "Ideograph-R003-Dot")
	(when-feature utf-2000 "Ideograph-R004-Slash")
	(when-feature utf-2000 "Ideograph-R005-Second")
	(when-feature utf-2000 "Ideograph-R006-Hook")
	(when-feature utf-2000 "Ideograph-R007-Two")
	(when-feature utf-2000 "Ideograph-R008-Lid")
	(when-feature utf-2000 "Ideograph-R009-Man")
	(when-feature utf-2000 "Ideograph-R010-Legs")
	(when-feature utf-2000 "Ideograph-R011-Enter")
	(when-feature utf-2000 "Ideograph-R012-Eight")
	(when-feature utf-2000 "Ideograph-R013-Down-Box")
	(when-feature utf-2000 "Ideograph-R014-Cover")
	(when-feature utf-2000 "Ideograph-R015-Ice")
	(when-feature utf-2000 "Ideograph-R016-Table")
	(when-feature utf-2000 "Ideograph-R017-Open-Box")
	(when-feature utf-2000 "Ideograph-R018-Knife")
	(when-feature utf-2000 "Ideograph-R019-Power")
	(when-feature utf-2000 "Ideograph-R020-Wrap")
	(when-feature utf-2000 "Ideograph-R021-Spoon")
	(when-feature utf-2000 "Ideograph-R022-Right-Open-Box")
	(when-feature utf-2000 "Ideograph-R023-Hiding-Enclosure")
	(when-feature utf-2000 "Ideograph-R024-Ten")
	(when-feature utf-2000 "Ideograph-R025-Divination")
	(when-feature utf-2000 "Ideograph-R026-Seal")
	(when-feature utf-2000 "Ideograph-R027-Cliff")
	(when-feature utf-2000 "Ideograph-R028-Private")
	(when-feature utf-2000 "Ideograph-R029-Again")
	(when-feature utf-2000 "Ideograph-R030-Mouth")
	(when-feature utf-2000 "Ideograph-R031-Enclosure")
	(when-feature utf-2000 "Ideograph-R032-Earth")
	(when-feature utf-2000 "Ideograph-R033-Scholar")
	(when-feature utf-2000 "Ideograph-R034-Go")
	(when-feature utf-2000 "Ideograph-R035-Go-Slowly")
	(when-feature utf-2000 "Ideograph-R036-Evening")
	(when-feature utf-2000 "Ideograph-R037-Big")
	(when-feature utf-2000 "Ideograph-R038-Woman")
	(when-feature utf-2000 "Ideograph-R039-Child")
	(when-feature utf-2000 "Ideograph-R040-Roof")
	(when-feature utf-2000 "Ideograph-R041-Inch")
	(when-feature utf-2000 "Ideograph-R042-Small")
	(when-feature utf-2000 "Ideograph-R043-Lame")
	(when-feature utf-2000 "Ideograph-R044-Corpse")
	(when-feature utf-2000 "Ideograph-R045-Sprout")
	(when-feature utf-2000 "Ideograph-R046-Mountain")
	(when-feature utf-2000 "Ideograph-R047-River")
	(when-feature utf-2000 "Ideograph-R048-Work")
	(when-feature utf-2000 "Ideograph-R049-Oneself")
	(when-feature utf-2000 "Ideograph-R050-Turban")
	(when-feature utf-2000 "Ideograph-R051-Dry")
	(when-feature utf-2000 "Ideograph-R052-Short-Thread")
	(when-feature utf-2000 "Ideograph-R053-Dotted-Cliff")
	(when-feature utf-2000 "Ideograph-R054-Long-Stride")
	(when-feature utf-2000 "Ideograph-R055-Two-Hands")
	(when-feature utf-2000 "Ideograph-R056-Shoot")
	(when-feature utf-2000 "Ideograph-R057-Bow")
	(when-feature utf-2000 "Ideograph-R058-Snout")
	(when-feature utf-2000 "Ideograph-R059-Bristle")
	(when-feature utf-2000 "Ideograph-R060-Step")
	(when-feature utf-2000 "Ideograph-R061-Heart")
	(when-feature utf-2000 "Ideograph-R062-Halberd")
	(when-feature utf-2000 "Ideograph-R063-Door")
	(when-feature utf-2000 "Ideograph-R064-Hand")
	(when-feature utf-2000 "Ideograph-R065-Branch")
	(when-feature utf-2000 "Ideograph-R066-Rap")
	(when-feature utf-2000 "Ideograph-R067-Script")
	(when-feature utf-2000 "Ideograph-R068-Dipper")
	(when-feature utf-2000 "Ideograph-R069-Axe")
	(when-feature utf-2000 "Ideograph-R070-Square")
	(when-feature utf-2000 "Ideograph-R071-Not")
	(when-feature utf-2000 "Ideograph-R072-Sun")
	(when-feature utf-2000 "Ideograph-R073-Say")
	(when-feature utf-2000 "Ideograph-R074-Moon")
	(when-feature utf-2000 "Ideograph-R075-Tree")
	(when-feature utf-2000 "Ideograph-R076-Lack")
	(when-feature utf-2000 "Ideograph-R077-Stop")
	(when-feature utf-2000 "Ideograph-R078-Death")
	(when-feature utf-2000 "Ideograph-R079-Weapon")
	(when-feature utf-2000 "Ideograph-R080-Do-Not")
	(when-feature utf-2000 "Ideograph-R081-Compare")
	(when-feature utf-2000 "Ideograph-R082-Fur")
	(when-feature utf-2000 "Ideograph-R083-Clan")
	(when-feature utf-2000 "Ideograph-R084-Steam")
	(when-feature utf-2000 "Ideograph-R085-Water")
	(when-feature utf-2000 "Ideograph-R086-Fire")
	(when-feature utf-2000 "Ideograph-R087-Claw")
	(when-feature utf-2000 "Ideograph-R088-Father")
	(when-feature utf-2000 "Ideograph-R089-Double-X")
	(when-feature utf-2000 "Ideograph-R090-Half-Tree-Trunk")
	(when-feature utf-2000 "Ideograph-R091-Slice")
	(when-feature utf-2000 "Ideograph-R092-Fang")
	(when-feature utf-2000 "Ideograph-R093-Cow")
	(when-feature utf-2000 "Ideograph-R094-Dog")
	(when-feature utf-2000 "Ideograph-R095-Profound")
	(when-feature utf-2000 "Ideograph-R096-Jade")
	(when-feature utf-2000 "Ideograph-R097-Melon")
	(when-feature utf-2000 "Ideograph-R098-Tile")
	(when-feature utf-2000 "Ideograph-R099-Sweet")
	(when-feature utf-2000 "Ideograph-R100-Life")
	(when-feature utf-2000 "Ideograph-R101-Use")
	(when-feature utf-2000 "Ideograph-R102-Field")
	(when-feature utf-2000 "Ideograph-R103-Bolt-Of-Cloth")
	(when-feature utf-2000 "Ideograph-R104-Sickness")
	(when-feature utf-2000 "Ideograph-R105-Dotted-Tent")
	(when-feature utf-2000 "Ideograph-R106-White")
	(when-feature utf-2000 "Ideograph-R107-Skin")
	(when-feature utf-2000 "Ideograph-R108-Dish")
	(when-feature utf-2000 "Ideograph-R109-Eye")
	(when-feature utf-2000 "Ideograph-R110-Spear")
	(when-feature utf-2000 "Ideograph-R111-Arrow")
	(when-feature utf-2000 "Ideograph-R112-Stone")
	(when-feature utf-2000 "Ideograph-R113-Spirit")
	(when-feature utf-2000 "Ideograph-R114-Track")
	(when-feature utf-2000 "Ideograph-R115-Grain")
	(when-feature utf-2000 "Ideograph-R116-Cave")
	(when-feature utf-2000 "Ideograph-R117-Stand")
	(when-feature utf-2000 "Ideograph-R118-Bamboo")
	(when-feature utf-2000 "Ideograph-R119-Rice")
	(when-feature utf-2000 "Ideograph-R120-Silk")
	(when-feature utf-2000 "Ideograph-R121-Jar")
	(when-feature utf-2000 "Ideograph-R122-Net")
	(when-feature utf-2000 "Ideograph-R123-Sheep")
	(when-feature utf-2000 "Ideograph-R124-Feather")
	(when-feature utf-2000 "Ideograph-R125-Old")
	(when-feature utf-2000 "Ideograph-R126-And")
	(when-feature utf-2000 "Ideograph-R127-Plow")
	(when-feature utf-2000 "Ideograph-R128-Ear")
	(when-feature utf-2000 "Ideograph-R129-Brush")
	(when-feature utf-2000 "Ideograph-R130-Meat")
	(when-feature utf-2000 "Ideograph-R131-Minister")
	(when-feature utf-2000 "Ideograph-R132-Self")
	(when-feature utf-2000 "Ideograph-R133-Arrive")
	(when-feature utf-2000 "Ideograph-R134-Mortar")
	(when-feature utf-2000 "Ideograph-R135-Tongue")
	(when-feature utf-2000 "Ideograph-R136-Oppose")
	(when-feature utf-2000 "Ideograph-R137-Boat")
	(when-feature utf-2000 "Ideograph-R138-Stopping")
	(when-feature utf-2000 "Ideograph-R139-Color")
	(when-feature utf-2000 "Ideograph-R140-Grass")
	(when-feature utf-2000 "Ideograph-R141-Tiger")
	(when-feature utf-2000 "Ideograph-R142-Insect")
	(when-feature utf-2000 "Ideograph-R143-Blood")
	(when-feature utf-2000 "Ideograph-R144-Walk-Enclosure")
	(when-feature utf-2000 "Ideograph-R145-Clothes")
	(when-feature utf-2000 "Ideograph-R146-West")
	(when-feature utf-2000 "Ideograph-R147-See")
	(when-feature utf-2000 "Ideograph-R148-Horn")
	(when-feature utf-2000 "Ideograph-R149-Speech")
	(when-feature utf-2000 "Ideograph-R150-Valley")
	(when-feature utf-2000 "Ideograph-R151-Bean")
	(when-feature utf-2000 "Ideograph-R152-Pig")
	(when-feature utf-2000 "Ideograph-R153-Badger")
	(when-feature utf-2000 "Ideograph-R154-Shell")
	(when-feature utf-2000 "Ideograph-R155-Red")
	(when-feature utf-2000 "Ideograph-R156-Run")
	(when-feature utf-2000 "Ideograph-R157-Foot")
	(when-feature utf-2000 "Ideograph-R158-Body")
	(when-feature utf-2000 "Ideograph-R159-Cart")
	(when-feature utf-2000 "Ideograph-R160-Bitter")
	(when-feature utf-2000 "Ideograph-R161-Morning")
	(when-feature utf-2000 "Ideograph-R162-Walk")
	(when-feature utf-2000 "Ideograph-R163-City")
	(when-feature utf-2000 "Ideograph-R164-Wine")
	(when-feature utf-2000 "Ideograph-R165-Distinguish")
	(when-feature utf-2000 "Ideograph-R166-Village")
	(when-feature utf-2000 "Ideograph-R167-Gold")
	(when-feature utf-2000 "Ideograph-R168-Long")
	(when-feature utf-2000 "Ideograph-R169-Gate")
	(when-feature utf-2000 "Ideograph-R170-Mound")
	(when-feature utf-2000 "Ideograph-R171-Slave")
	(when-feature utf-2000 "Ideograph-R172-Short-Tailed-Bird")
	(when-feature utf-2000 "Ideograph-R173-Rain")
	(when-feature utf-2000 "Ideograph-R174-Blue")
	(when-feature utf-2000 "Ideograph-R175-Wrong")
	(when-feature utf-2000 "Ideograph-R176-Face")
	(when-feature utf-2000 "Ideograph-R177-Leather")
	(when-feature utf-2000 "Ideograph-R178-Tanned-Leather")
	(when-feature utf-2000 "Ideograph-R179-Leek")
	(when-feature utf-2000 "Ideograph-R180-Sound")
	(when-feature utf-2000 "Ideograph-R181-Leaf")
	(when-feature utf-2000 "Ideograph-R182-Wind")
	(when-feature utf-2000 "Ideograph-R183-Fly")
	(when-feature utf-2000 "Ideograph-R184-Eat")
	(when-feature utf-2000 "Ideograph-R185-Head")
	(when-feature utf-2000 "Ideograph-R186-Fragrant")
	(when-feature utf-2000 "Ideograph-R187-Horse")
	(when-feature utf-2000 "Ideograph-R188-Bone")
	(when-feature utf-2000 "Ideograph-R189-Tall")
	(when-feature utf-2000 "Ideograph-R190-Hair")
	(when-feature utf-2000 "Ideograph-R191-Fight")
	(when-feature utf-2000 "Ideograph-R192-Sacrificial-Wine")
	(when-feature utf-2000 "Ideograph-R193-Cauldron")
	(when-feature utf-2000 "Ideograph-R194-Ghost")
	(when-feature utf-2000 "Ideograph-R195-Fish")
	(when-feature utf-2000 "Ideograph-R196-Bird")
	(when-feature utf-2000 "Ideograph-R197-Salt")
	(when-feature utf-2000 "Ideograph-R198-Deer")
	(when-feature utf-2000 "Ideograph-R199-Wheat")
	(when-feature utf-2000 "Ideograph-R200-Hemp")
	(when-feature utf-2000 "Ideograph-R201-Yellow")
	(when-feature utf-2000 "Ideograph-R202-Millet")
	(when-feature utf-2000 "Ideograph-R203-Black")
	(when-feature utf-2000 "Ideograph-R204-Embroidery")
	(when-feature utf-2000 "Ideograph-R205-Frog")
	(when-feature utf-2000 "Ideograph-R206-Tripod")
	(when-feature utf-2000 "Ideograph-R207-Drum")
	(when-feature utf-2000 "Ideograph-R208-Rat")
	(when-feature utf-2000 "Ideograph-R209-Nose")
	(when-feature utf-2000 "Ideograph-R210-Even")
	(when-feature utf-2000 "Ideograph-R211-Tooth")
	(when-feature utf-2000 "Ideograph-R212-Dragon")
	(when-feature utf-2000 "Ideograph-R213-Turtle")
	(when-feature utf-2000 "Ideograph-R214-Flute")
	(when-feature utf-2000 "u0A000-Yi-Syllables")
	(when-feature utf-2000 "u0AC00-Hangul-Syllables")
	(when-feature utf-2000 "u0E000-Private-Use")
	(when-feature utf-2000 "u0FB00-Alphabetic-Presentation-Forms")
	(when-feature utf-2000 "u0FB50-Arabic-Presentation-Forms-A")
	(when-feature utf-2000 "u0FE20-Combining-Half-Marks")
	(when-feature utf-2000 "u0FE30-CJK-Compatibility-Forms")
	(when-feature utf-2000 "u0FE50-Small-Form-Variants")
	(when-feature utf-2000 "u0FE70-Arabic-Presentation-Forms-B")
	(when-feature utf-2000 "u0FF00-Halfwidth-and-Fullwidth-Forms")
	(when-feature utf-2000 "u0FFF0-Specials")
        ;; (when-feature utf-2000 "mojikyo")
	(when-feature utf-2000 "ccs-tcvn5712.el")
	(when-feature mule "mule-charset")
	(when-feature mule "mule-coding")
	;; All files after this can have extended characters in them.
	(when-feature mule "mule-help")
	(when-feature mule "mule-category")
	(when-feature mule "mule-ccl")
	(when-feature mule "mule-misc")
	(when-feature mule "kinsoku")
	(when-feature (and mule x) "mule-x-init")
	(when-feature (and mule tty) "mule-tty-init")
	(when-feature mule "mule-cmds") ; to sync with Emacs 20.1

;; after this goes the specific lisp routines for a particular input system
;; 97.2.5 JHod Shouldn't these go into a site-load file to allow site
;; or user switching of input systems???
;(if (featurep 'wnn)
;    (progn
;      (pureload "egg")
;      (pureload "egg-wnn")
;      (setq egg-default-startup-file "eggrc-wnn")))

;; (if (and (boundp 'CANNA) CANNA)
;;     (pureload "canna")
;;   )

;; Now load files to set up all the different languages/environments
;; that Mule knows about.

	(when-feature mule "arabic")
	(when-feature mule "chinese")
	(when-feature mule "mule/cyrillic") ; overloaded in leim/quail
	(when-feature mule "english")
	(when-feature mule "ethiopic")
	(when-feature mule "european")
	(when-feature mule "mule/greek") ; overloaded in leim/quail
	(when-feature mule "hebrew")
	(when-feature mule "japanese")
	(when-feature mule "korean")
	(when-feature mule "misc-lang")
	(when-feature mule "thai-xtis-chars")
	(when-feature mule "mule/thai-xtis") ; overloaded in leim/quail
	(when-feature mule "viet-chars")
	(when-feature (and mule (not utf-2000)) "viet-ccl")
	(when-feature mule "vietnamese")

	;; Specialized language support
	(when-feature (and mule CANNA) "canna-leim")
;; Egg/Its is now a package
;	(when-feature (and mule wnn) "egg-leim")
;	(when-feature (and mule wnn) "egg-kwnn-leim")
;	(when-feature (and mule wnn) "egg-cwnn-leim")
;	(when-feature mule "egg-sj3-leim")
;; SKK is now a package
;	(when-feature mule "skk-leim")

;; Set up the XEmacs environment for Mule.
;; Assumes the existence of various stuff above.
	(when-feature mule "mule-init")

;; Enable Mule capability for Gnus, mail, etc...
;; Moved to sunpro-load.el - the default only for Sun.
;;(pureload "mime-setup")
;;; mule-load.el ends here

;; preload InfoDock stuff.  should almost certainly not be here if
;; id-menus is not here.  infodock needs to figure out a clever way to
;; advise this stuff or we need to export a clean way for infodock or
;; others to control this programmatically.
	(when-feature (and infodock (or x mswindows) menubar) "id-menus")
;; preload the X code.
	(when-feature x "x-faces")
	(when-feature x "x-iso8859-1")
	(when-feature x "x-mouse")
	(when-feature x "x-select")
	(when-feature (and x scrollbar) "x-scrollbar")
	(when-feature x "x-misc")
	(when-feature x "x-init")
	(when-feature x "x-win-xfree86")
	(when-feature x "x-win-sun")
;; preload the mswindows code.
	(when-feature mswindows "msw-glyphs")
	(when-feature mswindows "msw-faces")
	(when-feature mswindows "msw-mouse")
	(when-feature mswindows "msw-init")
	(when-feature mswindows "msw-select")
;; preload the TTY init code.
	(when-feature tty "tty-init")
;;; Formerly in tooltalk/tooltalk-load.el
	;; Moved to tooltalk package
	;; (when-feature tooltalk "tooltalk-macros")
	;; (when-feature tooltalk "tooltalk-util")
	;; (when-feature tooltalk "tooltalk-init")
	;; "vc-hooks"		; Packaged.  Available in two versions.
	;; "ediff-hook"		; Packaged.
	"fontl-hooks"
	"auto-show"
	(when-feature ldap "ldap")

;; (when-feature energize "energize/energize-load.el")
;;; formerly in sunpro/sunpro-load.el
;;	(when-feature (and mule sparcworks) "mime-setup")

	;; Moved to Sun package
	;; (when-feature sparcworks "cc-mode") ; Requires cc-mode package
	;; (when-feature sparcworks "sunpro-init")
	;; (when-feature sparcworks "ring")
	;; (when-feature sparcworks "comint") ; Requires comint package
	;; (when-feature sparcworks "annotations")

;;; formerly in eos/sun-eos-load.el
;;	(when-feature sparcworks "sun-eos-init")
;;	(when-feature sparcworks "sun-eos-common")
;;	(when-feature sparcworks "sun-eos-editor")
;;	(when-feature sparcworks "sun-eos-browser")
;;	(when-feature sparcworks "sun-eos-debugger")
;;	(when-feature sparcworks "sun-eos-debugger-extra")
;;	(when-feature sparcworks "sun-eos-menubar")
	"loadhist"		; Must be dumped before loaddefs is loaded
	"loaddefs"		; <=== autoloads get loaded here
))
