;;; specifier.el --- Lisp interface to specifiers

;; Copyright (C) 1997 Free Software Foundation, Inc.
;; Copyright (C) 1995, 1996 Ben Wing.

;; Author: Ben Wing <ben@xemacs.org>
;; Keywords: internal, dumped

;;; Synched up with: Not in FSF.

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

;;; Commentary:

;; This file is dumped with XEmacs.

;;; Code:

(defun make-specifier-and-init (type spec-list &optional dont-canonicalize)
  "Create and initialize a new specifier.

This is a front-end onto `make-specifier' that allows you to create a
specifier and add specs to it at the same time.  TYPE specifies the
specifier type.  SPEC-LIST supplies the specification(s) to be added
to the specifier. Normally, almost any reasonable abbreviation of the
full spec-list form is accepted, and is converted to the full form;
however, if optional argument DONT-CANONICALIZE is non-nil, this
conversion is not performed, and the SPEC-LIST must already be in full
form.  See `canonicalize-spec-list'."
  (let ((sp (make-specifier type)))
    (if (not dont-canonicalize)
	(setq spec-list (canonicalize-spec-list spec-list type)))
    (add-spec-list-to-specifier sp spec-list)
    sp))

;; God damn, do I hate dynamic scoping.

(defun map-specifier (ms-specifier ms-func &optional ms-locale ms-maparg)
  "Apply MS-FUNC to the specification(s) for MS-LOCALE in MS-SPECIFIER.

If MS-LOCALE is a locale, MS-FUNC will be called for that locale.
If MS-LOCALE is a locale type, MS-FUNC will be mapped over all locales
of that type.  If MS-LOCALE is 'all or nil, MS-FUNC will be mapped
over all locales in MS-SPECIFIER.

MS-FUNC is called with four arguments: the MS-SPECIFIER, the locale
being mapped over, the inst-list for that locale, and the
optional MS-MAPARG.  If any invocation of MS-FUNC returns non-nil,
the mapping will stop and the returned value becomes the
value returned from `map-specifier'.  Otherwise, `map-specifier'
returns nil."
  (let ((ms-specs (specifier-spec-list ms-specifier ms-locale))
	ms-result)
    (while (and ms-specs (not ms-result))
      (let ((ms-this-spec (car ms-specs)))
	(setq ms-result (funcall ms-func ms-specifier (car ms-this-spec)
			      (cdr ms-this-spec) ms-maparg))
	(setq ms-specs (cdr ms-specs))))
    ms-result))

(defun canonicalize-inst-pair (inst-pair specifier-type &optional noerror)
  "Canonicalize the given INST-PAIR.

SPECIFIER-TYPE specifies the type of specifier that this SPEC-LIST
will be used for.

Canonicalizing means converting to the full form for an inst-pair, i.e.
`(TAG-SET . INSTANTIATOR)'.  A single, untagged instantiator is given
a tag set of nil (the empty set), and a single tag is converted into
a tag set consisting only of that tag.

If NOERROR is non-nil, signal an error if the inst-pair is invalid;
otherwise return t."
  ;; OK, the possibilities are:
  ;;
  ;; a) a single instantiator
  ;; b) a cons of a tag and an instantiator
  ;; c) a cons of a tag set and an instantiator
  (cond ((valid-instantiator-p inst-pair specifier-type)
	 ;; case (a)
	 (cons nil inst-pair))

	((not (consp inst-pair))
	 ;; not an inst-pair
	 (if noerror t
	   ;; this will signal an appropriate error.
	   (check-valid-instantiator inst-pair specifier-type)))

	((and (valid-specifier-tag-p (car inst-pair))
	      (valid-instantiator-p (cdr inst-pair) specifier-type))
	 ;; case (b)
	 (cons (list (car inst-pair)) (cdr inst-pair)))

	((and (valid-specifier-tag-set-p (car inst-pair))
	      (valid-instantiator-p (cdr inst-pair) specifier-type))
	 ;; case (c)
	 inst-pair)
	 
	(t
	 (if noerror t
	   (signal 'error (list "Invalid specifier tag set"
				(car inst-pair)))))))

(defun canonicalize-inst-list (inst-list specifier-type &optional noerror)
  "Canonicalize the given INST-LIST (a list of inst-pairs).

SPECIFIER-TYPE specifies the type of specifier that this INST-LIST
will be used for.

Canonicalizing means converting to the full form for an inst-list, i.e.
`((TAG-SET . INSTANTIATOR) ...)'.  This function accepts a single
inst-pair or any abbreviation thereof or a list of (possibly
abbreviated) inst-pairs. (See `canonicalize-inst-pair'.)

If NOERROR is non-nil, signal an error if the inst-list is invalid;
otherwise return t."

  ;; OK, the possibilities are:
  ;;
  ;; a) an inst-pair or various abbreviations thereof
  ;; b) a list of (a)
  (let ((result (canonicalize-inst-pair inst-list specifier-type t)))
    (if (not (eq result t))
	;; case (a)
	(list result)

      (if (not (consp inst-list))
	  ;; not an inst-list.
	  (if noerror t
	   ;; this will signal an appropriate error.
	    (check-valid-instantiator inst-list specifier-type))

	;; case (b)
	(catch 'cann-inst-list
	  ;; don't use mapcar here; we need to catch the case of
	  ;; an invalid list.
	  (let ((rest inst-list)
		(result nil))
	    (while rest
	      (if (not (consp rest))
		  (if noerror (throw 'cann-inst-list t)
		    (signal 'error (list "Invalid list format" inst-list)))
		(let ((res2 (canonicalize-inst-pair (car rest) specifier-type
						    noerror)))
		  (if (eq res2 t)
		      ;; at this point, we know we're noerror because
		      ;; otherwise canonicalize-inst-pair would have
		      ;; signalled an error.
		      (throw 'cann-inst-list t)
		    (setq result (cons res2 result)))))
	      (setq rest (cdr rest)))
	    (nreverse result)))))))

(defun canonicalize-spec (spec specifier-type &optional noerror)
  "Canonicalize the given SPEC (a specification).

SPECIFIER-TYPE specifies the type of specifier that this SPEC-LIST
will be used for.

Canonicalizing means converting to the full form for a spec, i.e.
`(LOCALE (TAG-SET . INSTANTIATOR) ...)'.  This function accepts a
possibly abbreviated inst-list or a cons of a locale and a possibly
abbreviated inst-list. (See `canonicalize-inst-list'.)

If NOERROR is nil, signal an error if the specification is invalid;
otherwise return t."
  ;; OK, the possibilities are:
  ;;
  ;; a) an inst-list or some abbreviation thereof
  ;; b) a cons of a locale and an inst-list
  (let ((result (canonicalize-inst-list spec specifier-type t)))
    (if (not (eq result t))
	;; case (a)
	(cons 'global result)

      (if (not (consp spec))
	  ;; not a spec.
	  (if noerror t
	    ;; this will signal an appropriate error.
	    (check-valid-instantiator spec specifier-type))

	(if (not (valid-specifier-locale-p (car spec)))
	    ;; invalid locale.
	    (if noerror t
	      (signal 'error (list "Invalid specifier locale" (car spec))))

	  ;; case (b)
	  (let ((result (canonicalize-inst-list (cdr spec) specifier-type
						noerror)))
	    (if (eq result t)
		;; at this point, we know we're noerror because
		;; otherwise canonicalize-inst-list would have
		;; signalled an error.
		t
	      (cons (car spec) result))))))))

(defun canonicalize-spec-list (spec-list specifier-type &optional noerror)
  "Canonicalize the given SPEC-LIST (a list of specifications).

SPECIFIER-TYPE specifies the type of specifier that this SPEC-LIST
will be used for.

Canonicalizing means converting to the full form for a spec-list, i.e.
`((LOCALE (TAG-SET . INSTANTIATOR) ...) ...)'.  This function accepts
a possibly abbreviated specification or a list of such things. (See
`canonicalize-spec'.) This is the function used to convert spec-lists
accepted by `set-specifier' and such into a form suitable for
`add-spec-list-to-specifier'.

This function tries extremely hard to resolve any ambiguities,
and the built-in specifier types (font, image, toolbar, etc.) are
designed so that there won't be any ambiguities.

If NOERROR is nil, signal an error if the spec-list is invalid;
otherwise return t."
  ;; OK, the possibilities are:
  ;;
  ;; a) a spec or various abbreviations thereof
  ;; b) a list of (a)
  (let ((result (canonicalize-spec spec-list specifier-type t)))
    (if (not (eq result t))
	;; case (a)
	(list result)

      (if (not (consp spec-list))
	  ;; not a spec-list.
	  (if noerror t
	   ;; this will signal an appropriate error.
	    (check-valid-instantiator spec-list specifier-type))

	;; case (b)
	(catch 'cann-spec-list
	  ;; don't use mapcar here; we need to catch the case of
	  ;; an invalid list.
	  (let ((rest spec-list)
		(result nil))
	    (while rest
	      (if (not (consp rest))
		  (if noerror (throw 'cann-spec-list t)
		    (signal 'error (list "Invalid list format" spec-list)))
		(let ((res2 (canonicalize-spec (car rest) specifier-type
					       noerror)))
		  (if (eq res2 t)
		      ;; at this point, we know we're noerror because
		      ;; otherwise canonicalize-spec would have
		      ;; signalled an error.
		      (throw 'cann-spec-list t)
		    (setq result (cons res2 result)))))
	      (setq rest (cdr rest)))
	    (nreverse result)))))))

(defun set-specifier (specifier value &optional locale tag-set how-to-add)
  "Add a specification or specifications to SPECIFIER.

This function adds a specification of VALUE in locale LOCALE.
LOCALE indicates where this specification is active, and should be
a buffer, a window, a frame, a device, or the symbol `global' to
indicate that it applies everywhere.  LOCALE usually defaults to
`global' if omitted.

VALUE is usually what is called an \"instantiator\" (which, roughly
speaking, corresponds to the \"value\" of the property governed by
SPECIFIER).  The valid instantiators for SPECIFIER depend on the
type of SPECIFIER (which you can determine using `specifier-type').
The specifier `scrollbar-width', for example, is of type `integer',
meaning its valid instantiators are integers.  The specifier
governing the background color of the `default' face (you can
retrieve this specifier using `(face-background 'default)') is
of type `color', meaning its valid instantiators are strings naming
colors and color-instance objects.  For some types of specifiers,
such as `image' and `toolbar', the instantiators can be very
complex.  Generally this is documented in the appropriate predicate
function -- `color-specifier-p', `image-specifier-p',
`toolbar-specifier-p', etc.

NOTE: It does *not* work to give a VALUE of nil as a way of
removing the specifications for a locale.  Use `remove-specifier'
instead. (And keep in mind that, if you omit the LOCALE argument
to `remove-specifier', it removes *all* specifications!  If you
want to remove just the `global' specification, make sure to
specify a LOCALE of `global'.)

VALUE can also be a list of instantiators.  This means basically,
\"try each one in turn until you get one that works\".  This allows
you to give funky instantiators that may only work in some cases,
and provide more normal backups for the other cases. (For example,
you might like the color \"darkseagreen2\", but some X servers
don't recognize this color, so you could provide a backup
\"forest green\".  Color TTY devices probably won't recognize this
either, so you could provide a second backup \"green\".  You'd
do this by specifying this list of instantiators:

'(\"darkseagreen2\" \"forest green\" \"green\")

VALUE can also be various more complicated forms; see below.

Optional argument TAG-SET is a tag or a list of tags, to be associated
with the VALUE.  Tags are symbols (usually naming device types, such
as `x' and `tty', or device classes, such as `color', `mono', and
`grayscale'); specifying a TAG-SET restricts the scope of VALUE to
devices that match all specified tags. (You can also create your
own tags using `define-specifier-tag', and use them to identify
specifications added by you, so you can remove them later.)

Optional argument HOW-TO-ADD should be either nil or one of the
symbols `prepend', `append', `remove-tag-set-prepend',
`remove-tag-set-append', `remove-locale', `remove-locale-type',
or `remove-all'.  This specifies what to do with existing
specifications in LOCALE (and possibly elsewhere in the specifier).
Most of the time, you do not need to worry about this argument;
the default behavior of `remove-tag-set-prepend' is usually fine.
See `copy-specifier' and `add-spec-to-specifier' for a full
description of what each of these means.

VALUE can actually be anything acceptable to `canonicalize-spec-list';
this includes, among other things:

-- a cons of a locale and an instantiator (or list of instantiators)
-- a cons of a tag or tag-set and an instantiator (or list of
   instantiators)
-- a cons of a locale and the previous type of item
-- a list of one or more of any of the previous types of items

However, in these cases, you cannot give a LOCALE or TAG-SET,
because they do not make sense. (You will probably get an error if
you try this.)

Finally, VALUE can itself be a specifier (of the same type as
SPECIFIER), if you want to copy specifications from one specifier
to another; this is equivalent to calling `copy-specifier', and
LOCALE, TAG-SET, and HOW-TO-ADD have the same semantics as with
that function.

Note that `set-specifier' is exactly complementary to `specifier-specs'
except in the case where SPECIFIER has no specs at all in it but nil
is a valid instantiator (in that case, `specifier-specs' will return
nil (meaning no specs) and `set-specifier' will interpret the `nil'
as meaning \"I'm adding a global instantiator and its value is `nil'\"),
or in strange cases where there is an ambiguity between a spec-list
and an inst-list, etc. (The built-in specifier types are designed
in such a way as to avoid any such ambiguities.)

NOTE: If you want to work with spec-lists, you should probably not
use either `set-specifier' or `specifier-specs', but should use the
lower-level functions `add-spec-list-to-specifier' and `specifier-spec-list'.
These functions always work with fully-qualified spec-lists; thus, there
is no possibility for ambiguity and no need to go through the function
`canonicalize-spec-list', which is potentially time-consuming."

  ;; backward compatibility: the old function had HOW-TO-ADD as the
  ;; third argument and no arguments after that.
  ;; #### this should disappear at some point.
  (if (and (null how-to-add)
	   (memq locale '(prepend append remove-tag-set-prepend
				  remove-tag-set-append remove-locale
				  remove-locale-type remove-all)))
      (progn
	(setq how-to-add locale)
	(setq locale nil)))

  ;; proper beginning of the function.
  (let ((is-valid (valid-instantiator-p value (specifier-type specifier)))
	(nval value))
    (cond ((and (not is-valid) (specifierp nval))
	   (copy-specifier nval specifier locale tag-set nil how-to-add))
	  (t
	   (if tag-set
	       (progn
		 (if (not (listp tag-set))
		     (setq tag-set (list tag-set)))
		 ;; You tend to get more accurate errors
		 ;; for a variety of cases if you call
		 ;; canonicalize-tag-set here.
		 (setq tag-set (canonicalize-tag-set tag-set))
		 (if (and (not is-valid) (consp nval))
		     (setq nval
			   (mapcar #'(lambda (x)
				       (check-valid-instantiator
					x (specifier-type specifier))
				       (cons tag-set x))
				   nval))
		   (setq nval (cons tag-set nval)))))
	   (if locale
	       (setq nval (cons locale nval)))
	   (add-spec-list-to-specifier
	    specifier
	    (canonicalize-spec-list nval (specifier-type specifier))
	    how-to-add))))
  value)

(defun modify-specifier-instances (specifier func &optional args force default
					     locale tag-set)
  "Modify all specifications that match LOCALE and TAG-SET by FUNC.

For each specification that exists for SPECIFIER, in locale LOCALE
that matches TAG-SET, call the function FUNC with the instance as its
first argument and with optional arguments ARGS.  The result is then
used as the new value of the instantiator.

If there is no specification in the domain LOCALE matching TAG-SET and
FORCE is non-nil, an explicit one is created from the matching
specifier instance if that exists or DEFAULT otherwise. If LOCALE is
not a domain (i.e. a buffer), DEFAULT is always used. FUNC is then
applied like above and the resulting specification is added."

  (let ((spec-list (specifier-spec-list specifier locale tag-set)))
    (cond
     (spec-list
      ;; Destructively edit the spec-list
      (mapc #'(lambda (spec)
		(mapc #'(lambda (inst-pair)
			  (setcdr inst-pair
				  (apply func (cdr inst-pair) args)))
		      (cdr spec)))
	    spec-list)
      (add-spec-list-to-specifier specifier spec-list))
     (force
      (set-specifier specifier
                     (apply func
                            (or (and (valid-specifier-domain-p locale)
                                     (specifier-instance specifier))
                                default) args)
                     locale tag-set)))))

(defmacro let-specifier (specifier-list &rest body)
  "Add specifier specs, evaluate forms in BODY and restore the specifiers.
\(let-specifier SPECIFIER-LIST BODY...)

Each element of SPECIFIER-LIST should look like this:
\(SPECIFIER VALUE &optional LOCALE TAG-SET HOW-TO-ADD).

SPECIFIER is the specifier to be temporarily modified.  VALUE is the
instantiator to be temporarily added to SPECIFIER in LOCALE.  LOCALE,
TAG-SET and HOW-TO-ADD have the same meaning as in
`add-spec-to-specifier'.

The code resulting from macro expansion will add specifications to
specifiers using `add-spec-to-specifier'.  After BODY is finished, the
temporary specifications are removed and old spec-lists are restored.

LOCALE, TAG-SET and HOW-TO-ADD may be omitted, and default to nil.
The value of the last form in BODY is returned.

NOTE: If you want the specifier's instance to change in all
circumstances, use (selected-window) as the LOCALE.  If LOCALE is nil
or omitted, it defaults to `global'.

Example:
    (let-specifier ((modeline-shadow-thickness 0 (selected-window)))
      (sit-for 1))"
  (check-argument-type 'listp specifier-list)
  (flet ((gensym-frob (x name)
	   (if (or (atom x) (eq (car x) 'quote))
	       (list x)
	     (list (gensym name) x))))
    ;; VARLIST is a list of
    ;; ((SPECIFIERSYM SPECIFIER) (VALUE) (LOCALESYM LOCALE)
    ;;  (TAG-SET) (HOW-TO-ADD))
    ;; If any of these is an atom, then a separate symbol is
    ;; unnecessary, the CAR will contain the atom and CDR will be nil.
    (let* ((varlist (mapcar #'(lambda (listel)
				(or (and (consp listel)
					 (<= (length listel) 5)
					 (> (length listel) 1))
				    (signal 'error
					    (list
					     "should be a list of 2-5 elements"
					     listel)))
				;; VALUE, TAG-SET and HOW-TO-ADD are
				;; referenced only once, so we needn't
				;; frob them with gensym.
				(list (gensym-frob (nth 0 listel) "specifier-")
				      (list (nth 1 listel))
				      (gensym-frob (nth 2 listel) "locale-")
				      (list (nth 3 listel))
				      (list (nth 4 listel))))
			    specifier-list))
	   ;; OLDVALLIST is a list of (OLDVALSYM OLDVALFORM)
	   (oldvallist (mapcar #'(lambda (varel)
				   (list (gensym "old-")
					 `(specifier-spec-list
					   ,(car (nth 0 varel))
					   ,(car (nth 2 varel)))))
			       varlist)))
      ;; Bind the appropriate variables.
      `(let* (,@(mapcan #'(lambda (varel)
			    (delq nil (mapcar
				       #'(lambda (varcons)
					   (and (cdr varcons) varcons))
				       varel)))
			varlist)
		,@oldvallist)
	 (unwind-protect
	     (progn
	       ,@(mapcar #'(lambda (varel)
			     `(add-spec-to-specifier
			       ,(car (nth 0 varel)) ,(car (nth 1 varel))
			       ,(car (nth 2 varel)) ,(car (nth 3 varel))
			       ,(car (nth 4 varel))))
			 varlist)
	       ,@body)
	   ;; Reverse the unwinding order, so that using the same
	   ;; specifier multiple times works.
	   ,@(apply #'nconc (nreverse (mapcar*
				       #'(lambda (oldval varel)
					   `((remove-specifier
					      ,(car (nth 0 varel))
					      ,(car (nth 2 varel)))
					     (add-spec-list-to-specifier
					      ,(car (nth 0 varel))
					      ,(car oldval))))
				       oldvallist varlist))))))))

;; Evaluate this for testing:
; (cl-prettyexpand '(let-specifier ((modeline-shadow-thickness 0 (selected-window) 'x) (fubar (value) baz)) (sit-for 1)))

(define-specifier-tag 'win 'device-on-window-system-p)

;; Add tags for device types that don't have support compiled
;; into the binary that we're about to dump.  This will prevent
;; code like
;;
;; (set-face-foreground 'default "black" nil '(x color))
;;
;; from producing an error if no X support was compiled in.

(or (valid-specifier-tag-p 'x)
    (define-specifier-tag 'x (lambda (dev) (eq (device-type dev) 'x))))
(or (valid-specifier-tag-p 'tty)
    (define-specifier-tag 'tty (lambda (dev) (eq (device-type dev) 'tty))))
(or (valid-specifier-tag-p 'mswindows)
    (define-specifier-tag 'mswindows (lambda (dev)
				       (eq (device-type dev) 'mswindows))))

;; Add special tag for use by initialization code.  Code that
;; sets up default specs should use this tag.  Code that needs to
;; override default specs (e.g. the X resource initialization
;; code) can safely clear specs with this tag without worrying
;; about clobbering user settings.

(define-specifier-tag 'default)

;;; specifier.el ends here
