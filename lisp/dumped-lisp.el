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
	(when-feature multicast "multicast") ; #+network-streams implicitely true
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

	(when-feature windows-nt "winnt")
	(when-feature lisp-float-type "float-sup")
	"itimer"		; for vars auto-save-timeout and
				; auto-gc-threshold
	"itimer-autosave"
	(when-feature toolbar "toolbar")
	(when-feature scrollbar "scrollbar")
	(when-feature menubar "menubar")
	(when-feature dialog "dialog")
	(when-feature mule "mule-conf")
	(when-feature utf-2000 "ccs-jisx0208-1983.el")
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
	(when-feature mule "mule-charset")
	(when-feature file-coding "coding")
	(when-feature mule "mule-coding")
;; Handle I/O of files with extended characters.
	(when-feature file-coding "code-files")
;; Handle process with encoding/decoding non-ascii coding-system.
	(when-feature file-coding "code-process")
	(when-feature mule "mule-help")
;; Load the remaining basic files.
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
	(when-feature (and mule (not utf-2000)) "vietnamese")

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
	(when-feature window-system "gui")
	(when-feature window-system "mode-motion")
	(when-feature window-system "mouse")
	(when-feature window-system "select")
	(when-feature dragdrop-api "dragdrop")
;; preload the X code, for faster startup.
	(when-feature (and (not infodock)
			   (or x mswindows) menubar) "menubar-items")
	(when-feature (and infodock (or x mswindows) menubar) "id-menus")
	(when-feature (and gutter menubar window-system) "gutter-items")
	(when-feature x "x-faces")
	(when-feature x "x-iso8859-1")
	(when-feature x "x-mouse")
	(when-feature x "x-select")
	(when-feature (and x scrollbar) "x-scrollbar")
	(when-feature x "x-misc")
	(when-feature x "x-init")
	(when-feature (and (not infodock)
			   window-system toolbar) "toolbar-items")
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
