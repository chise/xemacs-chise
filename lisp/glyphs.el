;;; glyphs.el --- Lisp interface to C glyphs

;; Copyright (C) 1994, 1997 Free Software Foundation, Inc.
;; Copyright (C) 1995, 1996 Ben Wing.

;; Author: Chuck Thompson <cthomp@cs.uiuc.edu>, Ben Wing <ben@xemacs.org>
;; Maintainer: XEmacs Development Team
;; Keywords: extensions, internal, dumped

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
;; Free Software Foundation, 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Synched up with: Not in FSF.

;;; Commentary:

;; This file is dumped with XEmacs.

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; font specifiers

(defun make-image-specifier (spec-list)
  "Return a new `image' specifier object with the specification list SPEC-LIST.
SPEC-LIST can be a list of specifications (each of which is a cons of a
locale and a list of instantiators), a single instantiator, or a list
of instantiators.  See `make-specifier' for more information about
specifiers."
  (make-specifier-and-init 'image spec-list))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; glyphs

(defconst built-in-glyph-specifiers
  '(image contrib-p baseline)
  "A list of the built-in face properties that are specifiers.")

(defun glyph-property (glyph property &optional locale)
  "Return GLYPH's value of PROPERTY in LOCALE.

If LOCALE is omitted, the GLYPH's actual value for PROPERTY will be
  returned.  For built-in properties, this will be a specifier object
  of a type appropriate to the property (e.g. a font or color
  specifier).  For other properties, this could be anything.

If LOCALE is supplied, then instead of returning the actual value,
  the specification(s) for the given locale or locale type will
  be returned.  This will only work if the actual value of
  PROPERTY is a specifier (this will always be the case for built-in
  properties, but not or not may apply to user-defined properties).
  If the actual value of PROPERTY is not a specifier, this value
  will simply be returned regardless of LOCALE.

The return value will be a list of instantiators (e.g. strings
  specifying a font or color name), or a list of specifications, each
  of which is a cons of a locale and a list of instantiators.
  Specifically, if LOCALE is a particular locale (a buffer, window,
  frame, device, or 'global), a list of instantiators for that locale
  will be returned.  Otherwise, if LOCALE is a locale type (one of
  the symbols 'buffer, 'window, 'frame, 'device, 'device-class, or
  'device-type), the specifications for all locales of that type will
  be returned.  Finally, if LOCALE is 'all, the specifications for all
  locales of all types will be returned.

The specifications in a specifier determine what the value of
  PROPERTY will be in a particular \"domain\" or set of circumstances,
  which is typically a particular Emacs window along with the buffer
  it contains and the frame and device it lies within.  The value
  is derived from the instantiator associated with the most specific
  locale (in the order buffer, window, frame, device, and 'global)
  that matches the domain in question.  In other words, given a domain
  (i.e. an Emacs window, usually), the specifier for PROPERTY will first
  be searched for a specification whose locale is the buffer contained
  within that window; then for a specification whose locale is the window
  itself; then for a specification whose locale is the frame that the
  window is contained within; etc.  The first instantiator that is
  valid for the domain (usually this means that the instantiator is
  recognized by the device [i.e. the X server or TTY device] that the
  domain is on.  The function `glyph-property-instance' actually does
  all this, and is used to determine how to display the glyph.

See `set-glyph-property' for the built-in property-names."
  (check-argument-type 'glyphp glyph)
  (let ((value (get glyph property)))
    (if (and locale
	     (or (memq property built-in-glyph-specifiers)
		 (specifierp value)))
	(setq value (specifier-specs value locale)))
    value))

(defun convert-glyph-property-into-specifier (glyph property)
  "Convert PROPERTY on GLYPH into a specifier, if it's not already."
  (check-argument-type 'glyphp glyph)
  (let ((specifier (get glyph property)))
    ;; if a user-property does not have a specifier but a
    ;; locale was specified, put a specifier there.
    ;; If there was already a value there, convert it to a
    ;; specifier with the value as its 'global instantiator.
    (if (not (specifierp specifier))
	(let ((new-specifier (make-specifier 'generic)))
	  (if (or (not (null specifier))
		  ;; make sure the nil returned from `get' wasn't
		  ;; actually the value of the property
		  (null (get glyph property t)))
	      (add-spec-to-specifier new-specifier specifier))
	  (setq specifier new-specifier)
	  (put glyph property specifier)))))

(defun glyph-property-instance (glyph property
				      &optional domain default no-fallback)
  "Return the instance of GLYPH's PROPERTY in the specified DOMAIN.

Under most circumstances, DOMAIN will be a particular window,
  and the returned instance describes how the specified property
  actually is displayed for that window and the particular buffer
  in it.  Note that this may not be the same as how the property
  appears when the buffer is displayed in a different window or
  frame, or how the property appears in the same window if you
  switch to another buffer in that window; and in those cases,
  the returned instance would be different.

DOMAIN defaults to the selected window if omitted.

DOMAIN can be a frame or device, instead of a window.  The value
  returned for a such a domain is used in special circumstances
  when a more specific domain does not apply; for example, a frame
  value might be used for coloring a toolbar, which is conceptually
  attached to a frame rather than a particular window.  The value
  is also useful in determining what the value would be for a
  particular window within the frame or device, if it is not
  overridden by a more specific specification.

If PROPERTY does not name a built-in property, its value will
  simply be returned unless it is a specifier object, in which case
  it will be instanced using `specifier-instance'.

Optional arguments DEFAULT and NO-FALLBACK are the same as in
  `specifier-instance'."
  (check-argument-type 'glyphp glyph)
  (let ((value (get glyph property)))
    (if (specifierp value)
	(setq value (specifier-instance value domain default no-fallback)))
    value))

(defun set-glyph-property (glyph property value &optional locale tag-set
				 how-to-add)
  "Change a property of a GLYPH.

NOTE: If you want to remove a property from a glyph, use
  `remove-glyph-property' rather than attempting to set a value of nil
   for the property.

For built-in properties, the actual value of the property is a
  specifier and you cannot change this; but you can change the
  specifications within the specifier, and that is what this function
  will do.  For user-defined properties, you can use this function
  to either change the actual value of the property or, if this value
  is a specifier, change the specifications within it.

If PROPERTY is a built-in property, the specifications to be added to
  this property can be supplied in many different ways:

  -- If VALUE is a simple instantiator (e.g. a string naming a font or
     color) or a list of instantiators, then the instantiator(s) will
     be added as a specification of the property for the given LOCALE
     (which defaults to 'global if omitted).
  -- If VALUE is a list of specifications (each of which is a cons of
     a locale and a list of instantiators), then LOCALE must be nil
     (it does not make sense to explicitly specify a locale in this
     case), and specifications will be added as given.
  -- If VALUE is a specifier (as would be returned by `glyph-property'
     if no LOCALE argument is given), then some or all of the
     specifications in the specifier will be added to the property.
     In this case, the function is really equivalent to
     `copy-specifier' and LOCALE has the same semantics (if it is
     a particular locale, the specification for the locale will be
     copied; if a locale type, specifications for all locales of
     that type will be copied; if nil or 'all, then all
     specifications will be copied).

HOW-TO-ADD should be either nil or one of the symbols 'prepend,
  'append, 'remove-tag-set-prepend, 'remove-tag-set-append, 'remove-locale,
  'remove-locale-type, or 'remove-all.  See `copy-specifier' and
  `add-spec-to-specifier' for a description of what each of
  these means.  Most of the time, you do not need to worry about
  this argument; the default behavior usually is fine.

In general, it is OK to pass an instance object (e.g. as returned
  by `glyph-property-instance') as an instantiator in place of
  an actual instantiator.  In such a case, the instantiator used
  to create that instance object will be used (for example, if
  you set a font-instance object as the value of the 'font
  property, then the font name used to create that object will
  be used instead).  If some cases, however, doing this
  conversion does not make sense, and this will be noted in
  the documentation for particular types of instance objects.

If PROPERTY is not a built-in property, then this function will
  simply set its value if LOCALE is nil.  However, if LOCALE is
  given, then this function will attempt to add VALUE as the
  instantiator for the given LOCALE, using `add-spec-to-specifier'.
  If the value of the property is not a specifier, it will
  automatically be converted into a 'generic specifier.


The following symbols have predefined meanings:

 image		The image used to display the glyph.

 baseline	Percent above baseline that glyph is to be
		displayed.

 contrib-p	Whether the glyph contributes to the
		height of the line it's on.

 face		Face of this glyph (*not* a specifier)."
  (check-argument-type 'glyphp glyph)
  (if (memq property built-in-glyph-specifiers)
      (set-specifier (get glyph property) value locale tag-set how-to-add)

    ;; This section adds user defined properties.
    (if (not locale)
	(put glyph property value)
      (convert-glyph-property-into-specifier glyph property)
      (add-spec-to-specifier (get glyph property) value locale tag-set
			     how-to-add)))
  value)

(defun remove-glyph-property (glyph property &optional locale tag-set exact-p)
  "Remove a property from a glyph.
For built-in properties, this is analogous to `remove-specifier'.
See `remove-specifier' for the meaning of the LOCALE, TAG-SET, and EXACT-P
  arguments."
  (or locale (setq locale 'all))
  (if (memq property built-in-glyph-specifiers)
      (remove-specifier (glyph-property glyph property) locale tag-set exact-p)
    (if (eq locale 'all)
	(remprop glyph property)
      (convert-glyph-property-into-specifier glyph property)
      (remove-specifier (glyph-property glyph property) locale tag-set
			exact-p))))

(defun glyph-face (glyph)
  "Return the face of GLYPH."
  (glyph-property glyph 'face))

(defun set-glyph-face (glyph face)
  "Change the face of GLYPH to FACE."
;  (interactive (glyph-interactive "face"))
  (set-glyph-property glyph 'face face))

(defun glyph-image (glyph &optional locale)
  "Return the image of GLYPH in LOCALE, or nil if it is unspecified.

LOCALE may be a locale (the instantiators for that particular locale
  will be returned), a locale type (the specifications for all locales
  of that type will be returned), 'all (all specifications will be
  returned), or nil (the actual specifier object will be returned).

See `glyph-property' for more information."
  (glyph-property glyph 'image locale))

(defun glyph-image-instance (glyph &optional domain default no-fallback)
  "Return the instance of GLYPH's image in DOMAIN.

Normally DOMAIN will be a window or nil (meaning the selected window),
  and an instance object describing how the image appears in that
  particular window and buffer will be returned.

See `glyph-property-instance' for more information."
  (glyph-property-instance glyph 'image domain default no-fallback))

(defun set-glyph-image (glyph spec &optional locale tag-set how-to-add)
  "Change the image of GLYPH in LOCALE.

SPEC should be an instantiator (a string or vector; see
  `image-specifier-p' for a description of possible values here),
  a list of (possibly tagged) instantiators, an alist of specifications
  (each mapping a locale to an instantiator list), or an image specifier
  object.

If SPEC is an alist, LOCALE must be omitted.  If SPEC is a
  specifier object, LOCALE can be a locale, a locale type, 'all,
  or nil; see `copy-specifier' for its semantics.  Otherwise LOCALE
  specifies the locale under which the specified instantiator(s)
  will be added, and defaults to 'global.

See `set-glyph-property' for more information."
  ; (interactive (glyph-interactive "image"))
  (set-glyph-property glyph 'image spec locale tag-set how-to-add))

(defun glyph-contrib-p (glyph &optional locale)
  "Return whether GLYPH contributes to its line height.

LOCALE may be a locale (the instantiators for that particular locale
  will be returned), a locale type (the specifications for all locales
  of that type will be returned), 'all (all specifications will be
  returned), or nil (the actual specifier object will be returned).

See `glyph-property' for more information."
  (glyph-property glyph 'contrib-p locale))

(defun glyph-contrib-p-instance (glyph &optional domain default no-fallback)
  "Return the instance of GLYPH's 'contrib-p property in DOMAIN.

Normally DOMAIN will be a window or nil (meaning the selected window),
  and an instance object describing what the 'contrib-p property is in
  that particular window and buffer will be returned.

See `glyph-property-instance' for more information."
  (glyph-property-instance glyph 'contrib-p domain default no-fallback))

(defun set-glyph-contrib-p (glyph spec &optional locale tag-set how-to-add)
  "Change the contrib-p property of GLYPH in LOCALE.

SPEC should be an instantiator (t or nil), a list of (possibly
  tagged) instantiators, an alist of specifications (each mapping a
  locale to an instantiator list), or a boolean specifier object.

If SPEC is an alist, LOCALE must be omitted.  If SPEC is a
  specifier object, LOCALE can be a locale, a locale type, 'all,
  or nil; see `copy-specifier' for its semantics.  Otherwise LOCALE
  specifies the locale under which the specified instantiator(s)
  will be added, and defaults to 'global.

See `set-glyph-property' for more information."
  ; (interactive (glyph-interactive "contrib-p"))
  (set-glyph-property glyph 'contrib-p spec locale tag-set how-to-add))

(defun glyph-baseline (glyph &optional locale)
  "Return the baseline of GLYPH in LOCALE, or nil if it is unspecified.

LOCALE may be a locale (the instantiators for that particular locale
  will be returned), a locale type (the specifications for all locales
  of that type will be returned), 'all (all specifications will be
  returned), or nil (the actual specifier object will be returned).

See `glyph-property' for more information."
  (glyph-property glyph 'baseline locale))

(defun glyph-baseline-instance (glyph &optional domain default no-fallback)
  "Return the instance of GLYPH's baseline in DOMAIN.

Normally DOMAIN will be a window or nil (meaning the selected window),
  and an integer or nil (specifying the baseline in that particular
  window and buffer) will be returned.

See `glyph-property-instance' for more information."
  (glyph-property-instance glyph 'baseline domain default no-fallback))

(defun set-glyph-baseline (glyph spec &optional locale tag-set how-to-add)
  "Change the baseline of GLYPH to SPEC in LOCALE.

SPEC should be an instantiator (an integer [a percentage above the
  baseline of the line the glyph is on] or nil), a list of (possibly
  tagged) instantiators, an alist of specifications (each mapping a
  locale to an instantiator list), or a generic specifier object.

If SPEC is an alist, LOCALE must be omitted.  If SPEC is a
  specifier object, LOCALE can be a locale, a locale type, 'all,
  or nil; see `copy-specifier' for its semantics.  Otherwise LOCALE
  specifies the locale under which the specified instantiator(s)
  will be added, and defaults to 'global.

See `set-glyph-property' for more information."
  ; (interactive (glyph-interactive "baseline"))
  (set-glyph-property glyph 'baseline spec locale tag-set how-to-add))

(defun make-glyph (&optional spec-list type)
  "Return a new `glyph' object of type TYPE.

TYPE should be one of `buffer' (used for glyphs in an extent, the modeline,
the toolbar, or elsewhere in a buffer), `pointer' (used for the mouse-pointer),
or `icon' (used for a frame's icon), and defaults to `buffer'.

SPEC-LIST is used to initialize the glyph's image.  It is typically an
image instantiator (a string or a vector; see `image-specifier-p' for
a detailed description of the valid image instantiators), but can also
be a list of such instantiators (each one in turn is tried until an
image is successfully produced), a cons of a locale (frame, buffer, etc.)
and an instantiator, a list of such conses, or any other form accepted
by `canonicalize-spec-list'.  See `make-specifier' for more information
about specifiers."
  (let ((glyph (make-glyph-internal type)))
    (and spec-list (set-glyph-image glyph spec-list))
    glyph))

(defun buffer-glyph-p (object)
  "Return t if OBJECT is a glyph of type `buffer'."
  (and (glyphp object) (eq 'buffer (glyph-type object))))

(defun pointer-glyph-p (object)
  "Return t if OBJECT is a glyph of type `pointer'."
  (and (glyphp object) (eq 'pointer (glyph-type object))))

(defun icon-glyph-p (object)
  "Return t if OBJECT is a glyph of type `icon'."
  (and (glyphp object) (eq 'icon (glyph-type object))))

(defun make-pointer-glyph (&optional spec-list)
  "Return a new `pointer-glyph' object with the specification list SPEC-LIST.

This is equivalent to calling `make-glyph', specifying a type of `pointer'.

SPEC-LIST is used to initialize the glyph's image.  It is typically an
image instantiator (a string or a vector; see `image-specifier-p' for
a detailed description of the valid image instantiators), but can also
be a list of such instantiators (each one in turn is tried until an
image is successfully produced), a cons of a locale (frame, buffer, etc.)
and an instantiator, a list of such conses, or any other form accepted
by `canonicalize-spec-list'.  See `make-specifier' for more information
about specifiers.

You can also create a glyph with an empty SPEC-LIST and add image
instantiators afterwards using `set-glyph-image'."
  (make-glyph spec-list 'pointer))

(defun make-icon-glyph (&optional spec-list)
  "Return a new `icon-glyph' object with the specification list SPEC-LIST.

This is equivalent to calling `make-glyph', specifying a type of `icon'.

SPEC-LIST is used to initialize the glyph's image.  It is typically an
image instantiator (a string or a vector; see `image-specifier-p' for
a detailed description of the valid image instantiators), but can also
be a list of such instantiators (each one in turn is tried until an
image is successfully produced), a cons of a locale (frame, buffer, etc.)
and an instantiator, a list of such conses, or any other form accepted
by `canonicalize-spec-list'.  See `make-specifier' for more information
about specifiers.

You can also create a glyph with an empty SPEC-LIST and add image
instantiators afterwards using `set-glyph-image'."
  (make-glyph spec-list 'icon))

(defun nothing-image-instance-p (object)
  "Return t if OBJECT is an image instance of type `nothing'."
  (and (image-instance-p object) (eq 'nothing (image-instance-type object))))

(defun text-image-instance-p (object)
  "Return t if OBJECT is an image instance of type `text'."
  (and (image-instance-p object) (eq 'text (image-instance-type object))))

(defun mono-pixmap-image-instance-p (object)
  "Return t if OBJECT is an image instance of type `mono-pixmap'."
  (and (image-instance-p object) (eq 'mono-pixmap
				     (image-instance-type object))))

(defun color-pixmap-image-instance-p (object)
  "Return t if OBJECT is an image instance of type `color-pixmap'."
  (and (image-instance-p object) (eq 'color-pixmap
				     (image-instance-type object))))

(defun pointer-image-instance-p (object)
  "Return t if OBJECT is an image instance of type `pointer'."
  (and (image-instance-p object) (eq 'pointer (image-instance-type object))))

(defun subwindow-image-instance-p (object)
  "Return t if OBJECT is an image instance of type `subwindow'.
Subwindows are not implemented in this version of XEmacs."
  (and (image-instance-p object) (eq 'subwindow (image-instance-type object))))

;;;;;;;;;; the built-in glyphs

(defvar text-pointer-glyph (make-pointer-glyph)
  "*The shape of the mouse-pointer when over text.
This is a glyph; use `set-glyph-image' to change it.")
(set-glyph-face text-pointer-glyph 'pointer)

(defvar nontext-pointer-glyph (make-pointer-glyph)
  "*The shape of the mouse-pointer when over a buffer, but not over text.
This is a glyph; use `set-glyph-image' to change it.
If unspecified in a particular domain, `text-pointer-glyph' is used.")
(set-glyph-face nontext-pointer-glyph 'pointer)

(defvar modeline-pointer-glyph (make-pointer-glyph)
  "*The shape of the mouse-pointer when over the modeline.
This is a glyph; use `set-glyph-image' to change it.
If unspecified in a particular domain, `nontext-pointer-glyph' is used.")
(set-glyph-face modeline-pointer-glyph 'pointer)

(defvar selection-pointer-glyph (make-pointer-glyph)
  "*The shape of the mouse-pointer when over a selectable text region.
This is a glyph; use `set-glyph-image' to change it.
If unspecified in a particular domain, `text-pointer-glyph' is used.")
(set-glyph-face selection-pointer-glyph 'pointer)

(defvar busy-pointer-glyph (make-pointer-glyph)
  "*The shape of the mouse-pointer when XEmacs is busy.
This is a glyph; use `set-glyph-image' to change it.
If unspecified in a particular domain, the pointer is not changed
when XEmacs is busy.")
(set-glyph-face busy-pointer-glyph 'pointer)

(defvar toolbar-pointer-glyph (make-pointer-glyph)
  "*The shape of the mouse-pointer when over a toolbar.
This is a glyph; use `set-glyph-image' to change it.
If unspecified in a particular domain, `nontext-pointer-glyph' is used.")
(set-glyph-face toolbar-pointer-glyph 'pointer)

(defvar divider-pointer-glyph (make-pointer-glyph)
  "*The shape of the mouse-pointer when over a window divider.
This is a glyph; use `set-glyph-image' to change it.
If unspecified in a particular domain, `nontext-pointer-glyph' is used.")
(set-glyph-face divider-pointer-glyph 'pointer)

;; The following three are in C.
(if (featurep 'menubar)
    (set-glyph-face menubar-pointer-glyph 'pointer))
(if (featurep 'scrollbar)
    (set-glyph-face scrollbar-pointer-glyph 'pointer))
(set-glyph-face gc-pointer-glyph 'pointer)

;; Now add the magic access/set behavior.

(defun dontusethis-set-value-glyph-handler (sym args fun harg handler)
  (error "Use `set-glyph-image' to set `%s'" sym))
(defun dontusethis-make-unbound-glyph-handler (sym args fun harg handler)
  (error "Can't `makunbound' `%s'" sym))
(defun dontusethis-make-local-glyph-handler (sym args fun harg handler)
  (error "Use `set-glyph-image' to make local values for `%s'" sym))

(defun define-constant-glyph (sym)
  (dontusethis-set-symbol-value-handler
   sym 'set-value
   'dontusethis-set-value-glyph-handler)
  (dontusethis-set-symbol-value-handler
   sym 'make-unbound
   'dontusethis-make-unbound-glyph-handler)
  (dontusethis-set-symbol-value-handler
   sym 'make-local
   'dontusethis-make-local-glyph-handler)
  ;; Make frame properties magically work with glyph variables.
  (put sym 'const-glyph-variable t))

(define-constant-glyph 'text-pointer-glyph)
(define-constant-glyph 'nontext-pointer-glyph)
(define-constant-glyph 'modeline-pointer-glyph)
(define-constant-glyph 'selection-pointer-glyph)
(define-constant-glyph 'busy-pointer-glyph)
(define-constant-glyph 'gc-pointer-glyph)
(define-constant-glyph 'divider-pointer-glyph)
(define-constant-glyph 'toolbar-pointer-glyph)
(define-constant-glyph 'menubar-pointer-glyph)
(define-constant-glyph 'scrollbar-pointer-glyph)

(define-constant-glyph 'octal-escape-glyph)
(define-constant-glyph 'control-arrow-glyph)
(define-constant-glyph 'invisible-text-glyph)
(define-constant-glyph 'hscroll-glyph)
(define-constant-glyph 'truncation-glyph)
(define-constant-glyph 'continuation-glyph)

(define-constant-glyph 'frame-icon-glyph)

;; backwards compatibility garbage

(defun dontusethis-old-pointer-shape-handler (sym args fun harg handler)
  (let ((value (car args)))
    (if (null value)
	(remove-specifier harg 'global)
      (set-glyph-image (symbol-value harg) value))))

;; It might or might not be garbage, but it's rude.  Make these
;; 'compatible instead of 'obsolete.  -slb
(defun define-obsolete-pointer-glyph (old new)
  (define-compatible-variable-alias old new)
  (dontusethis-set-symbol-value-handler
   old 'set-value 'dontusethis-old-pointer-shape-handler new))

;;; (defvar x-pointer-shape nil)
(define-obsolete-pointer-glyph 'x-pointer-shape 'text-pointer-glyph)

;;; (defvar x-nontext-pointer-shape nil)
(define-obsolete-pointer-glyph 'x-nontext-pointer-shape 'nontext-pointer-glyph)

;;; (defvar x-mode-pointer-shape nil)
(define-obsolete-pointer-glyph 'x-mode-pointer-shape 'modeline-pointer-glyph)

;;; (defvar x-selection-pointer-shape nil)
(define-obsolete-pointer-glyph 'x-selection-pointer-shape
  'selection-pointer-glyph)

;;; (defvar x-busy-pointer-shape nil)
(define-obsolete-pointer-glyph 'x-busy-pointer-shape 'busy-pointer-glyph)

;;; (defvar x-gc-pointer-shape nil)
(define-obsolete-pointer-glyph 'x-gc-pointer-shape 'gc-pointer-glyph)

;;; (defvar x-toolbar-pointer-shape nil)
(define-obsolete-pointer-glyph 'x-toolbar-pointer-shape 'toolbar-pointer-glyph)

;;;;;;;;;; initialization

(defun init-glyphs ()
  ;; initialize default image types
  (if (featurep 'x)
    (set-console-type-image-conversion-list 'x
     `(,@(if (featurep 'xpm) '(("\\.xpm\\'" [xpm :file nil] 2)))
	 ("\\.xbm\\'" [xbm :file nil] 2)
       ,@(if (featurep 'xpm) '(("\\`/\\* XPM \\*/" [xpm :data nil] 2)))
       ,@(if (featurep 'xface) '(("\\`X-Face:" [xface :data nil] 2)))
       ,@(if (featurep 'gif) '(("\\.gif\\'" [gif :file nil] 2)
			       ("\\`GIF8[79]" [gif :data nil] 2)))
       ,@(if (featurep 'jpeg) '(("\\.jpe?g\\'" [jpeg :file nil] 2)))
       ;; all of the JFIF-format JPEG's that I've seen begin with
       ;; the following.  I have no idea if this is standard.
       ,@(if (featurep 'jpeg) '(("\\`\377\330\377\340\000\020JFIF"
				 [jpeg :data nil] 2)))
       ,@(if (featurep 'png) '(("\\.png\\'" [png :file nil] 2)))
       ,@(if (featurep 'png) '(("\\`\211PNG" [png :data nil] 2)))
       ("" [autodetect :data nil] 2))))
  ;; #### this should really be formatted-string, not string but we
  ;; don't have it implemented yet
  ;;
  ;; #define could also mean a bitmap as well as a version 1 XPM.  Who
  ;; cares.  We don't want the file contents getting converted to a
  ;; string in either case which is why the entry is there.
  (if (featurep 'tty)
      (progn
	(set-console-type-image-conversion-list
	 'tty
	 '(("^#define" [string :data "[xpm]"])
	   ("\\`X-Face:" [string :data "[xface]"])
	   ("\\`/\\* XPM \\*/" [string :data "[xpm]"])
	   ("\\`GIF87" [string :data "[gif]"])
	   ("\\`\377\330\340\000\020JFIF" [string :data "[jpeg]"])
	   ("" [string :data nil] 2)
	   ;; this last one is here for pointers and icons and such --
	   ;; strings are not allowed so they will be ignored.
	   ("" [nothing])))

	;; finish initializing truncation glyph -- created internally
	;; because it has a built-in bitmap
	(set-glyph-image truncation-glyph "$" 'global 'tty)

	;; finish initializing continuation glyph -- created internally
	;; because it has a built-in bitmap
	(set-glyph-image continuation-glyph "\\" 'global 'tty)

	;; finish initializing hscroll glyph -- created internally
	;; because it has a built-in bitmap
	(set-glyph-image hscroll-glyph "$" 'global 'tty)))

  (set-glyph-image octal-escape-glyph "\\")
  (set-glyph-image control-arrow-glyph "^")
  (set-glyph-image invisible-text-glyph " ...")
  ;; (set-glyph-image hscroll-glyph "$")

  (let ((face (make-face 'border-glyph
			 "Truncation and continuation glyphs face")))
    (set-glyph-face continuation-glyph face)
    (set-glyph-face truncation-glyph face)
    (set-glyph-face hscroll-glyph face))

  ;; finish initializing xemacs logo -- created internally because it
  ;; has a built-in bitmap
  (if (featurep 'xpm)
      (set-glyph-image xemacs-logo
		       (concat "../etc/"
			       (if emacs-beta-version
				   "xemacs-beta.xpm"
				 "xemacs.xpm"))
		       'global 'x))
  (cond ((featurep 'xpm)
	 (set-glyph-image frame-icon-glyph
			  (concat "../etc/" "xemacs-icon.xpm")
			  'global 'x))
	((featurep 'x)
	 (set-glyph-image frame-icon-glyph
			  (concat "../etc/" "xemacs-icon2.xbm")
			  'global 'x)))

  (if (featurep 'tty)
      (set-glyph-image xemacs-logo
		       "XEmacs <insert spiffy graphic logo here>"
		       'global 'tty))
)

(init-glyphs)

;;; glyphs.el ends here.
