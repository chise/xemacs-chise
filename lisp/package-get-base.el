(setq package-get-base
'((bbdb
  (standards-version 1.0
   version "1.01"
   author-version "2.0"
   date "1998-07-19"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "comm"
   dump nil
   description "The Big Brother Data Base"
   filename "bbdb-1.01-pkg.tar.gz"
   md5sum "95ab2746d9cf3a105cab61eb65ecd64d"
   size 274056
   provides (bbdb)
   requires (bbdb edit-utils gnus mh-e rmail supercite vm tm apel mail-lib xemacs-base)
   type regular
))
(eudc
  (standards-version 1.0
   version "1.22"
   author-version "1.21"
   date "1998-08-22"
   build-date "1998-09-19"
   maintainer "Oscar Figueiredo <Oscar.Figueiredo@epfl.ch>"
   distribution stable
   priority low
   category "comm"
   dump nil
   description "Emacs Unified Directory Client (LDAP, PH)."
   filename "eudc-1.22-pkg.tar.gz"
   md5sum "25cd2405e5adcf796923f206d55cd3d6"
   size 45221
   provides (eudc eudc-ldap eudc-ph)
   requires (fsf-compat xemacs-base)
   type regular
))
(footnote
  (standards-version 1.0
   version "1.06"
   author-version "0.18x"
   date "1998-08-27"
   build-date "1998-09-19"
   maintainer "SL Baur <steve@xemacs.org>"
   distribution stable
   priority low
   category "comm"
   dump nil
   description "Footnoting in mail message editing modes."
   filename "footnote-1.06-pkg.tar.gz"
   md5sum "796323a84d97bade70a5d78fd9076a2e"
   size 13551
   provides (footnote)
   requires (mail-lib xemacs-base)
   type regular
))
(gnats
  (standards-version 1.0
   version "1.06"
   author-version "3.101"
   date "1998-08-01"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority high
   category "comm"
   dump nil
   description "XEmacs bug reports."
   filename "gnats-1.06-pkg.tar.gz"
   md5sum "5759d3cdefcc57f7a36c2f30a5868abe"
   size 186656
   provides (gnats gnats-admin send-pr)
   requires (mail-lib xemacs-base)
   type regular
))
(gnus
  (standards-version 1.0
   version "1.28"
   author-version "5.6.43x1"
   date "1998-09-05"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "comm"
   dump nil
   description "The Gnus Newsreader and Mailreader."
   filename "gnus-1.28-pkg.tar.gz"
   md5sum "fc47129ff589191a7361d2eac494bde6"
   size 1871939
   provides (gnus message)
   requires (gnus w3 mh-e mailcrypt rmail mail-lib xemacs-base)
   type regular
))
(irchat
  (standards-version 1.0
   version "1.01"
   author-version "980625-2"
   date "oc
	  key "
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "comm"
   dump nil
   description "ZENIRC IRC Client."
   filename "irchat-1.01-pkg.tar.gz"
   md5sum "c94bd691cb42e5ba23fbfe26daea2dc8"
   size 169192
   provides (irchat)
   requires ()
   type regular
))
(mailcrypt
  (standards-version 1.0
   version "1.05"
   author-version "3.4"
   date "1998-01-24"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "comm"
   dump nil
   description "Support for messaging encryption with PGP."
   filename "mailcrypt-1.05-pkg.tar.gz"
   md5sum "9ae0b8a3dd2c9b308024813fef24cc3c"
   size 88944
   provides (mailcrypt)
   requires (gnus vm mail-lib xemacs-base)
   type regular
))
(mew
  (standards-version 1.0
   version "1.01"
   author-version "1.93b38"
   date "1998-06-21"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution contrib
   priority low
   category "comm"
   dump nil
   description "Messaging in an Emacs World."
   filename "mew-1.01-pkg.tar.gz"
   md5sum "769d0647f7a411a8026aab4bf56d93c6"
   size 523578
   provides (mew)
   requires (mew)
   type regular
))
(mh-e
  (standards-version 1.0
   version "1.07"
   author-version "21.0"
   date "1998-07-12"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution contrib
   priority low
   category "comm"
   dump nil
   description "Front end support for MH."
   filename "mh-e-1.07-pkg.tar.gz"
   md5sum "d9ac55c06077c00a4db554dcc6e41dea"
   size 178838
   provides (mh-e)
   requires (mail-lib xemacs-base)
   type regular
))
(net-utils
  (standards-version 1.0
   version "1.09"
   author-version "21.0"
   date "1998-07-01"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "comm"
   dump nil
   description "Miscellaneous Networking Utilities."
   filename "net-utils-1.09-pkg.tar.gz"
   md5sum "597c6bc3aac41b64768d4eb7ae167805"
   size 115926
   provides (ilisp-browse-cltl2 emacsbug feedmail metamail net-utils rcompile shadowfile webjump webster-www)
   requires (w3 efs mail-lib xemacs-base)
   type single
))
(gnus
  (standards-version 1.0
   version "1.01"
   author-version "0.31"
   date "1998-09-08"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution unstable
   priority medium
   category "comm"
   dump nil
   description "The Gnus Newsreader and Mailreader."
   filename "pgnus-1.01-pkg.tar.gz"
   md5sum "2725e2f5f52079a1966f6e2195aab479"
   size 1969810
   provides (gnus message)
   requires (pgnus w3 mh-e mailcrypt rmail mail-lib xemacs-base)
   type regular
))
(rmail
  (standards-version 1.0
   version "1.06"
   author-version "21.0"
   date "1998-06-28"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution contrib
   priority low
   category "comm"
   dump nil
   description "An obsolete Emacs mailer."
   filename "rmail-1.06-pkg.tar.gz"
   md5sum "cc42e7660a4eb911b8cbc151f331c36b"
   size 96472
   provides (rmail rmailsum)
   requires (tm apel mail-lib xemacs-base)
   type regular
))
(supercite
  (standards-version 1.0
   version "1.09"
   author-version "3.55x2"
   date "1998-08-9"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "comm"
   dump nil
   description "An Emacs citation tool for News & Mail messages."
   filename "supercite-1.09-pkg.tar.gz"
   md5sum "3b2758fd09e036b9c7ce258d0ee61d5a"
   size 98926
   provides (supercite)
   requires (mail-lib xemacs-base)
   type regular
))
(tm
  (standards-version 1.0
   version "1.13"
   author-version "21.0"
   date "1998-08-27"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "comm"
   dump nil
   description "Emacs MIME support."
   filename "tm-1.13-pkg.tar.gz"
   md5sum "ba0feda4e61c1006c8e17c641de0b6d2"
   size 336736
   provides (tm tm-edit tm-view mime-setup)
   requires (gnus mh-e rmail vm mailcrypt mail-lib apel xemacs-base)
   type regular
))
(vm
  (standards-version 1.0
   version "1.11"
   author-version "6.62"
   date "1998-09-19"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "comm"
   dump nil
   description "An Emacs mailer."
   filename "vm-1.11-pkg.tar.gz"
   md5sum "56e65cbfb38283de030195b33f80be1b"
   size 503615
   provides (vm)
   requires (mail-lib xemacs-base)
   type regular
))
(w3
  (standards-version 1.0
   version "1.09"
   author-version "4.0pre23"
   date "1998-07-18"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution experimental
   priority high
   category "comm"
   dump nil
   description "A Web browser."
   filename "w3-1.09-pkg.tar.gz"
   md5sum "ceb4e1e0d9e11102b1ff2a5cb7b77d0f"
   size 638496
   provides (w3 url)
   requires (w3 mail-lib xemacs-base)
   type regular
))
(zenirc
  (standards-version 1.0
   version "1.01"
   author-version "2.112"
   date "1998-08-15"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "comm"
   dump nil
   description "ZENIRC IRC Client."
   filename "zenirc-1.01-pkg.tar.gz"
   md5sum "558723a7d70b1608a046068444f5045f"
   size 290655
   provides (zenirc)
   requires (zenirc)
   type regular
))
(cookie
  (standards-version 1.0
   version "1.08"
   author-version "21.0"
   date "1998-04-07"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "games"
   dump nil
   description "Spook and Yow (Zippy quotes)."
   filename "cookie-1.08-pkg.tar.gz"
   md5sum "aa71e9df700ad89eb803d1100af331dd"
   size 34274
   provides (cookie1 yow)
   requires (xemacs-base)
   type regular
))
(games
  (standards-version 1.0
   version "1.06"
   author-version "1.04"
   date "1998-06-04"
   build-date "1998-09-19"
   maintainer "Glynn Clements <glynn@sensei.co.uk>"
   distribution stable
   priority low
   category "games"
   dump nil
   description "Tetris, Sokoban, and Snake."
   filename "games-1.06-pkg.tar.gz"
   md5sum "6db6e872cdcce09b3e9b1e3425dcc20a"
   size 31993
   provides (gamegrid snake tetris sokoban)
   requires (xemacs-base)
   type regular
))
(mine
  (standards-version 1.0
   version "1.08"
   author-version "1.9"
   date "1998-05-09"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "games"
   dump nil
   description "Minehunt Game."
   filename "mine-1.08-pkg.tar.gz"
   md5sum "468ed5ccd1b86cd91572a901e156e7e2"
   size 66924
   provides (xmine)
   requires (xemacs-base)
   type regular
))
(misc-games
  (standards-version 1.0
   version "1.07"
   author-version "21.0"
   date "1998-03-22"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "games"
   dump nil
   description "Other amusements and diversions."
   filename "misc-games-1.07-pkg.tar.gz"
   md5sum "c7898266da95831f5797e849f740fd4c"
   size 175489
   provides (decipher gomoku hanoi life morse rot13)
   requires (xemacs-base)
   type single
))
(Sun
  (standards-version 1.0
   version "1.08"
   author-version "21.0"
   date "1998-07-25"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution sun
   priority low
   category "libs"
   dump nil
   description "Support for Sparcworks."
   filename "Sun-1.08-pkg.tar.gz"
   md5sum "faeaa48c2700604e5742b7a509b2a154"
   size 72951
   provides (sccs eos-browser eos-common eos-debugger eos-debugger eos-editor eos-init eos-load eos-menubar eos-toolbar sunpro)
   requires (cc-mode xemacs-base)
   type regular
))
(apel
  (standards-version 1.0
   version "1.06"
   author-version "3.3"
   date "1998-07-23"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution mule
   priority high
   category "libs"
   dump nil
   description "A Portable Emacs Library.  Used by XEmacs MIME support."
   filename "apel-1.06-pkg.tar.gz"
   md5sum "56aabd95da4333887bfd9134f5cbe6ac"
   size 38742
   provides (atype emu-20 emu-e19 emu-x20 emu-xemacs emu file-detect filename install mule-caesar path-util richtext std11-parse std11 tinyrich)
   requires (fsf-compat xemacs-base)
   type regular
))
(dired
  (standards-version 1.0
   version "1.02"
   author-version "7.9"
   date "1998-05-05"
   build-date "1998-09-19"
   maintainer "Mike Sperber <sperber@informatik.uni-tuebingen.de>"
   distribution stable
   priority medium
   category "libs"
   dump nil
   description "Manage file systems."
   filename "dired-1.02-pkg.tar.gz"
   md5sum "fd009a9bcff0f9a14d9f51665fe9c685"
   size 197926
   provides (diff dired)
   requires (xemacs-base)
   type regular
))
(edebug
  (standards-version 1.0
   version "1.05"
   author-version "21.0"
   date "1998-03-12"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "libs"
   dump nil
   description "An Emacs Lisp debugger."
   filename "edebug-1.05-pkg.tar.gz"
   md5sum "26ff707c557ce5ae53317f391897dde9"
   size 113971
   provides (edebug cl-read cust-print eval-reg cl-specs)
   requires (xemacs-base)
   type regular
))
(efs
  (standards-version 1.0
   version "1.10"
   author-version "1.17"
   date "1998-08-23"
   build-date "1998-09-19"
   maintainer "Mike Sperber <sperber@informatik.uni-tuebingen.de>"
   distribution stable
   priority medium
   category "libs"
   dump nil
   description "Treat files on remote systems the same as local files."
   filename "efs-1.10-pkg.tar.gz"
   md5sum "5f4fdf921b2800eb5dc0de6241253419"
   size 363608
   provides (efs)
   requires (xemacs-base vm dired)
   type regular
))
(fsf-compat
  (standards-version 1.0
   version "1.02"
   author-version "21.0"
   date "1998-03-25"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution mule
   priority high
   category "libs"
   dump nil
   description "FSF Emacs compatibility files."
   filename "fsf-compat-1.02-pkg.tar.gz"
   md5sum "3beb2ba9863cbee8a857acf5af00a8e8"
   size 18208
   provides (overlay thingatpt timer)
   requires ()
   type single
))
(mail-lib
  (standards-version 1.0
   version "1.17"
   author-version "21.0"
   date "1998-06-08"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "libs"
   dump nil
   description "Fundamental lisp files for providing email support."
   filename "mail-lib-1.17-pkg.tar.gz"
   md5sum "efe51eec9acce37695c5fb092dabb079"
   size 127025
   provides (browse-url highlight-headers mail-abbrevs mail-extr mail-utils reporter rfc822 rmail-mini rmailout sendmail smtpmail)
   requires (xemacs-base)
   type regular
))
(sounds-au
  (standards-version 1.0
   version "1.03"
   author-version "21.0"
   date "1998-06-30"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority high
   category "libs"
   dump nil
   description "XEmacs Sun sound files."
   filename "sounds-au-1.03-pkg.tar.gz"
   md5sum "9ae6e0154c4fce763cfd453e98f94682"
   size 125773
   provides ()
   requires ()
   type regular
))
(sounds-wav
  (standards-version 1.0
   version "1.03"
   author-version "21.0"
   date "1998-06-30"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority high
   category "libs"
   dump nil
   description "XEmacs Microsoft sound files."
   filename "sounds-wav-1.03-pkg.tar.gz"
   md5sum "15a8c6e740202d0c7542c5ebc2837838"
   size 148595
   provides ()
   requires ()
   type regular
))
(tooltalk
  (standards-version 1.0
   version "1.07"
   author-version "21.0"
   date "1998-07-25"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution contrib
   priority low
   category "libs"
   dump nil
   description "Support for building with Tooltalk."
   filename "tooltalk-1.07-pkg.tar.gz"
   md5sum "d9a97f43212d794ceebc964dc563dd17"
   size 9213
   provides ()
   requires ()
   type regular
))
(xemacs-base
  (standards-version 1.0
   version "1.24"
   author-version "21.0"
   date "1998-08-06"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution mule
   priority high
   category "libs"
   dump nil
   description "Fundamental XEmacs support, you almost certainly need this."
   filename "xemacs-base-1.24-pkg.tar.gz"
   md5sum "505536311107548faff51c7a4510ad08"
   size 456033
   provides (add-log advice annotations assoc case-table chistory comint-xemacs comint compile debug ebuff-menu echistory edmacro ehelp electric enriched env facemenu ffap helper imenu iso-syntax macros novice outline overlay passwd pp regi ring shell skeleton sort thing time-stamp timezone xbm-button xpm-button)
   requires ()
   type regular
))
(xemacs-devel
  (standards-version 1.0
   version "1.16"
   author-version "21.0"
   date "1998-08-19"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "libs"
   dump nil
   description "Emacs Lisp developer support."
   filename "xemacs-devel-1.16-pkg.tar.gz"
   md5sum "e5b592061957f041afcd45ed5ecc30cf"
   size 85457
   provides (docref eldoc elp find-func hide-copyleft ielm regexp-opt trace)
   requires (xemacs-base)
   type single
))
(edict
  (standards-version 1.0
   version "1.05"
   author-version "0.9.8"
   date "1998-07-23"
   build-date "1998-09-19"
   maintainer "Stephen J. Turnbull <turnbull@sk.tsukuba.ac.jp>"
   distribution mule
   priority high
   category "mule"
   dump nil
   description "Lisp Interface to EDICT, Kanji Dictionary"
   filename "edict-1.05-pkg.tar.gz"
   md5sum "f3b0db7eb896cbbb0409d04d1f02ebbe"
   size 75070
   provides (dui-registry dui edict-edit edict-english edict-japanese edict-morphology edict-test edict ts-mode)
   requires (mule-base xemacs-base)
   type regular
))
(egg-its
  (standards-version 1.0
   version "1.10"
   author-version "21.0"
   date "1998-08-11"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution mule
   priority high
   category "mule"
   dump t
   description "Wnn (4.2 and 6) support.  SJ3 support."
   filename "egg-its-1.10-pkg.tar.gz"
   md5sum "2eb3fb60b3cfb1f3d7b63bd8a95426a6"
   size 255348
   provides (egg-cnpinyin egg-cnzhuyin egg-cwnn-leim egg-jisx0201 egg-jsymbol egg-kwnn-leim egg-leim egg-sj3-client egg-sj3-leim egg-sj3 egg-wnn egg)
   requires (leim mule-base fsf-compat xemacs-base)
   type regular
))
(leim
  (standards-version 1.0
   version "1.09"
   author-version "21.0"
   date "1998-07-23"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution mule
   priority medium
   category "mule"
   dump nil
   description "Quail.  All non-English and non-Japanese language support."
   filename "leim-1.09-pkg.tar.gz"
   md5sum "dab730405c3843bd2a14a9821a46d1cf"
   size 1742759
   provides ()
   requires (mule-base fsf-compat xemacs-base)
   type regular
))
(locale
  (standards-version 1.0
   version "1.09"
   author-version "21.0"
   date "1998-07-24"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution mule
   priority high
   category "mule"
   dump nil
   description "Localized menubars and localized splash screens."
   filename "locale-1.09-pkg.tar.gz"
   md5sum "c5d2bb5bcd35e8f2f3033b5ef03398fe"
   size 32872
   provides ()
   requires (mule-base)
   type regular
))
(mule-base
  (standards-version 1.0
   version "1.22"
   author-version "21.0"
   date "1998-08-12"
   build-date "1998-09-19"
   maintainer "SL Baur <steve@altair.xemacs.org>"
   distribution mule
   priority high
   category "mule"
   dump t
   description "Basic Mule support, required for building with Mule."
   filename "mule-base-1.22-pkg.tar.gz"
   md5sum "82741caa8f936d8e007b3adf1e9c63c2"
   size 519183
   provides (canna-leim canna char-table china-util cyril-util isearch-ext japan-util ccl can-n-egg mule-help)
   requires (fsf-compat xemacs-base)
   type regular
))
(skk
  (standards-version 1.0
   version "1.09"
   author-version "10.38"
   date "1998-07-23"
   build-date "1998-09-19"
   maintainer "SL Baur <steve@altair.xemacs.org>"
   distribution mule
   priority medium
   category "mule"
   dump t
   description "Japanese Language Input Method."
   filename "skk-1.09-pkg.tar.gz"
   md5sum "21b1d3bb5bdfe939fb629719b67c68ac"
   size 1524350
   provides (skk skk-tut)
   requires (viper mule-base xemacs-base)
   type regular
))
(calc
  (standards-version 1.0
   version "1.08"
   author-version "2.02fX3"
   date "1998-07-25"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "oa"
   dump nil
   description "Emacs calculator"
   filename "calc-1.08-pkg.tar.gz"
   md5sum "b5ffe11d94688709d4131c9d39541866"
   size 1609129
   provides (calc)
   requires ()
   type regular
))
(calendar
  (standards-version 1.0
   version "1.07"
   author-version "21.0"
   date "1998-09-01"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "oa"
   dump nil
   description "Calendar and diary support."
   filename "calendar-1.07-pkg.tar.gz"
   md5sum "61f7aafd5d103ed66cca835ed3583abe"
   size 251917
   provides (appt cal-dst cal-french cal-mayan cal-x cal-xemacs calendar diary-ins diary-lib holidays lunar solar)
   requires (xemacs-base)
   type regular
))
(edit-utils
  (standards-version 1.0
   version "1.30"
   author-version "21.0"
   date "1998-09-18"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority high
   category "oa"
   dump nil
   description "Miscellaneous editor extensions, you probably need this."
   filename "edit-utils-1.30-pkg.tar.gz"
   md5sum "9ed576dd1f01cd57a9f0b699cdce36fe"
   size 595610
   provides (abbrevlist atomic-extents avoid backup-dir balloon-help big-menubar blink-cursor blink-paren bookmark compare-w completion dabbrev desktop detached-minibuf edit-toolbar fast-lock file-part floating-toolbar flow-ctrl foldout func-menu hippie-exp icomplete id-select info-look iswitchb lazy-lock lazy-shot live-icon man mic-paren paren popper mode-motion+ outl-mouse page-ext blink-paren paren permanent-buffers recent-files redo reportmail rsz-minibuf saveconfsavehist saveplace scroll-in-place tempo toolbar-utils tree-menu uniquify where-was-i-db)
   requires (xemacs-base)
   type single
))
(forms
  (standards-version 1.0
   version "1.07"
   author-version "2.10"
   date "1998-01-25"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution contrib
   priority low
   category "oa"
   dump nil
   description "Forms editing support (obsolete, use Widget instead)."
   filename "forms-1.07-pkg.tar.gz"
   md5sum "5efd98c58eb5ba6dce1e1a1e4059238d"
   size 47896
   provides (forms forms-mode)
   requires ()
   type regular
))
(frame-icon
  (standards-version 1.0
   version "1.04"
   author-version "21.0"
   date "1998-07-14"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution contrib
   priority low
   category "oa"
   dump nil
   description "Set up mode-specific icons for each frame under XEmacs"
   filename "frame-icon-1.04-pkg.tar.gz"
   md5sum "60c726b43b7dc20fcdd585796697e497"
   size 33753
   provides (forms forms-mode)
   requires ()
   type regular
))
(hm--html-menus
  (standards-version 1.0
   version "1.07"
   author-version "5.9"
   date "1998-01-25"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "oa"
   dump nil
   description "HTML editing."
   filename "hm--html-menus-1.07-pkg.tar.gz"
   md5sum "d90b6994d7d0868800b76042a6080bc5"
   size 173431
   provides (adapt hm--date hm--html-configuration hm--html-drag-and-drop hm--html-indentation hm--html-keys hm--html-menu hm--html-mode hm--html-not-standard hm--html html-view tmpl-minor-mode)
   requires (xemacs-base)
   type regular
))
(ispell
  (standards-version 1.0
   version "1.10"
   author-version "3.0x2"
   date "1998-09-06"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "oa"
   dump nil
   description "Spell-checking with GNU ispell."
   filename "ispell-1.10-pkg.tar.gz"
   md5sum "f3b4ea8328648fde2ef6837e42e0e656"
   size 66285
   provides (ispell)
   requires ()
   type regular
))
(pc
  (standards-version 1.0
   version "1.12"
   author-version "21.0"
   date "1998-07-25"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "oa"
   dump nil
   description "PC style interface emulation."
   filename "pc-1.12-pkg.tar.gz"
   md5sum "7d0860e82e54ddbd3467980df674f447"
   size 17497
   provides (delbs fusion pc-select pending-del s-region)
   requires (xemacs-base)
   type regular
))
(psgml
  (standards-version 1.0
   version "1.09"
   author-version "1.01"
   date "1998-07-06"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "oa"
   dump nil
   description "Validated HTML/SGML editing."
   filename "psgml-1.09-pkg.tar.gz"
   md5sum "86bc71c63fc2e278717b4d91debfa2eb"
   size 427133
   provides (psgml sgml)
   requires (edit-utils)
   type regular
))
(sgml
  (standards-version 1.0
   version "1.02"
   author-version "21.0"
   date "1998-01-25"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution contrib
   priority low
   category "oa"
   dump nil
   description "SGML/Linuxdoc-SGML editing."
   filename "sgml-1.02-pkg.tar.gz"
   md5sum "8e959375437e34425058fe348a9f0143"
   size 29523
   provides (sgml linuxdoc-sgml)
   requires (xemacs-base)
   type regular
))
(slider
  (standards-version 1.0
   version "1.07"
   author-version "0.3x1"
   date "1998-08-13"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution experimental
   priority low
   category "oa"
   dump nil
   description "User interface tool."
   filename "slider-1.07-pkg.tar.gz"
   md5sum "ebfea81a8d3d52550e76ae4efb5e5399"
   size 12174
   provides (slider color-selector)
   requires ()
   type regular
))
(speedbar
  (standards-version 1.0
   version "1.06"
   author-version "0.6.2"
   date "1998-02-07"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "oa"
   dump nil
   description "??? Document me."
   filename "speedbar-1.06-pkg.tar.gz"
   md5sum "533b3c4dbfd82d44ed1243c3e285920a"
   size 65542
   provides (speedbar)
   requires (xemacs-base)
   type regular
))
(strokes
  (standards-version 1.0
   version "1.02"
   author-version "21.0"
   date "1998-01-25"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "oa"
   dump nil
   description "Mouse enhancement utility."
   filename "strokes-1.02-pkg.tar.gz"
   md5sum "016516c550b4369a40f666f3dda9afcb"
   size 42765
   provides (strokes)
   requires (text-modes edit-utils mail-lib xemacs-base)
   type regular
))
(text-modes
  (standards-version 1.0
   version "1.10"
   author-version "21.0"
   date "1998-08-29"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority high
   category "oa"
   dump nil
   description "Miscellaneous support for editing text files."
   filename "text-modes-1.10-pkg.tar.gz"
   md5sum "732ecc924eff930b5674453588c0bd2c"
   size 204272
   provides (autoinsert crontab-edit filladapt fold-isearch folding image-mode iso-acc iso-ascii iso-cvt iso-insert iso-swed swedish tabify whitespace-mode winmgr-mode xpm-mode xrdb-mode)
   requires (ispell fsf-compat xemacs-base)
   type regular
))
(time
  (standards-version 1.0
   version "1.05"
   author-version "1.17"
   date "1998-04-24"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "oa"
   dump nil
   description "Display time & date on the modeline."
   filename "time-1.05-pkg.tar.gz"
   md5sum "b6a082e80e20a4caceed5f30826a4b22"
   size 19932
   provides (time)
   requires (xemacs-base)
   type regular
))
(eterm
  (standards-version 1.0
   version "1.06"
   author-version "21.0"
   date "1998-06-28"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "os"
   dump nil
   description "Terminal emulation."
   filename "eterm-1.06-pkg.tar.gz"
   md5sum "086de2e838a20a30d67c4f4bb99171d2"
   size 110620
   provides (eterm)
   requires (xemacs-base)
   type regular
))
(igrep
  (standards-version 1.0
   version "1.03"
   author-version "2.83"
   date "1998-08-11"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "os"
   dump nil
   description "Enhanced front-end for Grep."
   filename "igrep-1.03-pkg.tar.gz"
   md5sum "9a8946cef1c03e74d78382447bc345eb"
   size 15263
   provides (igrep)
   requires (dired xemacs-base)
   type regular
))
(ilisp
  (standards-version 1.0
   version "1.05"
   author-version "5.8"
   date "1998-01-24"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "os"
   dump nil
   description "Front-end for Inferior Lisp."
   filename "ilisp-1.05-pkg.tar.gz"
   md5sum "a21c63df2265048e3f0fd4e290ee732f"
   size 272263
   provides (ilisp completer)
   requires (xemacs-base)
   type regular
))
(os-utils
  (standards-version 1.0
   version "1.10"
   author-version "21.0"
   date "1998-07-14"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "os"
   dump nil
   description "Miscellaneous O/S utilities."
   filename "os-utils-1.10-pkg.tar.gz"
   md5sum "d2f6b6f8d3f2dcfb024a0e601d3e81cf"
   size 224824
   provides (archive-mode background crypt crypt++ inf-lisp jka-compr lpr mchat ps-print tar-mode telnet terminal uncompress)
   requires (xemacs-base)
   type single
))
(view-process
  (standards-version 1.0
   version "1.04"
   author-version "2.4"
   date "1998-01-24"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "os"
   dump nil
   description "A Unix process browsing tool."
   filename "view-process-1.04-pkg.tar.gz"
   md5sum "3ad505fa09f8300c034e7c44ab211d15"
   size 62718
   provides (view-process-mode)
   requires (xemacs-base)
   type regular
))
(ada
  (standards-version 1.0
   version "1.04"
   author-version "2.27"
   date "1998-01-24"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "prog"
   dump nil
   description "Ada language support."
   filename "ada-1.04-pkg.tar.gz"
   md5sum "3eb8dc6d057fd9e3c2248f40df0c34f0"
   size 55190
   provides (ada-mode ada-stmt)
   requires ()
   type regular
))
(c-support
  (standards-version 1.0
   version "1.08"
   author-version "21.0"
   date "1998-03-25"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution contrib
   priority low
   category "prog"
   dump nil
   description "Basic single-file add-ons for editing C code."
   filename "c-support-1.08-pkg.tar.gz"
   md5sum "e03535f146371f8fa3ea440ecdb18f55"
   size 73625
   provides (c-comment-edit cmacexp ctypes hideif hideshow)
   requires (cc-mode xemacs-base)
   type regular
))
(cc-mode
  (standards-version 1.0
   version "1.12"
   author-version "5.22"
   date "1998-03-05"
   build-date "1998-09-19"
   maintainer "Barry Warsaw <cc-mode-help@python.org>"
   distribution stable
   priority medium
   category "prog"
   dump nil
   description "C, C++ and Java language support."
   filename "cc-mode-1.12-pkg.tar.gz"
   md5sum "47a0d9fe2c0753985fa65596b68b8db6"
   size 191141
   provides (cc-mode)
   requires (xemacs-base)
   type regular
))
(debug
  (standards-version 1.0
   version "1.05"
   author-version "21.0"
   date "1998-07-09"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution contrib
   priority low
   category "prog"
   dump nil
   description "GUD, gdb, dbx debugging support."
   filename "debug-1.05-pkg.tar.gz"
   md5sum "bbb9783b4e81cd085adcf2e383cd4fe7"
   size 91169
   provides (dbx gdb-highlight gdb gdbsrc gud history)
   requires (xemacs-base)
   type regular
))
(ediff
  (standards-version 1.0
   version "1.10"
   author-version "2.70.2"
   date "1998-04-27"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "prog"
   dump nil
   description "Interface over GNU patch."
   filename "ediff-1.10-pkg.tar.gz"
   md5sum "a2b4d368c71a21e32660f061f1b52086"
   size 274999
   provides (ediff)
   requires (pcl-cvs dired xemacs-base)
   type regular
))
(emerge
  (standards-version 1.0
   version "1.03"
   author-version "21.0"
   date "1998-04-07"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "prog"
   dump nil
   description "Another interface over GNU patch."
   filename "emerge-1.03-pkg.tar.gz"
   md5sum "2ca964df916ec1f0b0a3f12a85e6741c"
   size 60474
   provides (emerge)
   requires ()
   type regular
))
(jde
  (standards-version 1.0
   version "1.05"
   author-version "2.05"
   date "1998-07-09"
   build-date "1998-09-19"
   maintainer "Andy Piper <andyp@parallax.co.uk>"
   distribution stable
   priority medium
   category "prog"
   dump nil
   description "Java language and development support."
   filename "jde-1.05-pkg.tar.gz"
   md5sum "fa4444d0c5cbfef6d3f14e4ed04faef7"
   size 129630
   provides (jde)
   requires (cc-mode debug speedbar edit-utils mail-lib xemacs-base)
   type regular
))
(pcl-cvs
  (standards-version 1.0
   version "1.12"
   author-version "21.0"
   date "1998-06-18"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "prog"
   dump nil
   description "CVS frontend."
   filename "pcl-cvs-1.12-pkg.tar.gz"
   md5sum "f69a484d2d8c7c829793f0a12c89ec91"
   size 159090
   provides (pcl-cvs dll elib-node generic-sc)
   requires (xemacs-base)
   type regular
))
(prog-modes
  (standards-version 1.0
   version "1.10"
   author-version "21.0"
   date "1998-09-04"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "prog"
   dump nil
   description "Support for various programming languages."
   filename "prog-modes-1.10-pkg.tar.gz"
   md5sum "61e1d86aba5774f74a5611b1eb7cf62c"
   size 548374
   provides (autoconf-mode cperl-mode eiffel3 f90 fortran ksh-mode m4-mode makefile perl-mode postscript python-mode rexx-mode simula-mode tcl teco verilog-mod)
   requires (mail-lib xemacs-base)
   type regular
))
(scheme
  (standards-version 1.0
   version "1.04"
   author-version "21.0"
   date "1998-04-11"
   build-date "1998-09-19"
   maintainer "Karl M. Hegbloom <karlheg@bittersweet.inetarena.com>"
   distribution contrib
   priority low
   category "prog"
   dump nil
   description "Front-end support for Inferior Scheme."
   filename "scheme-1.04-pkg.tar.gz"
   md5sum "0815a048274697b7213604e02db0c2a9"
   size 39734
   provides (scheme xscheme cmuscheme cmuscheme48)
   requires (xemacs-base)
   type regular
))
(sh-script
  (standards-version 1.0
   version "1.06"
   author-version "2.0e"
   date "1998-05-12"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "prog"
   dump nil
   description "Support for editing shell scripts."
   filename "sh-script-1.06-pkg.tar.gz"
   md5sum "b87b528df00464cbe1533ffdde81cd8e"
   size 34485
   provides (sh-script executable)
   requires (xemacs-base)
   type regular
))
(vc-cc
  (standards-version 1.0
   version "1.08"
   author-version "21.0"
   date "1998-07-24"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution contrib
   priority low
   category "prog"
   dump nil
   description "Version Control for ClearCase (UnFree) systems."
   filename "vc-cc-1.08-pkg.tar.gz"
   md5sum "81e1ce88b7389e872d732441a5fdb29f"
   size 97261
   provides (vc)
   requires (dired xemacs-base)
   type regular
))
(vc
  (standards-version 1.0
   version "1.12"
   author-version "21.0"
   date "1998-08-05"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "prog"
   dump nil
   description "Version Control for Free systems."
   filename "vc-1.12-pkg.tar.gz"
   md5sum "bf42fcd4d4dd78b5514e0d56e21082fc"
   size 83630
   provides (vc)
   requires (dired xemacs-base)
   type regular
))
(vhdl
  (standards-version 1.0
   version "1.05"
   author-version "2.74"
   date "1998-01-24"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "prog"
   dump nil
   description "Support for VHDL."
   filename "vhdl-1.05-pkg.tar.gz"
   md5sum "486c16af86f0901d5c5385479b5c0e6a"
   size 65812
   provides (vhdl-mode)
   requires ()
   type regular
))
(auctex
  (standards-version 1.0
   version "1.12"
   author-version "9.7p"
   date "1998-08-05"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority medium
   category "wp"
   dump nil
   description "Basic TeX/LaTeX support."
   filename "auctex-1.12-pkg.tar.gz"
   md5sum "a2826368828e89f0113401a38a49082b"
   size 364768
   provides (auc-old bib-cite font-latex latex multi-prompt tex-buf tex-info tex-jp tex-site tex)
   requires (xemacs-base)
   type regular
))
(crisp
  (standards-version 1.0
   version "1.07"
   author-version "1.34"
   date "1998-08-18"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "wp"
   dump nil
   description "Crisp/Brief emulation."
   filename "crisp-1.07-pkg.tar.gz"
   md5sum "1c8ef81e2dce5a0f0f2625dd66fcbcfb"
   size 10273
   provides (crisp scroll-lock)
   requires ()
   type regular
))
(edt
  (standards-version 1.0
   version "1.05"
   author-version "21.0"
   date "1998-04-07"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution contrib
   priority low
   category "wp"
   dump nil
   description "DEC EDIT/EDT emulation."
   filename "edt-1.05-pkg.tar.gz"
   md5sum "c2d94f654e748bc3170d21f699faee5d"
   size 48534
   provides (edt)
   requires (xemacs-base)
   type regular
))
(reftex
  (standards-version 1.0
   version "1.07"
   author-version "3.38"
   date "1998-08-11"
   build-date "1998-09-19"
   maintainer "Carsten Dominik <dominik@strw.LeidenUniv.nl>"
   distribution stable
   priority medium
   category "wp"
   dump nil
   description "Emacs support for LaTeX cross-references, citations.."
   filename "reftex-1.07-pkg.tar.gz"
   md5sum "cb821b60e394f6a285d2a43617384c79"
   size 200286
   provides (reftex)
   requires (fsf-compat xemacs-base)
   type regular
))
(texinfo
  (standards-version 1.0
   version "1.12"
   author-version "21.0"
   date "1998-07-20"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority high
   category "wp"
   dump nil
   description "XEmacs TeXinfo support."
   filename "texinfo-1.12-pkg.tar.gz"
   md5sum "ec1ff24ddc7c2e3dd0c121717a6ea6c1"
   size 134975
   provides (makeinfo tex-mode texinfmt texinfo texnfo-tex texnfo-upd)
   requires (xemacs-base)
   type regular
))
(textools
  (standards-version 1.0
   version "1.06"
   author-version "21.0"
   date "1998-04-29"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stabl
   priority medium
   category "wp"
   dump nil
   description "Miscellaneous TeX support."
   filename "textools-1.06-pkg.tar.gz"
   md5sum "6805183aa443242b45689ffe6e46855f"
   size 83197
   provides (bib-mode bibtex refer-to-bibtex)
   requires (xemacs-base)
   type single
))
(tpu
  (standards-version 1.0
   version "1.06"
   author-version "4.2X"
   date "1998-07-23"
   build-date "1998-09-19"
   maintainer "Kevin Oberman <oberman@es.net>"
   distribution normal
   priority medium
   category "wp"
   dump nil
   description "DEC EDIT/TPU support."
   filename "tpu-1.06-pkg.tar.gz"
   md5sum "cd777d6be222b85810927858d88fd642"
   size 59897
   provides (tpu)
   requires ()
   type regular
))
(viper
  (standards-version 1.0
   version "1.09"
   author-version "3.03"
   date "1998-02-25"
   build-date "1998-09-19"
   maintainer "XEmacs Development Team <xemacs-beta@xemacs.org>"
   distribution stable
   priority low
   category "wp"
   dump nil
   description "VI emulation support."
   filename "viper-1.09-pkg.tar.gz"
   md5sum "1636a0aece86e5713e8587eea92c81c8"
   size 318061
   provides (viper)
   requires (xemacs-base)
   type regular
))
))
(provide 'package-get-base)
