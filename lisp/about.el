;;; about.el --- the About The Authors page (shameless self promotion).

;; Copyright (c) 1997 Free Software Foundation, Inc.

;; Keywords: extensions
;; Version: 2.4
;; Maintainer: Hrvoje Niksic <hniksic@xemacs.org>

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

;; Original code: Jamie Zawinski <jwz@jwz.org>
;; Text: Ben Wing <ben@xemacs.org>, Jamie Zawinski <jwz@jwz.org>
;; Hard: Amiga 1000, Progressive Peripherals Frame Grabber.
;; Soft: FG 2.0, DigiPaint 3.0, pbmplus (dec 91), xv 3.0.
;; Modified for 19.11 by Eduardo Pelegri-Llopart <pelegri@eng.sun.com>
;;		      and Chuck Thompson <cthomp@xemacs.org>
;; More hacking for 19.12 by Chuck Thompson and Ben Wing.
;; 19.13 and 19.14 updating done by Chuck Thompson.
;; 19.15 and 20.0 updating done by Steve Baur and Martin Buchholz.

;; Completely rewritten for 20.3 by Hrvoje Niksic <hniksic@xemacs.org>.
;; The original had no version numbers; I numbered the rewrite as 2.0.

;; Many things in this file are to gag.  Ideally, we should just use
;; HTML (or some other extension, e.g. info) for this sort of thing.
;; However, W3 loads too long and is too large to be dumped with
;; XEmacs.

;; If you think this is ugly now -- o boy, you should have seen it
;; before.

(require 'wid-edit)

;; People in this list have their individual links from the main page,
;; or from the `Legion' page.  If they have an image, it should be
;; named after the CAR of the list element (baw -> baw.png).
;;
;; If you add to this list, you'll want to update
;; `about-maintainer-info' (and maybe `about-hackers'.
(defvar xemacs-hackers
  '((ajc      "Andrew Cosgriff"   "ajc@bing.wattle.id.au")
    (baw      "Barry Warsaw"      "bwarsaw@python.org")
    (bw       "Bob Weiner"        "weiner@beopen.com")
    (chr      "Christian Nybø"    "chr@mediascience.no")
    (cthomp   "Chuck Thompson"    "cthomp@xemacs.org")
    (dmoore   "David Moore"       "dmoore@ucsd.edu")
    (dkindred "Darrell Kindred"	  "dkindred@cmu.edu")
    (dv       "Didier Verna"      "verna@inf.enst.fr")
    (hniksic  "Hrvoje Niksic"     "hniksic@xemacs.org")
    (jareth   "Jareth Hein"       "jareth@camelot.co.jp")
    (jason    "Jason Mastaler"	  "jason@xemacs.org")
    (jens     "Jens Lautenbacher" "jens@lemcbed.lem.uni-karlsruhe.de")
    (jmiller  "Jeff Miller"       "jmiller@smart.net")
    (juhp     "Jens-Ulrik Holger Petersen" "petersen@kurims.kyoto-u.ac.jp")
    (jwz      "Jamie Zawinski"    "jwz@jwz.org")
    (kazz     "IENAGA Kazuyuki"   "ienaga@jsys.co.jp")
    (kyle     "Kyle Jones"        "kyle_jones@wonderworks.com")
    (larsi    "Lars Magne Ingebrigtsen" "larsi@gnus.org")
    (marcpa   "Marc Paquette"	  "marcpa@CAM.ORG")
    (mcook    "Michael R. Cook"   "mcook@cognex.com")
    (mly      "Richard Mlynarik"  "mly@adoc.xerox.com")
    (morioka  "MORIOKA Tomohiko"  "morioka@jaist.ac.jp")
    (martin   "Martin Buchholz"   "martin@xemacs.org")
    (ograf    "Oliver Graf"       "ograf@fga.de")
    (pez      "Peter Pezaris"	  "pez@dwwc.com")
    (piper    "Andy Piper"        "andy@xemacs.org")
    (rickc    "Rick Campbell"     "rickc@lehman.com")
    (rossini  "Anthony Rossini"	  "rossini@stat.sc.edu")
    (vin      "Vin Shelton"	  "acs@acm.org")
    (sperber  "Michael Sperber"   "sperber@informatik.uni-tuebingen.de")
    (slb      "SL Baur"           "steve@xemacs.org")
    (stig     "Jonathan Stigelman" "stig@hackvan.com")
    (stigb    "Stig Bjorlykke"	  "stigb@tihlde.hist.no")
    (thiessel "Marcus Thiessel"   "marcus@xemacs.org")
    (vladimir "Vladimir Ivanovic" "vladimir@mri.com")
    (wing     "Ben Wing"          "ben@xemacs.org")
    (wmperry  "William Perry"     "wmperry@aventail.com"))
  "Alist of XEmacs hackers.")

;; The CAR of alist elements is a valid argument to `about-url-link'.
;; It is preferred to a simple string, because it makes maintenance
;; easier.  Please add new URLs to this list.
(defvar about-url-alist
  '((ajc        . "http://www-personal.monash.edu.au/~ajc/")
    (beopen     . "http://www.beopen.com/")
    (ben        . "http://www.666.com/ben/")
    (ben-xemacs . "http://www.666.com/xemacs/")
    (baw        . "http://www.python.org/~bwarsaw/")
    (cc-mode    . "http://www.python.org/ftp/emacs/")
    (chr        . "http://www.xemacs.org/faq/")
    (dkindred   . "http://www.cs.cmu.edu/People/dkindred/me.html")
    (dmoore     . "http://oj.egbt.org/dmoore/")
    (jason      . "http://www.mastaler.com/")
    (juhp       . "http://www.kurims.kyoto-u.ac.jp/~petersen/")
    (jwz        . "http://www.jwz.org/")
    (kazz       . "http://www.imasy.or.jp/~kazz/")
    (kyle       . "http://www.wonderworks.com/kyle/")
    (larsi      . "http://www.ifi.uio.no/~larsi/")
    (marcpa     . "http://www.positron911.com/products/power.htm")
    (ograf      . "http://www.fga.de/~ograf/")
    (pez        . "http://www.dwwc.com/")
    (piper      . "http://www.xemacs.freeserve.co.uk/")
    (vin        . "http://www.upa.org/")
    (stigb      . "http://www.tihlde.hist.no/~stigb/")
    (wget       . "ftp://gnjilux.cc.fer.hr/pub/unix/util/wget/")
    (xemacs     . "http://www.xemacs.org/"))
  "Some of the more important URLs.")

(defvar about-left-margin 3)

;; Insert a URL link to the buffer.
(defun about-url-link (what &optional echo)
  (or (stringp what)
      (setq what (cdr (assq what about-url-alist))))
  (assert what)
  (widget-create 'url-link
		 :button-prefix ""
		 :button-suffix ""
		 :help-echo echo
		 what))

;; Attach a face to a string, in order to be inserted into the buffer.
;; Make sure that the extent is duplicable, but unique.  Returns the
;; string.
(defun about-with-face (string face)
  (let ((ext (make-extent 0 (length string) string)))
    (set-extent-property ext 'duplicable t)
    (set-extent-property ext 'unique t)
    (set-extent-property ext 'start-open t)
    (set-extent-property ext 'end-open t)
    (set-extent-face ext face))
  string)

;; Switch to buffer NAME.  If it doesn't exist, make it and switch to it.
(defun about-get-buffer (name)
  (cond ((get-buffer name)
	 (switch-to-buffer name)
	 (delete-other-windows)
	 (goto-char (point-min))
	 name)
	(t
	 (switch-to-buffer name)
	 (delete-other-windows)
	 (buffer-disable-undo)
	 (set-specifier left-margin-width about-left-margin (current-buffer))
	 nil)))

;; Set up the stuff needed by widget.  Allowed types are `bury' and
;; `kill'.
(defun about-finish-buffer (&optional type)
  (or type (setq type 'bury))
  (widget-insert "\n")
  (if (eq type 'bury)
      (widget-create 'link :help-echo "Bury buffer"
		     :action (lambda (&rest ignore)
			       (bury-buffer))
		     "Remove")
    (widget-create 'link :help-echo "Kill buffer"
		   :action (lambda (&rest ignore)
			     (kill-buffer (current-buffer)))
		   "Kill"))
  (widget-insert " this buffer.\n")
  (use-local-map (make-sparse-keymap))
  (set-keymap-parent (current-local-map) widget-keymap)
  (if (eq type 'bury)
      (progn
	(local-set-key "q" 'bury-buffer)
	(local-set-key "l" 'bury-buffer))
    (let ((dispose (lambda () (interactive) (kill-buffer (current-buffer)))))
      (local-set-key "q" dispose)
      (local-set-key "l" dispose)))
  (local-set-key " " 'scroll-up)
  (local-set-key "\177" 'scroll-down)
  (widget-setup)
  (goto-char (point-min))
  (toggle-read-only 1)
  (set-buffer-modified-p nil))

;; Make the appropriate number of spaces.
(defun about-center (string-or-glyph)
  (let ((n (- (startup-center-spaces string-or-glyph) about-left-margin)))
    (make-string (if (natnump n) n 0) ?\ )))

;; Main entry page.

;;;###autoload
(defun about-xemacs ()
  "Describe the True Editor and its minions."
  (interactive)
  (unless (about-get-buffer "*About XEmacs*")
    (widget-insert (about-center xemacs-logo))
    (widget-create 'default
		   :format "%t"
		   :tag-glyph xemacs-logo)
    (widget-insert "\n")
    (let* ((emacs-short-version (format "%d.%d"
					emacs-major-version
					emacs-minor-version))
	   (emacs-about-version (format "version %s; Aug 1998"
					emacs-short-version)))
      (widget-insert (about-center emacs-about-version))
      (widget-create 'link :help-echo "The latest NEWS of XEmacs"
		     :action 'about-news
		     emacs-about-version))

    (widget-insert
     "\n\n"
     (about-with-face "XEmacs" 'italic)
     " (formerly known as "
     (about-with-face "Lucid Emacs" 'italic)
     ") is a powerful, extensible text
editor with full GUI support, initially based on an early version of\n"
     (about-with-face "GNU Emacs 19" 'italic)
     " from the Free Software Foundation and since kept up to
date with recent versions of that product.  XEmacs stems from a\n")
    (widget-create 'link :help-echo "An XEmacs history lesson"
		   :action 'about-collaboration
		   :button-prefix ""
		   :button-suffix ""
		   "collaboration")
    (widget-insert
     " of Lucid, Inc. with Sun Microsystems, Inc. and the
University of Illinois with additional support having been provided by
Amdahl Corporation, INS Engineering Corporation, and a huge amount of
volunteer effort.

XEmacs provides a great number of ")
    (widget-create 'link :help-echo "See a list of the new features"
		   :action 'about-features
		   :button-prefix ""
		   :button-suffix ""
		   "new features")
    (widget-insert ".  More details on
XEmacs's functionality, including bundled packages, can be obtained
through the ")
    (widget-create 'info-link
		   :help-echo "Browse the info system"
		   :button-prefix ""
		   :button-suffix ""
		   :tag "info"
		   "(dir)")

    (widget-insert
     " on-line information system.\n
The XEmacs web page can be browsed, using any WWW browser at\n
\t\t    ")
    (about-url-link 'xemacs "Visit XEmacs WWW page")
    (widget-insert "\n
Note that W3 (XEmacs's own browser), might need customization (due to
firewalls) in order to work correctly.

XEmacs is the result of the time and effort of many people.  The
developers responsible for this release are:\n\n")

    (flet ((setup-person (who)
	    (widget-insert "\t* ")
	    (let* ((entry (assq who xemacs-hackers))
		   (name (cadr entry))
		   (address (caddr entry)))
	      (widget-create 'link
			     :help-echo (concat "Find out more about " name)
			     :button-prefix ""
			     :button-suffix ""
			     :action 'about-maintainer
			     :tag name
			     :value who)
	      (widget-insert (format "  <%s>\n" address)))))
      ;; Setup persons responsible for this release.
      (mapc 'setup-person '(slb hniksic kyle martin piper))
      (widget-insert "\n\t* ")
      (widget-create 'link :help-echo "A legion of XEmacs hackers"
		     :action 'about-hackers
		     :button-prefix ""
		     :button-suffix ""
		     "And many other contributors...")
      (widget-insert "\n
Chuck Thompson was Mr. XEmacs from 19.11 through 19.14.  Ben Wing was
crucial to each of these releases.\n\n")
      (setup-person 'cthomp)
      (setup-person 'wing)
      (widget-insert "
Jamie Zawinski was Mr. Lucid Emacs from 19.0 through 19.10, the last
release actually named Lucid Emacs.  A lot of work has been done by
Richard Mlynarik.\n\n")
      (setup-person 'jwz)
      (setup-person 'mly))
    (about-finish-buffer)))

;; View news
(defun about-news (&rest ignore)
  (view-emacs-news)
  (message "%s" (substitute-command-keys
		 "Press \\[kill-buffer] to exit this buffer")))

(defun about-collaboration (&rest ignore)
  (unless (about-get-buffer "*About Collaboration*")
    (let ((title "Why Another Version of Emacs"))
      (widget-insert
       "\n"
       (about-center title)
       (about-with-face title 'bold)))
    (widget-insert
     "\n\n"
     (about-with-face "The Lucid, Inc. Point of View"
		      'italic)
     " (quite outdated)\n
At the time of the inception of Lucid Emacs (the former name of
XEmacs), Lucid's latest product was Energize, a C/C++ development
environment.  Rather than invent (and force our users to learn) a new
user interface, we chose to build part of our environment on top of
the world's best editor, GNU Emacs.  (Though our product is
commercial, the work we did on GNU Emacs is free software, and is
useful in its own right.)

We needed a version of Emacs with mouse-sensitive regions, multiple
fonts, the ability to mark sections of a buffer as read-only, the
ability to detect which parts of a buffer have been modified, and many
other features.

For our purposes, the existing version of Epoch was not sufficient; it
did not allow us to put arbitrary pixmaps/icons in buffers, `undo' did
not restore changes to regions, regions did not overlap and merge
their attributes in the way we needed, and several other things.

We could have devoted our time to making Epoch do what we needed (and,
in fact, we spent some time doing that in 1990) but, since the FSF
planned to include Epoch-like features in their version 19, we decided
that our efforts would be better spent improving Emacs 19 instead of
Epoch.

Our original hope was that our changes to Emacs would be incorporated
into the \"official\" v19.  However, scheduling conflicts arose, and
we found that, given the amount of work still remaining to be done, we
didn't have the time or manpower to do the level of coordination that
would be necessary to get our changes accepted by the FSF.
Consequently, we released our work as a forked branch of Emacs,
instead of delaying any longer.

Roughly a year after Lucid Emacs 19.0 was released, a beta version of
the FSF branch of Emacs 19 was released.  The FSF version is better in
some areas, and worse in others, as reflects the differing focus of
our development efforts.

We plan to continue developing and supporting Lucid Emacs, and merging
in bug fixes and new features from the FSF branch as appropriate; we
do not plan to discard any of the functionality that we implemented
which RMS has chosen not to include in his version.

Certain elements of Lucid Emacs, or derivatives of them, have been
ported to the FSF version.  We have not been doing work in this
direction, because we feel that Lucid Emacs has a cleaner and more
extensible substrate, and that any kind of merger between the two
branches would be far easier by merging the FSF changes into our
version than the other way around.

We have been working closely with the Epoch developers to merge in the
remaining Epoch functionality which Lucid Emacs does not yet have.
Epoch and Lucid Emacs will soon be one and the same thing.  Work is
being done on a compatibility package which will allow Epoch 4 code to
run in XEmacs with little or no change.\n\n"
     (about-with-face "The Sun Microsystems, Inc. Point of View"
		      'italic)
     "\n
Emacs 18 has been around for a long, long time.  Version 19 was
supposed to be the successor to v18 with X support.  It was going to
be available \"real soon\" for a long time (some people remember
hearing about v19 as early as 1984!), but it never came out.  v19
development was going very, very slowly, and from the outside it
seemed that it was not moving at all.  In the meantime other people
gave up waiting for v19 and decided to build their own X-aware
Emacsen.  The most important of these was probably Epoch, which came
from the University of Illinois (\"UofI\") and was based on v18.

Around 1990, the Developer Products group within Sun Microsystems
Inc., decided that it wanted an integrated editor.  (This group is now
known as DevPro.  It used to be known as SunPro - the name was changed
in mid-1994.)  They contracted with the University of Illinois to
provide a number of basic enhancements to the functionality in Epoch.
UofI initially was planning to deliver this on top of Epoch code.

In the meantime, (actually some time before they talked with UofI)
Lucid had decided that it also wanted to provide an integrated
environment with an integrated editor.  Lucid decided that the Version
19 base was a better one than Version 18 and thus decided not to use
Epoch but instead to work with Richard Stallman, the head of the Free
Software Foundation and principal author of Emacs, on getting v19 out.
At some point Stallman and Lucid parted ways.  Lucid kept working and
got a v19 out that they called Lucid Emacs 19.

After Lucid's v19 came out it became clear to us (the UofI and Sun)
that the right thing to do was to push for an integration of both
Lucid Emacs and Epoch, and to get the deliverables that Sun was asking
from the University of Illinois on top of this integrated platform.
Until 1994, Sun and Lucid both actively supported XEmacs as part of
their product suite and invested a comparable amount of effort into
it.  Substantial portions of the current code have originated under
the support of Sun, either directly within Sun, or at UofI but paid
for by Sun.  This code was kept away from Lucid for a while, but later
was made available to them.  Initially Lucid didn't know that Sun was
supporting UofI, but later Sun was open about it.

Around 1992 DevPro-originated code started showing up in Lucid Emacs,
starting with the infusion of the Epoch redisplay code.  The separate
code bases at Lucid, Sun, and the University of Illinois were merged,
allowing a single XEmacs to evolve from that point on.

Sun originally called the integrated product ERA, for \"Emacs
Rewritten Again\".  SunPro and Lucid eventually came to an agreement
to find a name for the product that was not specific to either
company.  An additional constraint that Lucid placed on the name was
that it must contain the word \"Emacs\" in it -- thus \"ERA\" was not
acceptable.  The tentatively agreed-upon name was \"XEmacs\", and this
has been the name of the program since version 19.11.)

As of 1997, Sun is shipping XEmacs as part of its Developer Products
integrated programming environment \"Sun WorkShop\".  Sun is
continuing to support XEmacs development, with focus on
internationalization and quality improvement.\n\n"
     (about-with-face "Lucid goes under" 'italic)
     "\n
Around mid-'94, Lucid went out of business.  Lucid founder Richard
Gabriel's book \"Patterns of Software\", which is highly recommended
reading in any case, documents the demise of Lucid and suggests
lessons to be learned for the whole software development community.

Development on XEmacs, however, has continued unabated under the
auspices of Sun Microsystems and the University of Illinois, with help
from Amdahl Corporation and INS Engineering Corporation.  Sun plans to
continue to support XEmacs into the future.\n\n"
     (about-with-face "The Amdahl Corporation point of view"
		      'italic)
     "\n
Amdahl Corporation's Storage Products Group (SPG) uses XEmacs as the
focal point of a environment for development of the microcode used in
Amdahl's large-scale disk arrays, or DASD's.  SPG has joint ventures
with Japanese companies, and decided in late 1994 to contract out for
work on XEmacs in order to hasten the development of Mule support
\(i.e. support for Japanese, Chinese, etc.) in XEmacs and as a gesture
of goodwill towards the XEmacs community for all the work they have
done on making a powerful, modern, freely available text editor.
Through this contract, Amdahl provided a large amount of work in
XEmacs in the form of rewriting the basic text-processing mechanisms
to allow for Mule support and writing a large amount of the support
for multiple devices.

Although Amdahl is no longer hiring a full-time contractor, they are
still funding part-time work on XEmacs and providing resources for
further XEmacs development.\n\n"
     (about-with-face "The INS Engineering point of view"
		      'italic)
     "\n
INS Engineering Corporation, based in Tokyo, bought rights to sell
Energize when Lucid went out of business.  Unhappy with the
performance of the Japanese support in XEmacs 19.11, INS also
contributed to the XEmacs development from late 1994 to early
1995.\n")
    (about-finish-buffer)))

(defun about-features (&rest ignore)
  (unless (about-get-buffer "*About Features*")
    (let ((title "New features in XEmacs"))
      (widget-insert
       "\n"
       (about-center title)
       (about-with-face title 'bold)))
    (widget-insert
     "\n
* MULE (Multi-Lingual Emacs) support.  Simultaneous display of
  multiple character sets is now possible.

* Support for arbitrary pixmaps in a buffer.

* A real toolbar.

* Horizontal and vertical scrollbars in all windows.

* Support for variable-width and variable height fonts.

* Support for display on multiple simultaneous X and/or TTY devices.

* Face support on TTY's, including color.

* Support for overlapping regions (or extents) and efficient handling
  of a large number of such extents in a single buffer.

* Powerful, flexible control over the display characteristics of most
  of the visual aspects of XEmacs through the use of specifiers, which
  allow separate values to be specified for individual buffers,
  windows, frames, devices, device classes, and device types.

* A clean interface to the menubar, window-system events, and key
  combinations.

* Proper integration with Xt and Motif (including Motif menubars and
  scrollbars).  Motif look-alike menubars and scrollbars are provided
  for those systems without real Motif support.

* Text for complex languages can be entered using the XIM mechanism.

* Localization of menubar text for the Japanese locale.

* Access to the ToolTalk API.

* Support for using XEmacs frames as Xt widgets.\n\n")
    (about-finish-buffer)))

(defvar about-glyphs nil
  "Cached glyphs")

;; Return a maintainer's glyph
(defun about-maintainer-glyph (who)
  (let ((glyph (cdr (assq who about-glyphs))))
    (unless glyph
      (let ((file (expand-file-name
		   (concat (symbol-name who)
			   (if (memq (device-class)
				     '(color grayscale))
			       "" "m")
			   ".png")
		   (locate-data-directory "photos")))
	    (data nil))
	(setq glyph
	      (cond ((stringp data)
		     (make-glyph
		      (if (featurep 'png)
			  `([png :data ,data]
			    [string :data "[Image]"])
			`([string :data "[Image]"]))))
		    ((eq data 'error)
		     (make-glyph [string :data "[Error]"]))
		    (file
		     (make-glyph
		      (if (featurep 'png)
			  `([png :file ,file]
			    [string :data "[Image]"])
			`([string :data "[Image]"]))))
		    (t
		     (make-glyph [nothing]))))
	(set-glyph-property glyph 'baseline 100)
	;; Cache the glyph
	(push (cons who glyph) about-glyphs)))
    glyph))

;; Insert info about a maintainer.  Add the maintainer-specific info
;; here.
(defun about-maintainer-info (entry)
  (ecase (car entry)
    (slb
     (widget-insert "\
Peaches Baur, 1986-1999.
Rest in peace")
     (widget-insert ".\n"))
    (martin
     (widget-insert "\
Martin was the XEmacs guy at DevPro, a part of Sun Microsystems.
Martin used to do XEmacs as a `hobby' while at IBM, and was crazy
enough to try to make a living doing it at Sun.

Martin starting using Emacs originally not to edit files, but to get
the benefit of shell mode. He actually used to run nothing but a shell
buffer, and use `xterm -e vi' to edit files.  But then he saw the
light.  He dreams of rewriting shell mode from scratch.  Stderr should
show up in red!!

Martin is no longer doing XEmacs for a living, and is Just Another
Volunteer.\n"))
    (hniksic
     (widget-insert "\
Hrvoje is a student at the Faculty of Electrical Engineering and
Computing in Zagreb, Croatia, working part-time at system administration
at SRCE.  His hobby is hacking free software, particularly XEmacs and
GNU Wget, the latter being his very own creation.

His contribution to XEmacs consists of a multitude of hours spent
adding new features and bugs, and fixing old ones.  He dreams of
writing a home page.\n"))
    (wing
     (widget-insert
      "\
I began my Emacs life in 1992 as the co-founder of the now defunct
Pearl Software.  As part of this company, I became the principal
architect of Win-Emacs, an early port of Lucid Emacs to Microsoft
Windows and Windows NT.

Since April 1993, I've worked on XEmacs as a contractor for various
companies, changing hats faster than Ronald Reagan's hair color (oops,
did I just show my age?).  My main contributions to XEmacs include
rewriting large parts of the internals and the gory Xt/Xlib
interfacing, adding the Mule support, implementing the external client
widget, improving the documentation (especially the Emacs Lisp
manual), and being a general nuisance ... er, brainstormer for many of
the new features of XEmacs.

Alas, life has not been good to me recently.  This former San Francisco
\"Mission Critter\" was exiled to \"Stroller Valley\" and, after a brief
stint developing a Java-based VRML toolkit for the now also defunct
Dimension X, I developed insidious hand and neck problems, and I was
forced to quit working.  Since then, I have been learning how to interact
with the computer by using foot pedals and by dictating text to other
people.  Recently I completed Architecting XEmacs, a web site about the
future of XEmacs.\n\n")
     (widget-insert "Architecting XEmacs: ")
     (about-url-link 'ben-xemacs "Find the miracles in store for XEmacs")
     (widget-insert "\nBen's home page:     ")
     (about-url-link 'ben "Visit Ben's page")
     (widget-insert "\n"))
    (cthomp
     (widget-insert "\
Chuck, through being in the wrong place at the right time, has gotten
stuck with being Jamie's replacement as the primary maintainer of
XEmacs.  This has caused his hair to begin falling out and quadrupled
his daily coffee dosage.  Though he works at and for the University of
Illinois his funding for XEmacs work actually came from Sun
Microsystems.

He has worked on XEmacs since November 1992, which fact occasionally
gives him nightmares.  As of October 1995, he no longer works
full-time on XEmacs, though he does continue as an active maintainer.
His main contributions have been the greatly enhanced redisplay
engine, scrollbar support, the toolbars, configure support and
numerous other features and fixes.

Rumors that Chuck is aka Black Francis aka Frank Black are completely
unfounded.\n"))
    (jwz
     (widget-insert
      "\t"
      (about-with-face "\"So much to do, so little time.\"" 'italic)
      "\n
Jamie Zawinski was primarily to blame for Lucid Emacs from its
inception in 1991, to 1994 when Lucid Inc. finally died.  He is now to
be found at Netscape Communications, hacking on Netscape Navigator (he
did the first Unix version and the mail and news reader).  Thankfully
his extensive sleep deprivation experiments conducted during 1994 and
1995 are now a thing of the past, but his predilection for dark,
Gothic music remains unabated.

Come visit his glorified .plan file at\n\n")
     (about-url-link 'jwz "Visit Jamie's home page")
     (widget-insert "\n"))
    (mly
     (widget-insert "Cars are evil.  Ride a bike.\n"))
    (vladimir
     (widget-insert "\
Former technical lead for XEmacs at Sun.  He is now with Microtec
Research Inc., working on embedded systems development tools.\n"))
    (stig
     (widget-insert "\
Stig is sort of a tool fetishist.  He has a hate/love relationship
with computers and he hacks on XEmacs because it's a good tool that
makes computers somewhat less of a nuisance.  Besides XEmacs, Stig
especially likes his Leatherman, his Makita, and his lockpicks.  Stig
wants a MIG welder and air tools.

Stig likes to perch, hang from the ceiling, and climb on the walls.
Stig has a cool van.  Stig would like to be able to telecommute from,
say, the north rim of the Grand Canyon or the midst of Baja.\n"))
    (stigb
     (widget-insert "\
Currently studying computer science in Trondheim, Norway.  Full time
Linux user and proud of it.  XEmacs hacker light.  Maintainer of the
RPM package.

See:\t")
     (about-url-link 'stigb "Visit Stig's home page"))
    (baw
     (widget-insert
	"\
Author of CC Mode, for C, C++, Objective-C and Java editing, and
Supercite for mail and news citing.  Also various and sundry other
Emacs utilities, fixes, enhancements and kludgery as whimsy, boredom,
and ToT dictate (but not necessarily in that order).  See also:\n\n\t")
     (about-url-link 'baw "Visit Barry's home page")
     (widget-insert "\n\nand:\n\n\t")
     (about-url-link 'cc-mode "Visit the CC Mode distribution")
     (widget-insert "\n
Daddy
\(C) 1994 Warsaw
===============
Drive me Daddy, drive me quick
Push my pedal, shift my stick
Fill me up with golden gas
My rubber squeals, I go real fast

Milk me Daddy, milk me now
Milk me like a big ol' cow
I've got milk inside my udder
Churn it up and make some butter\n"))
    (piper
     (widget-insert "\
Author of the original \"fake\" XEmacs toolbar, outl-mouse for mouse
gesture based outlining, the original CDE drag-n-drop support, the
cygwin port of XEmacs including unexec, glyphs under MS-Windows,
toolbars under MS-Windows. My home page is here:\n")
     (about-url-link 'piper "Visit andy's home page")
     (widget-insert "\n
Andy has recently rejoined the XEmacs team to help port XEmacs to
MS Windows operating systems.\n"))
    (bw
     (widget-insert "\
Author of the Hyperbole everyday information management hypertext
system and the OO-Browser multi-language code browser.  He also
designed the BeOpen InfoDock integrated development environment
for software engineers.  It runs atop XEmacs and is available from
his firm, BeOpen, which offers distributions, custom development,
support, and training packages for corporate users of XEmacs, GNU
Emacs and InfoDock.  See ")
     (about-url-link 'beopen "Visit BeOpen WWW page")
     (widget-insert ".

His interests include user interfaces, information management,
CASE tools, communications and enterprise integration.\n"))
    (wmperry
     (widget-insert "\
Author of Emacs-w3, the builtin web browser that comes with XEmacs,
and various additions to the C code (e.g. the database support, the
PNG support, some of the GIF/JPEG support, the strikethru face
attribute support).

He is currently working at Aventail, Corp. on SOCKS v5 servers.\n"))
    (kyle
     (widget-insert "\
Author of VM, a mail-reading package that is included in the standard
XEmacs distribution, and contributor of many improvements and bug
fixes.  Unlike RMAIL and MH-E, VM uses the standard UNIX mailbox
format for its folders; thus, you can use VM concurrently with other
UNIX mail readers such as Berkeley Mail and ELM.  See\n")
     (about-url-link 'kyle "Visit Kyle's Home page")
     (widget-insert ".\n"))
    (larsi
     (widget-insert "\
Author of Gnus the Usenet news and Mail reading package in the
standard XEmacs distribution, and contributor of various enhancements
and portability fixes.  Lars is a student at the Institute of
Informatics at the University of Oslo.  He is currently plumbing away
at his majors work at the Institute of Physics, working on an SCI
project connected with CASCADE and CERN and stuff.

See ")
     (about-url-link 'larsi "Visit the Larsissistic pages")
     (widget-insert ".\n"))
    (marcpa
     (widget-insert "\
I work for Positron Industries Inc., Public Safety Division.
I'm part of the team producing POWER 911, a 911 emergency response
system written in Modula3:\n")
     (about-url-link 'marcpa "Visit POWER 911")
     (widget-insert "\
\n\nPreviously, I worked at Softimage Inc., now a Microsoft company
\(eeekkk!), as a UNIX system administrator.  This is where I've been
converted to NT.

In a previous life, I was a programmer/sysadmin at CRIM (Centre de
Recherche Informatique de Montreal) for the speech recognition group.\n"))
    (jens
     (widget-insert "\
Jens did the artwork for graphics added to XEmacs 20.2 and 19.15.

I'm currently working at the University of Karlsruhe, Germany on
getting my diploma thesis on Supersymmetry (uuh, that's physics) done.
After that (and all the remaining exams) I'm looking forward to make a
living out of my hobbies -- computers (and graphics). But because I
have no deadline for the exams and XEmacs betas are released at a high
rate this may take some time...\n"))
    (jareth
     (widget-insert "\
Jareth Hein is a mountain boy who abandoned his home state of Colorado
for the perpetual state of chaos known as Tokyo in a failed attempt to
become a cel-animator, and a more successful one to become a
computer-game programmer. As he happens to be bilingual (guess which
two?) he's been doing quite a bit of MULE hacking. He's also getting
his hands dirty in the graphics areas as well.\n"))
    (morioka
     (widget-insert "\
I am the author of tm-view (general MIME Viewer for GNU Emacs) and
major author and maintainer of tm (Tools for MIME; general MIME
package for GNU Emacs).  In addition, I am working to unify MULE API
for Emacs and XEmacs.  In XEmacs, I have ported many mule features.

I am a doctoral student at School of Information Science of JAIST
\(Japan Advanced Institute of Science and Technology, Hokuriku).  I'm
interested in Natural Language, Affordance and writing systems.\n"))
    (dmoore
     (widget-insert "\
David has contributed greatly to the quest to speed up XEmacs.  He is
a student in the Computer Systems Laboratory at UCSD.  When he manages
to have free time, he usually spends it on 200 mile bicycle rides,
learning german or showing people the best mail & news environment
he's found in 10 years.  (That'd be XEmacs, Gnus and bbdb, of course.)
He can be found at `druidmuck.egbt.org 4201' at various hours of the
day.

He has a page at ")
     (about-url-link 'dmoore "Visit David's home page")
     (widget-insert ".\n"))
    (thiessel
     (widget-insert "\
                      All of the buildings,
                      all of the cars
                      were once just a dream
                      in somebody's head.\n
                                     P. Gabriel\n\n
")
     (widget-insert "\n"))
    (sperber
     (widget-insert "\
Mike ported EFS to XEmacs 20 and integrated EFS into XEmacs.  He's
also responsible for the ports of facemenu.el and enriched.el.  When
Mike isn't busy putting together patches for free software he has just
installed or changing his hairstyle, he does research in modern
programming languages and their implementation, and hopes that one day
XEmacs will speak Scheme.\n"))
    (vin
     (widget-insert "\
Vin maintains the XEmacs patch pages in order to bring a more
stable XEmacs.  (Actually, he does it 'cause it's fun and he's been
using emacs for a long, long time.)  Vin also contributed the detached
minibuffer code as well as a few minor enhancements to the menubar
options.

I own and operate my own consulting firm, EtherSoft.  Shhh, don't
tell anyone, but it's named after an Ultimate team I used to play
with in Austin, Texas - the Ether Bunnies.  I'm getting too old
to play competitive Ultimate any more, so now I've gotten roped
into serving on the board of directors of the Ultimate Players
Association.  See ")
     (about-url-link 'vin "Visit the UPA homepage")
     (widget-insert ".\n"))
    (ajc
     (widget-insert "\
When not helping maintain the XEmacs website, Andrew is a Network
Software Engineer(tm) for Monash University in Australia, maintaining
webservers and doing random other things.  As well as spending spare
time being an Eager Young Space Cadet and fiddling with XEmacs/Gnus
et. al., he spends his time pursuing, among other things, a Life.
Some of this currently involves doing an A-Z (by country) of
restaurants with friends, and has, in the past, involved dyeing his
hair various colours (see ")
     (about-url-link 'ajc "Visit Andrew's home page")
     (widget-insert ".\n"))
    (rickc
     (widget-insert "\
The hacker formerly known as Rick Busdiecker develops and maintains
libraries for financial applications at Lehman Brothers during
daylight hours.  In the evenings he maintains three children, and
when he ought to be sleeping he co-maintains ILISP, builds XEmacs
betas, and tinkers with various personal hacking projects..\n"))
    (kazz
     (widget-insert "\
Kazz is the XEmacs lead on BSD (especially FreeBSD).
His main workspace is, probably, the latest stable version of
FreeBSD and it makes him comfortable and not.
His *mission* is to make XEmacs runs on FreeBSD without
any problem.

In real life, he is working on a PDM product based on CORBA,
and doing consultation, design and implemention.
He loves to play soccer, yes football!
See also:")
     (about-url-link 'kazz "Visit Kazz's home page")
     (widget-insert ".\n"))
    (dkindred
     (widget-insert "\
Darrell tends to come out of the woodwork a couple of weeks
before a new release with a flurry of fixes for bugs that
annoy him.  He hopes he's spared you from a core dump or two.

Darrell is currently a doctoral student in computer science at
Carnegie Mellon University, but he's trying hard to kick that
habit.

See ")
     (about-url-link 'dkindred "Visit Darrell's WWW page")
     (widget-insert ".\n"))
    (pez
     (widget-insert "\
Author of SQL Mode, edit-toolbar, mailtool-mode, and various other
small packages with varying degrees of usefulness.  Peter has
recently left Wall Street to start Daedalus World Wide Corporation,
a software development firm.  See ")
     (about-url-link 'pez "Daedalus on the web")
     (widget-insert ".\n"))
    (dv
     (widget-insert "\
I'm currently working (Ph.D.) on the cognitive aspects of
Human-Machine Interaction in Virtual Environments, and especialy on
the possibility of adding (artificial) intelligence between the system
and the operator, in order to detect the intentions of the latter.

Otherwise, I'm, say, 35.82% professional Jazz guitar player,
which means that's not the way I earn my crust, but things may very
well reverse in the future ...\n"))
    (rossini
     (widget-insert "\
Author of the first XEmacs FAQ, as well as minor priest in the
movement to get every statistician in the world to use XEmacs for
statistical programming and data analysis.  Current development lead
for ESS (Emacs Speaks Statistics), a mode and inferior mode for
statistical programming and data analysis for SAS, S, S-PLUS, R,
XLispStat; configurable for nearly any other statistical
language/package one might want.  In spare time, acts as a
Ph.D. (bio)statistician for money and amusement.  Current position:
Assistant Professor of Statistics at the University of South Carolina.\n"))
    (ograf
     (widget-insert "\
I'm a student of computer sciences at the University of Koblenz. My
major is computational linguistics (human language generation and
analysis).

I make my living as a managing director of a small but fine company
which I started two years ago with one of my friends. We provide
business network solutions based on linux servers and various other
networking products.

Most of my spare time I spent on the development of the XEmacs
Drag'n'Drop API, a enhanced version of Tk called TkStep (better looks,
also Drag'n'Drop, and more), and various other hacks: ISDN-tools,
cd players, python, etc...

To see some of these have a look at ")
     (about-url-link 'ograf "one of my homepages")
     (widget-insert ".\n"))
    (juhp
     (widget-insert "\
I started using XEmacs-20 as my work-environment in June 1997.  I
became a beta developer shortly after that (\"it seems like a good
idea at the time...\" :-), so far contributing mainly bug fixes,
\"find-func.el\" and improvements to \"help.el\".

My current dreams for XEmacs: move to using guile as the Lisp engine
and gtk as the default X toolkit.

I have been a postdoctoral researcher at the Research Institute for
Mathematical Sciences, Kyoto University, since August 1994, doing
research in mathematical physics (representation theory of quantum
groups).  Though now I seem to be heading for other things.

My homepage is ")
     (about-url-link 'juhp "Visit Jens' homepage")
     (widget-insert ".\n"))
    (jason
     (widget-insert "\
Beta tester, manager of the various XEmacs mailing lists and
binary kit manager.  Also, originator and maintainer of the gnus.org
domain.

Jason resides in Albuquerque, New Mexico where he keeps himself
busy with studies at the university and consulting work.

See: ")
      (about-url-link 'jason "Visit Jason's homepage")
      (widget-insert ".\n"))
    (jmiller
     (widget-insert "\
Jeff grew up in Indiana and is a country boy at heart.  He currently lives
in, of all places, Millersville Maryland.  He spends a lot of his free
time tinkering with Linux and hacking on XEmacs and loves it when he finds
new cool features in either.  When he's not doing that, he enjoys downhill
skiing, puzzles, and sci-fi.  Jeff is also really interested in classical
Roman history and enjoys making trips to Italy, where he was born, and
seeing the sights")
     (widget-insert ".\n"))
    (chr
     (widget-insert "\
Maintainer of the XEmacs FAQ and proud author of `zap-up-to-char'.

Christian is a student at the Norwegian School of Economics and
Business Administration in Bergen, Norway.  He used to work for an
internet startup called New Media Science, doing scripting and
violation of HTML DTD's.  After graduation, spring 1999, he'll be
looking for a job involving lisp programming, French and Russian.")
     (widget-insert ".\n"))
))

;; Setup the buffer for a maintainer.
(defun about-maintainer (widget &optional event)
  (let* ((entry (assq (widget-value widget) xemacs-hackers))
	 (who (car entry))
	 (name (cadr entry))
	 (address (caddr entry))
	 (bufname (format "*About %s*" name)))
    (unless (about-get-buffer bufname)
      ;; Display the glyph and name
      (widget-insert "\n")
      (widget-create 'default :format "%t"
		     :tag-glyph (about-maintainer-glyph who))
      (widget-insert
       "  " (about-with-face (format "%s" name) 'bold)
       " <" address ">\n\n")
      ;; Display the actual info
      (about-maintainer-info entry)
      (widget-insert "\n")
      (about-finish-buffer 'kill)
      (forward-line 2))))

(defsubst about-tabs (str)
  (let ((x (length str)))
    (cond ((>= x 24) " ")
	  ((>= x 16) "\t")
	  ((>= x 8) "\t\t")
	  (t "\t\t\t"))))

(defun about-show-linked-info (who shortinfo)
  (let* ((entry (assq who xemacs-hackers))
	 (name (cadr entry))
	 (address (caddr entry)))
    (widget-create 'link :help-echo (concat "Find out more about " name)
		   :action 'about-maintainer
		   :button-prefix ""
		   :button-suffix ""
		   :tag name
		   :value who)
    (widget-insert (about-tabs name)
		   (format "<%s>\n%s\n" address shortinfo))))

(defun about-hackers (&rest ignore)
  (unless (about-get-buffer "*About Contributors*")
    (let ((title "Other Contributors to XEmacs"))
      (widget-insert
       (about-center title)
       (about-with-face title 'bold)))
    (widget-insert
     "\n
Like most free software, XEmacs is a collaborative effort.  These are
some of the contributors.  We have no doubt forgotten someone; we
apologize!  You can see some of our faces under the links.\n\n")
    (about-show-linked-info 'vladimir "\
Former technical lead for XEmacs at Sun Microsystems.  He is now with
Microtec Research Inc., working on embedded systems development tools.\n")
    (about-show-linked-info 'stig "\
Peripatetic uninominal Emacs hacker.  Stig sometimes operates out of a
big white van set up for nomadic living and hacking.  Implemented the
faster stay-up Lucid menus and hyper-apropos.  Contributor of many
dispersed improvements in the core Lisp code, and back-seat
contributor for several of its major packages.\n")
    (about-show-linked-info 'baw "\
Author of CC Mode for C, C++, Objective-C and Java editing, and
Supercite for mail and news citing.  Also various and sundry other
Emacs utilities, fixes, enhancements and kludgery as whimsy, boredom,
and ToT dictate (but not necessarily in that order).\n")
    (about-show-linked-info 'piper "\
Created the prototype for the toolbars.  Has been the first to make
use of many of the new XEmacs graphics features. Has implemented many
of XEmacs' graphics features under MS-Windows and has ported XEmacs
to cygwin under MS-Windows.\n")
    (about-show-linked-info 'bw "\
Author of the Hyperbole everyday information management hypertext
system and the OO-Browser multi-language code browser.  He also
designed the BeOpen InfoDock integrated development environment
for software engineers.  It runs atop XEmacs and is available from
his firm, BeOpen, which offers custom development and support packages
for corporate users of XEmacs, GNU Emacs and InfoDock.  His interests
include user interfaces, information management, CASE tools,
communications and enterprise integration.\n")
    (about-show-linked-info 'wmperry "\
Author of Emacs-w3, the builtin web browser that comes with XEmacs,
and various additions to the C code (e.g. the database support, the
PNG support, some of the GIF/JPEG support, the strikethru face
attribute support).\n")
    (about-show-linked-info 'kyle "\
Author of VM, a mail-reading package that is included in the standard
XEmacs distribution, and contributor of many improvements and bug
fixes.  Unlike RMAIL and MH-E, VM uses the standard UNIX mailbox
format for its folders; thus, you can use VM concurrently with other
UNIX mail readers such as Berkeley Mail and ELM.\n")
    (about-show-linked-info 'larsi "\
Author of Gnus the Usenet news and Mail reading package in the
standard XEmacs distribution, and contributor of various enhancements
and portability fixes.  Lars is a student at the Institute of
Informatics at the University of Oslo.  He is currently plumbing away
at his majors work at the Institute of Physics, working on an SCI
project connected with CASCADE and CERN and stuff.\n")
    (about-show-linked-info 'jens "\
I'm currently working at the University of Karlsruhe, Germany on
getting my diploma thesis on Supersymmetry (uuh, that's physics) done.
After that (and all the remaining exams) I'm looking forward to make a
living out of my hobbies -- computers (and graphics). But because I
have no deadline for the exams and XEmacs betas are released at a high
rate this may take some time...\n")
    (about-show-linked-info 'jareth "\
Jareth Hein is a mountain boy who abandoned his home state of Colorado
for the perpetual state of chaos known as Tokyo in a failed attempt to
become a cel-animator, and a more successful one to become a
computer-game programmer. As he happens to be bilingual (guess which
two?) he's been doing quite a bit of MULE hacking. He's also getting
his hands dirty in the graphics areas as well.\n")
    (about-show-linked-info 'morioka "\
I am the author of tm-view (general MIME Viewer for GNU Emacs) and
major author and maintainer of tm (Tools for MIME; general MIME
package for GNU Emacs).  In addition, I am working to unify MULE API
for Emacs and XEmacs.  In XEmacs, I have ported many mule features.

I am a doctoral student at School of Information Science of JAIST
\(Japan Advanced Institute of Science and Technology, Hokuriku).  I'm
interested in Natural Language, Affordance and writing systems.\n")
    (about-show-linked-info 'dmoore "\
David has contributed greatly to the quest to speed up XEmacs.  He is
a student in the Computer Systems Laboratory at UCSD.  When he manages
to have free time, he usually spends it on 200 mile bicycle rides,
learning german or showing people the best mail & news environment
he's found in 10 years.  (That'd be XEmacs, Gnus and bbdb, of course.)
He can be found at `druidmuck.egbt.org 4201' at various hours of the
day.\n")
    (about-show-linked-info 'sperber "\
Mike ported EFS to XEmacs 20 and integrated EFS into XEmacs.  He's
also responsible for the ports of facemenu.el and enriched.el.  When
Mike isn't busy putting together patches for free software he has just
installed or changing his hairstyle, he does research in modern
programming languages and their implementation, and hopes that one day
XEmacs will speak Scheme.\n")
    (about-show-linked-info 'vin "\
Vin helps maintain the older, more mature (read: moldy) versions of
XEmacs.  Vin has maintained the official XEmacs patch pages.\n")
    (about-show-linked-info 'thiessel "\
Worked at University of Kaiserslautern where he took part in the 
development and design of a CAD framework for analog integrated
circuits with special emphasis on distributed software concepts. He 
has now joined HP as technical consultant.  

For XEmacs he does beta testing and tries to take care of XEmacs
website at <http://www.xemacs.org>.\n")
    (about-show-linked-info 'ajc "\
When not helping maintain the XEmacs website, Andrew is a Network
Software Engineer(tm) for Monash University in Australia, maintaining
webservers and doing random other things.  As well as spending spare
time being an Eager Young Space Cadet and fiddling with XEmacs/Gnus
et. al., he spends his time pursuing, among other things, a Life.
Some of this currently involves doing an A-Z (by country) of
restaurants with friends, and has, in the past, involved dyeing his
hair various colours.\n")
    (about-show-linked-info 'kazz "\
IENAGA Kazuyuki is the XEmacs technical lead on BSD, particularly
FreeBSD.\n")
    (about-show-linked-info 'dkindred "\
Darrell tends to come out of the woodwork a couple of weeks
before a new release with a flurry of fixes for bugs that
annoy him.  He hopes he's spared you from a core dump or two.

Darrell is currently a doctoral student in computer science at
Carnegie Mellon University, but he's trying hard to kick that
habit.\n")
    (about-show-linked-info 'dv "\
I'm currently working (Ph.D.) on the cognitive aspects of
Human-Machine Interaction in Virtual Environments, and especialy on
the possibility of adding (artificial) intelligence between the system
and the operator, in order to detect the intentions of the latter.

Otherwise, I'm, say, 35.82% professional Jazz guitar player,
which means that's not the way I earn my crust, but things may very
well reverse in the future ...\n")
    (about-show-linked-info 'marcpa "\
I work for Positron Industries Inc., Public Safety Division.\n")
    (about-show-linked-info 'pez "\
Author of SQL Mode, edit-toolbar, mailtool-mode, and various other
small packages with varying degrees of usefulness.\n")
    (about-show-linked-info 'rickc "\
The hacker formerly known as Rick Busdiecker, maintainer of ILISP.\n")
    (about-show-linked-info 'rossini "\
Author of the first XEmacs FAQ, as well as minor priest in the
movement to get every statistician in the world to use XEmacs for
statistical programming and data analysis.  Current development lead
for ESS (Emacs Speaks Statistics), a mode and inferior mode for
statistical programming and data analysis for SAS, S, S-PLUS, R,
XLispStat; configurable for nearly any other statistical
language/package one might want.  In spare time, acts as a
Ph.D. (bio)statistician for money and amusement.  Current position:
Assistant Professor of Statistics at the University of South Carolina.\n")
    (about-show-linked-info 'stigb "\
Currently studying computer science in Trondheim, Norway.  Full time
Linux user and proud of it.  XEmacs hacker light.  Maintainer of the
RPM package.\n")
    (about-show-linked-info 'ograf "\
Author of the XEmacs Drag'n'Drop API.\n")
    (about-show-linked-info 'juhp "\
Author of \"find-func.el\".\n")
    (about-show-linked-info 'jason "\
Beta tester and manager of the various XEmacs mailing lists.
Originator and maintainer of the gnus.org domain.\n")
    (about-show-linked-info 'jmiller "\
Beta tester and last hacker of calendar.\n")
    (about-show-linked-info 'chr "\
Maintainer of the XEmacs FAQ and proud author of `zap-up-to-char'.\n")
    (flet ((print-short (name addr &optional shortinfo)
	     (concat (about-with-face name 'italic)
		     (about-tabs name)
		     "<" addr ">\n"
		     (if shortinfo (concat shortinfo "\n") ""))))
      (widget-insert
       (print-short "Eduardo Pelegri-Llopart" "pelegri@eng.sun.com" "\
Author of EOS, a package included in the standard XEmacs distribution
that integrates XEmacs with the SPARCworks development environment
from Sun.  Past lead for XEmacs at Sun; advocated the validity of
using Epoch, and later Lemacs, at Sun through several early
prototypes.\n")
       (print-short "Matthieu Devin" "devin@rs.com" "\
Part of the original (pre-19.0) Lucid Emacs development team.
Matthieu wrote the initial Energize interface, designed the
toolkit-independent Lucid Widget library, and fixed enough redisplay
bugs to last a lifetime.  The features in Lucid Emacs were largely
inspired by Matthieu's initial prototype of an Energize interface
using Epoch.\n")
       (print-short "Harlan Sexton" "hbs@odi.com" "\
Part of the original (pre-19.0) Lucid Emacs development team.  Harlan
designed and implemented many of the low level data structures which
are original to the Lucid version of Emacs, including extents and hash
tables.\n")
       (print-short "Eric Benson" "eb@kaleida.com" "\
Also part of the original Lucid Emacs development team.  Eric played a
big part in the design of many aspects of the system, including the
new command loop and keymaps, fixed numerous bugs, and has been a
reliable beta tester ever since.\n")
       (print-short "John Rose" "john.rose@sun.com" "\
Author of many extensions to the `extents' code, including the initial
implementation of `duplicable' properties.\n")
       (print-short "Hans Muller" "hmuller@eng.sun.com" "\
Author of the code used to connect XEmacs with ToolTalk, and of an
early client of the external Emacs widget.\n")
       (print-short "David hobley" "david.hobley@usa.net" "\
I used to do real work, but now I am a Project Manager for one of the
Telco's in Australia. In my spare time I like to get back to basics and
muck around with things. As a result I started the NT port. Hopefully I
will get to finish it sometime sooner rather than later. I do vaguely
remember University where it seems like I had more spare time that I can
believe now. Oh well, such is life.\n")
       (print-short "Jonathan Harris" "jhar@tardis.ed.ac.uk" "\
Manages the team responsible for the EPOC kernel at Symbian Ltd. Started
the mswindows native-GUI port of XEmacs because he felt lost using
Microsoft Windows without a real editor.\n")
       (print-short "Michael R. Cook" "mcook@cognex.com" "\
Author of the \"shy groups\" and minimal matching regular expression
extensions.\n")
       (print-short "Darryl Okahata" "darrylo@sr.hp.com" "\
Perennial Emacs hacker since 1986 or so, when he first started on GNU
Emacs 17.something.  Over the years, he's developed \"OEmacs\", the first
version of GNU Emacs 19 for MSDOS, and \"bigperl\", a 32-bit version of
Perl4 for MSDOS.  In recent years, reality has intruded and he no longer 
has much time for playing with cool programs.  What little time he has
now goes to XEmacs hacking, where he's worked on speeding up dired under 
MS Windows, and to feeding his two cats.\n")
       "\n\
In addition to those just mentioned, the following people have spent a
great deal of effort providing feedback, testing beta versions of
XEmacs, providing patches to the source code, or doing all of the
above.  We couldn't have done it without them.\n\n"
       (print-short "Nagi M. Aboulenein" "aboulene@ponder.csci.unt.edu")
       (print-short "Per Abrahamsen" "abraham@dina.kvl.dk")
       (print-short "Gary Adams" "gra@zeppo.East.Sun.COM")
       (print-short "Gennady Agranov" "agranov@csa.CS.Technion.Ac.IL")
       (print-short "Adrian Aichner" "aichner@ecf.teradyne.com")
       (print-short "Mark Allender" "allender@vnet.IBM.COM")
       (print-short "Stephen R. Anderson" "sra@bloch.ling.yale.edu")
       (print-short "Butch Anton" "butch@zaphod.uchicago.edu")
       (print-short "Fred Appelman" "Fred.Appelman@cv.ruu.nl")
       (print-short "Erik \"The Pope\" Arneson" "lazarus@mind.net")
       (print-short "Tor Arntsen" "tor@spacetec.no")
       (print-short "Marc Aurel" "4-tea-2@bong.saar.de")
       (print-short "Larry Auton" "lda@control.att.com")
       (print-short "Larry Ayers" "layers@marktwain.net")
       (print-short "Oswald P. Backus IV" "backus@altagroup.com")
       (print-short "Mike Battaglia" "mbattagl@dsccc.com")
       (print-short "Neal Becker" "neal@ctd.comsat.com")
       (print-short "Paul Bibilo" "peb@delcam.com")
       (print-short "Leonard Blanks" "ltb@haruspex.demon.co.uk")
       (print-short "Jan Borchers" "job@tk.uni-linz.ac.at")
       (print-short "Mark Borges" "mdb@cdc.noaa.gov")
       (print-short "David P. Boswell" "daveb@tau.space.thiokol.com")
       (print-short "Tim Bradshaw" "tfb@edinburgh.ac.uk")
       (print-short "Rick Braumoeller" "rickb@mti.sgi.com")
       (print-short "Matthew J. Brown" "mjb@doc.ic.ac.uk")
       (print-short "Alastair Burt" "burt@dfki.uni-kl.de")
       (print-short "David Bush" "david.bush@adn.alcatel.com")
       (print-short "Richard Caley" "rjc@cstr.edinburgh.ac.uk")
       (print-short "Stephen Carney" "carney@gvc.dec.com")
       (print-short "Lorenzo M. Catucci" "lorenzo@argon.roma2.infn.it")
       (print-short "Philippe Charton" "charton@lmd.ens.fr")
       (print-short "Peter Cheng" "peter.cheng@sun.com")
       (print-short "Jin S. Choi" "jin@atype.com")
       (print-short "Tomasz J. Cholewo" "tjchol01@mecca.spd.louisville.edu")
       (print-short "Serenella Ciongoli" "czs00@ladybug.oes.amdahl.com")
       (print-short "Glynn Clements" "glynn@sensei.co.uk")
       (print-short "Richard Cognot" "cognot@ensg.u-nancy.fr")
       (print-short "Andy Cohen" "cohen@andy.bu.edu")
       (print-short "Richard Coleman" "coleman@math.gatech.edu")
       (print-short "Mauro Condarelli" "MC5686@mclink.it")
       (print-short "Andrew J Cosgriff" "ajc@bing.wattle.id.au")
       (print-short "Nick J. Crabtree" "nickc@scopic.com")
       (print-short "Christopher Davis" "ckd@kei.com")
       (print-short "Soren Dayton" "csdayton@cs.uchicago.edu")
       (print-short "Chris Dean" "ctdean@cogit.com")
       (print-short "Michael Diers" "mdiers@logware.de")
       (print-short "William G. Dubuque" "wgd@martigny.ai.mit.edu")
       (print-short "Steve Dunham" "dunham@dunham.tcimet.net")
       (print-short "Samuel J. Eaton" "samuele@cogs.susx.ac.uk")
       (print-short "Carl Edman" "cedman@Princeton.EDU")
       (print-short "Dave Edmondson" "davided@sco.com")
       (print-short "Jonathan Edwards" "edwards@intranet.com")
       (print-short "Eric Eide" "eeide@asylum.cs.utah.edu")
       (print-short "EKR" "ekr@terisa.com")
       (print-short "Gunnar Evermann" "Gunnar.Evermann@nats.informatik.uni-hamburg.de")
       (print-short "Oscar Figueiredo" "Oscar.Figueiredo@di.epfl.ch")
       (print-short "David Fletcher" "frodo@tsunami.com")
       (print-short "Paul Flinders" "ptf@delcam.co.uk")
       (print-short "Jered J Floyd" "jered@mit.edu")
       (print-short "Gary D. Foster" "Gary.Foster@Corp.Sun.COM")
       (print-short "Jerry Frain" "jerry@sneffels.tivoli.com")
       (print-short "Holger Franz" "hfranz@physik.rwth-aachen.de")
       (print-short "Benjamin Fried" "bf@morgan.com")
       (print-short "Barry Friedman" "friedman@nortel.ca")
       (print-short "Noah Friedman" "friedman@splode.com")
       (print-short "Kazuyoshi Furutaka" "furutaka@Flux.tokai.jaeri.go.jp")
       (print-short "Lew Gaiter III" "lew@StarFire.com")
       (print-short "Olivier Galibert" "Olivier.Galibert@mines.u-nancy.fr")
       (print-short "Itay Gat" "itay@cs.huji.ac.il")
       (print-short "Tim Geisler" "Tim.Geisler@informatik.uni-muenchen.de")
       (print-short "Dave Gillespie" "daveg@synaptics.com")
       (print-short "Christian F. Goetze" "cg@bigbook.com")
       (print-short "Yusuf Goolamabbas" "yusufg@iss.nus.sg")
       (print-short "Wolfgang Grieskamp" "wg@cs.tu-berlin.de")
       (print-short "John Griffith" "griffith@sfs.nphil.uni-tuebingen.de")
       (print-short "James Grinter" "jrg@demon.net")
       (print-short "Ben Gross" "bgross@uiuc.edu")
       (print-short "Dirk Grunwald" "grunwald@foobar.cs.Colorado.EDU")
       (print-short "Michael Guenther" "michaelg@igor.stuttgart.netsurf.de")
       (print-short "Dipankar Gupta" "dg@hplb.hpl.hp.com")
       (print-short "Markus Gutschke" "gutschk@GOEDEL.UNI-MUENSTER.DE")
       (print-short "Kai Haberzettl" "khaberz@synnet.de")
       (print-short "Adam Hammer" "hammer@cs.purdue.edu")
       (print-short "Magnus Hammerin" "magnush@epact.se")
       (print-short "ChangGil Han" "cghan@phys401.phys.pusan.ac.kr")
       (print-short "Derek Harding" "dharding@lssec.bt.co.uk")
       (print-short "Michael Harnois" "mharnois@sbt.net")
       (print-short "John Haxby" "J.Haxby@isode.com")
       (print-short "Karl M. Hegbloom" "karlheg@inetarena.com")
       (print-short "Benedikt Heinen" "beh@icemark.thenet.ch")
       (print-short "Stephan Herrmann" "sh@first.gmd.de")
       (print-short "August Hill" "awhill@inlink.com")
       (print-short "Mike Hill" "mikehill@hgeng.com")
       (print-short "Charles Hines" "chuck_hines@VNET.IBM.COM")
       (print-short "Shane Holder" "holder@rsn.hp.com")
       (print-short "Chris Holt" "xris@migraine.stanford.edu")
       (print-short "Tetsuya HOYANO" "hoyano@ari.bekkoame.or.jp")
       (print-short "David Hughes" "djh@harston.cv.com")
       (print-short "Tudor Hulubei" "tudor@cs.unh.edu")
       (print-short "Tatsuya Ichikawa" "ichikawa@hv.epson.co.jp")
       (print-short "Andrew Innes" "andrewi@harlequin.co.uk")
       (print-short "Andreas Jaeger" "aj@arthur.rhein-neckar.de")
       (print-short "Markku Jarvinen" "Markku.Jarvinen@simpukka.funet.fi")
       (print-short "Robin Jeffries" "robin.jeffries@sun.com")
       (print-short "Philip Johnson" "johnson@uhics.ics.Hawaii.Edu")
       (print-short "J. Kean Johnston" "jkj@paradigm-sa.com")
       (print-short "John W. Jones" "jj@asu.edu")
       (print-short "Andreas Kaempf" "andreas@sccon.com")
       (print-short "Yoshiaki Kasahara" "kasahara@nc.kyushu-u.ac.jp")
       (print-short "Kirill M. Katsnelson" "kkm@kis.ru")
       (print-short "Amir Katz" "amir@ndsoft.com")
       (print-short "Doug Keller" "dkeller@vnet.ibm.com")
       (print-short "Hunter Kelly" "retnuh@corona")
       (print-short "Gregor Kennedy" "gregork@dadd.ti.com")
       (print-short "Michael Kifer" "kifer@cs.sunysb.edu")
       (print-short "Yasuhiko Kiuchi" "kiuchi@dsp.ksp.fujixerox.co.jp")
       (print-short "Greg Klanderman" "greg.klanderman@alum.mit.edu")
       (print-short "Valdis Kletnieks" "Valdis.Kletnieks@vt.edu")
       (print-short "Norbert Koch" "n.koch@delta-ii.de")
       (print-short "Rob Kooper" "kooper@cc.gatech.edu")
       (print-short "Peter Skov Knudsen" "knu@dde.dk")
       (print-short "Jens Krinke" "krinke@ips.cs.tu-bs.de")
       (print-short "Maximilien Lincourt" "max@toonboom.com")
       (print-short "Mats Larsson" "Mats.Larsson@uab.ericsson.se")
       (print-short "Simon Leinen" "simon@instrumatic.ch")
       (print-short "Carsten Leonhardt" "leo@arioch.oche.de")
       (print-short "James LewisMoss" "moss@cs.sc.edu")
       (print-short "Mats Lidell" "mats.lidell@contactor.se")
       (print-short "Matt Liggett" "mliggett@seven.ucs.indiana.edu")
       (print-short "Christian Limpach" "Christian.Limpach@nice.ch")
       (print-short "Maximilien Lincourt" "max@toonboom.com")
       (print-short "Markus Linnala" "maage@b14b.tupsu.ton.tut.fi")
       (print-short "Robert Lipe" "robertl@arnet.com")
       (print-short "Derrell Lipman" "derrell@vis-av.com")
       (print-short "Damon Lipparelli" "lipp@aa.net")
       (print-short "Hamish Macdonald" "hamish@bnr.ca")
       (print-short "Ian MacKinnon" "imackinnon@telia.co.uk")
       (print-short "Patrick MacRoberts" "macro@hpcobr30.cup.hp.com")
       (print-short "Tonny Madsen" "Tonny.Madsen@netman.dk")
       (print-short "Ketil Z Malde" "ketil@ii.uib.no")
       (print-short "Steve March" "smarch@quaver.urbana.mcd.mot.com")
       (print-short "Ricardo Marek" "ricky@ornet.co.il")
       (print-short "Pekka Marjola" "pema@iki.fi")
       (print-short "Simon Marshall" "simon@gnu.ai.mit.edu")
       (print-short "Dave Mason" "dmason@plg.uwaterloo.ca")
       (print-short "Jaye Mathisen" "mrcpu@cdsnet.net")
       (print-short "Jason McLaren" "mclaren@math.mcgill.ca")
       (print-short "Michael McNamara" "mac@silicon-sorcery.com")
       (print-short "Michael Meissner" "meissner@osf.org")
       (print-short "David M. Meyer" "meyer@ns.uoregon.edu")
       (print-short "John Mignault" "jbm@panix.com")
       (print-short "Brad Miller" "bmiller@cs.umn.edu")
       (print-short "John Morey" "jmorey@crl.com")
       (print-short "Rob Mori" "rob.mori@sun.com")
       (print-short "Heiko Muenkel" "muenkel@tnt.uni-hannover.de")
       (print-short "Arup Mukherjee" "arup+@cs.cmu.edu")
       (print-short "Colas Nahaboo" "Colas.Nahaboo@sophia.inria.fr")
       (print-short "Lynn D. Newton" "lynn@ives.phx.mcd.mot.com")
       (print-short "Casey Nielson" "knielson@joule.elee.calpoly.edu")
       (print-short "Georg Nikodym" "Georg.Nikodym@canada.sun.com")
       (print-short "Andy Norman" "ange@hplb.hpl.hp.com")
       (print-short "Joe Nuspl" "nuspl@sequent.com")
       (print-short "Kim Nyberg" "kny@tekla.fi")
       (print-short "Kevin Oberman" "oberman@es.net")
       (print-short "David Ofelt" "ofelt@getalife.Stanford.EDU")
       (print-short "Alexandre Oliva" "oliva@dcc.unicamp.br")
       (print-short "Tore Olsen" "toreo@colargol.idb.hist.no")
       (print-short "Greg Onufer" "Greg.Onufer@eng.sun.com")
       (print-short "Achim Oppelt" "aoppelt@theorie3.physik.uni-erlangen.de")
       (print-short "Rebecca Ore" "rebecca.ore@op.net")
       (print-short "Sudeep Kumar Palat" "palat@idt.unit.no")
       (print-short "Joel Peterson" "tarzan@aosi.com")
       (print-short "Thomas A. Peterson" "tap@src.honeywell.com")
       (print-short "Tibor Polgar" "tibor@alteon.com")
       (print-short "Fabrice POPINEAU" "popineau@esemetz.ese-metz.fr")
       (print-short "Frederic Poncin" "fp@info.ucl.ac.be")
       (print-short "E. Rehmi Post" "rehmi@asylum.sf.ca.us")
       (print-short "Martin Pottendorfer" "Martin.Pottendorfer@aut.alcatel.at")
       (print-short "Colin Rafferty" "colin@xemacs.org")
       (print-short "Rick Rankin" "Rick_Rankin-P15254@email.mot.com")
       (print-short "Paul M Reilly" "pmr@pajato.com")
       (print-short "Jack Repenning" "jackr@sgi.com")
       (print-short "Daniel Rich" "drich@cisco.com")
       (print-short "Roland Rieke" "rol@darmstadt.gmd.de")
       (print-short "Art Rijos" "art.rijos@SNET.com")
       (print-short "Russell Ritchie" "ritchier@britannia-life.co.uk")
       (print-short "Roland" "rol@darmstadt.gmd.de")
       (print-short "Mike Russell" "mjruss@rchland.vnet.ibm.com")
       (print-short "Hajime Saitou" "hajime@jsk.t.u-tokyo.ac.jp")
       (print-short "Jan Sandquist" "etxquist@iqa.ericsson.se")
       (print-short "Marty Sasaki" "sasaki@spdcc.com")
       (print-short "SATO Daisuke" "densuke@ga2.so-net.or.jp")
       (print-short "Kenji Sato" "ken@ny.kdd.com")
       (print-short "Mike Scheidler" "c23mts@eng.delcoelect.com")
       (print-short "Daniel Schepler" "daniel@shep13.wustl.edu")
       (print-short "Holger Schauer" "schauer@coling.uni-freiburg.de")
       (print-short "Darrel Schneider" "darrel@slc.com")
       (print-short "Hayden Schultz" "haydens@ll.mit.edu")
       (print-short "Cotton Seed" "cottons@cybercom.net")
       (print-short "Axel Seibert" "seiberta@informatik.tu-muenchen.de")
       (print-short "Odd-Magne Sekkingstad" "oddms@ii.uib.no")
       (print-short "Gregory Neil Shapiro" "gshapiro@sendmail.org")
       (print-short "Justin Sheehy" "justin@linus.mitre.org")
       (print-short "John Shen" "zfs60@cas.org")
       (print-short "Murata Shuuichirou" "mrt@mickey.ai.kyutech.ac.jp")
       (print-short "Matt Simmons" "simmonmt@acm.org")
       (print-short "Dinesh Somasekhar" "somasekh@ecn.purdue.edu")
       (print-short "Jeffrey Sparkes" "jsparkes@bnr.ca")
       (print-short "Manoj Srivastava" "srivasta@pilgrim.umass.edu")
       (print-short "Francois Staes" "frans@kiwi.uia.ac.be")
       (print-short "Anders Stenman" "stenman@isy.liu.se")
       (print-short "Jason Stewart" "jasons@cs.unm.edu")
       (print-short "Rick Tait" "rickt@gnu.ai.mit.edu")
       (print-short "TANAKA Hayashi" "tanakah@mxa.mesh.ne.jp")
       (print-short "Samuel Tardieu" "sam@inf.enst.fr")
       (print-short "James Thompson" "thompson@wg2.waii.com")
       (print-short "Nobu Toge" "toge@accad1.kek.jp")
       (print-short "Raymond L. Toy" "toy@rtp.ericsson.se")
       (print-short "Remek Trzaska" "remek@npac.syr.edu")
       (print-short "TSUTOMU Nakamura" "tsutomu@rs.kyoto.omronsoft.co.jp")
       (print-short "Stefanie Teufel" "s.teufel@ndh.net")
       (print-short "Gary Thomas" "g.thomas@opengroup.org")
       (print-short "Stephen Turnbull" "turnbull@sk.tsukuba.ac.jp")
       (print-short "John Turner" "turner@xdiv.lanl.gov")
       (print-short "UENO Fumihiro" "7m2vej@ritp.ye.IHI.CO.JP")
       (print-short "Aki Vehtari" "Aki.Vehtari@hut.fi")
       (print-short "Juan E. Villacis" "jvillaci@cs.indiana.edu")
       (print-short "Jan Vroonhof" "vroonhof@math.ethz.ch")
       (print-short "Vladimir Vukicevic" "vladimir@intrepid.com")
       (print-short "Charles G. Waldman" "cgw@fnal.gov")
       (print-short "David Walte" "djw18@cornell.edu")
       (print-short "Peter Ware" "ware@cis.ohio-state.edu")
       (print-short "Christoph Wedler" "wedler@fmi.uni-passau.de")
       (print-short "Yoav Weiss" "yoav@zeus.datasrv.co.il")
       (print-short "Peter B. West" "p.west@uq.net.au")
       (print-short "Rod Whitby" "rwhitby@asc.corp.mot.com")
       (print-short "Rich Williams" "rdw@hplb.hpl.hp.com")
       (print-short "Raymond Wiker" "raymond@orion.no")
       (print-short "Peter Windle" "peterw@SDL.UG.EDS.COM")
       (print-short "David C Worenklein" "dcw@gcm.com")
       (print-short "Takeshi Yamada" "yamada@sylvie.kecl.ntt.jp")
       (print-short "Katsumi Yamaoka" "yamaoka@ga.sony.co.jp")
       (print-short "Jason Yanowitz" "yanowitz@eternity.cs.umass.edu")
       (print-short "La Monte Yarroll" "piggy@hilbert.maths.utas.edu.au")
       (print-short "Blair Zajac" "blair@olympia.gps.caltech.edu")
       (print-short "Volker Zell" "vzell@de.oracle.com")
       (print-short "Daniel Zivkovic" "daniel@canada.sun.com")
       (print-short "Karel Zuiderveld" "Karel.Zuiderveld@cv.ruu.nl")
       "\n"))
    (about-finish-buffer)))

;;; about.el ends here
