/* CANNA interface

   Copyright (C) 1995 Free Software Foundation, Inc.
   Copyright (C) 1995 Sun Microsystems, Inc.

This file is part of XEmacs.

XEmacs is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2, or (at your option) any
later version.

XEmacs is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with XEmacs; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

/* Synched up with: Mule 2.3.  Not in FSF. */

/* #### The comments in this file are mostly in EUC-formatted Japanese.
   It would be ***soooo*** much nicer if someone could translate
   them ... */

/*

  Authors: Akira Kon (kon@uxd.fc.nec.co.jp)
           Ichiro Hirakura (hirakura@uxd.fc.nec.co.jp)

  Functions defined in this file are

  (canna-key-proc key)
 		key: single STRING
 		RETURNS:
			 Length of converted string if no error occurs.
			 Error string if error occurs.
 		DESCRIPTION:
			 Convert a key input to a set of strings.  The
			 strings contain both well-formed string and a
			 intermediate result to show the translation
			 information to a user.  converted strings are
			 stored in specific variables.

  (canna-initialize)
  		RETURNS:
			List of the following things:
			- list of keys to toggle Japanese-mode
			- error message
			- list of warning messages
		DESCRIPTION:
			Initialize ``canna'', which is a kana-to-kanji
			converter for GNU Emacs.  The first arg
			specifies if inserting space character between
			BUNSETSU when candidates are displayed.  The
			second arg specifies server.  The third arg
			specifies a file which will be used as a
			customization description.  If nil is
			specified for each arg, the default value will
			be used.

  (canna-finalize)
		RETURNS:
			list of warning messages
		DESCRIPTION:
			finalize ``canna'', which is a kana-to-kanji
			converter for GNU Emacs.  This cause to write
			miscellaneous informations to kana-to-kanji
			dictionary.

  (canna-touroku-string string)
		string:
			String to register to a dictionary.
		RETURNS:
			The same thing returns as canna-key-proc does.
		DESCRIPTION:
			Register Kanji words into kana-to-kanji
			conversion dictionary.

  (canna-set-width width)
		width:
			Column width of the place where the candidates
			of kana-to-kanji conversion will be shown.
		RETURNS:
			nil
		DESCRIPTION:
			Set status-line width information, which is
			used to display kanji candidates.

  (canna-change-mode num)
		num:
			The mode number of Canna.
		RETURNS:
			The same thing returns as canna-key-proc does.
		DESCRIPTION:
			Change Japanese pre-edit mode.

  (canna-store-yomi yomi roma)
		yomi:
			``Yomi'' to be stored.
		roma:
			``Romaji'' which corresponds to the ``Yomi''.
		RETURNS:
			The same thing returns as canna-key-proc does.
		DESCRIPTION:
			Store yomi characters as a YOMI of
			kana-to-kanji conversion.

  (canna-do-function num ch)
		num:
			A function number to be called.
		ch:
			A character will be specified in order to feed
			the character to the function if the function
			needs a input character.
		RETURNS:
			The same thing returns as canna-key-proc does.
		DESCRIPTION:
			Do specified function at current mode.

  (canna-parse string)
		string:
			To be parsed.
		RETURNS:
			List of warning messages.
		DESCRIPTION:
			Parse customize string.

  (canna-query-mode)
		RETURNS:
			A string which indicate the current mode.
		DESCRIPTION:
			Get current mode string.

  Functions below are used for KKCP compatible library.  These
  functions provides a base kana-to-kanji conversion system for EGG.
  These functions may be used when users want to change the engine
  from Wnn to Canna without changing user interface of Japanese input.

  (canna-henkan-begin)
  (canna-henkan-next)
  (canna-bunsetu-henkou)
  (canna-henkan-kakutei)
  (canna-henkan-end)
  (canna-henkan-quit)

 */

#include <config.h>
#include "lisp.h"

#include "buffer.h"
#include "file-coding.h"

#ifdef CANNA2
#define IROHA_BC
#include "canna/jrkanji.h"
#include "canna/RK.h"
#else /* !CANNA2 */
#include "iroha/jrkanji.h"
#include "iroha/RK.h"
#endif /* !CANNA2 */
extern char *jrKanjiError;

#define KEYTOSTRSIZE 2048
static unsigned char buf[KEYTOSTRSIZE];
static char **warning;

static int Vcanna_empty_info, Vcanna_through_info;
static int Vcanna_underline;
static int Vcanna_inhibit_hankakukana;

static Lisp_Object Vcanna_kakutei_string;
static Lisp_Object Vcanna_kakutei_yomi;
static Lisp_Object Vcanna_kakutei_romaji;
static Lisp_Object Vcanna_henkan_string;
static int         Vcanna_henkan_length;
static int         Vcanna_henkan_revPos;
static int         Vcanna_henkan_revLen;
static Lisp_Object Vcanna_ichiran_string;
static int         Vcanna_ichiran_length;
static int         Vcanna_ichiran_revPos;
static int         Vcanna_ichiran_revLen;
static Lisp_Object Vcanna_mode_string;

static int IRCP_context;

static Lisp_Object storeResults (unsigned char *, int, jrKanjiStatus *);
static Lisp_Object kanjiYomiList (int, int);

#ifdef CANNA_MULE
static void m2c (unsigned char *, int, unsigned char *);
static Lisp_Object mule_make_string (unsigned char *, int);
static int mule_strlen (unsigned char *, int);
static void count_char (unsigned char *,int, int, int, int *, int *, int *);
#define make_string mule_make_string
#endif

/* Lisp functions definition */

DEFUN ("canna-key-proc", Fcanna_key_proc, 1, 1, 0, /*
Translate a key input to a set of strings.  The strings contain both
well-formed string and intermediate result to show the translation
information to a user.  Converted strings are stored in specific
variables.
*/
       (ch))
{
  jrKanjiStatus ks;
  int len;

  CHECK_CHAR_COERCE_INT (ch);
  len = jrKanjiString (0, XCHAR (ch), buf, KEYTOSTRSIZE, &ks);
  return storeResults (buf, len, &ks);
}

static Lisp_Object
storeResults (unsigned char *buf, int len, jrKanjiStatus *ks)
{
  Lisp_Object val = Qnil;

  if (len < 0)
    { /* Error detected */
      val = make_string ((unsigned char*) jrKanjiError, strlen (jrKanjiError));
    }
  else
    {
      /* 確定した文字列 */
      Vcanna_kakutei_string = make_string (buf, len);
      val = make_int (len);
      /* 確定した文字列の読みの情報... */
      Vcanna_kakutei_yomi = Vcanna_kakutei_romaji = Qnil;
      if (ks->info & KanjiYomiInfo)
	{
	  unsigned char *p = buf + len + 1;
	  int yomilen = strlen (p);

	  if (len + yomilen + 1 < KEYTOSTRSIZE)
	    {
	      int yomilen2;

	      Vcanna_kakutei_yomi = make_string (p, yomilen); /* 読み */
	      p += yomilen + 1;
	      yomilen2 = strlen (p);
	      if (len + yomilen + yomilen2 + 2 < KEYTOSTRSIZE)
		{
		  Vcanna_kakutei_romaji = make_string (p, yomilen2); /* ローマ字 */
		}
	    }
	}


      /* 候補表示の文字列です。*/
      Vcanna_henkan_string = Qnil;
      if (ks->length >= 0)
	{
	  Vcanna_henkan_string = make_string (ks->echoStr, ks->length);
#ifndef CANNA_MULE
	  Vcanna_henkan_length = ks->length;
	  Vcanna_henkan_revPos = ks->revPos;
	  Vcanna_henkan_revLen = ks->revLen;
#else /* CANNA_MULE */
	  if (Vcanna_underline)
	    {
	      Vcanna_henkan_length = mule_strlen (ks->echoStr,ks->length);
	      Vcanna_henkan_revPos = mule_strlen (ks->echoStr,ks->revPos);
	      Vcanna_henkan_revLen = mule_strlen (ks->echoStr+ks->revPos,ks->revLen);
	    }
	  else
	    {
	      count_char (ks->echoStr, ks->length, ks->revPos, ks->revLen,
			  &Vcanna_henkan_length, &Vcanna_henkan_revPos,
			  &Vcanna_henkan_revLen);
	    }
#endif /* CANNA_MULE */
	}

      /* 一覧の情報 */
      Vcanna_ichiran_string = Qnil;
      if (ks->info & KanjiGLineInfo && ks->gline.length >= 0)
	{
	  Vcanna_ichiran_string = make_string (ks->gline.line, ks->gline.length);
#ifndef CANNA_MULE
	  Vcanna_ichiran_length = ks->gline.length;
	  Vcanna_ichiran_revPos = ks->gline.revPos;
	  Vcanna_ichiran_revLen = ks->gline.revLen;
#else /* CANNA_MULE */
	  count_char (ks->gline.line, ks->gline.length,
		      ks->gline.revPos, ks->gline.revLen, &Vcanna_ichiran_length,
		      &Vcanna_ichiran_revPos, &Vcanna_ichiran_revLen);
#endif /* CANNA_MULE */
	}

      /* モードの情報 */
      Vcanna_mode_string = Qnil;
      if (ks->info & KanjiModeInfo)
	{
	  Vcanna_mode_string = make_string (ks->mode, strlen (ks->mode));
	}

      /* その他の情報 */
      Vcanna_empty_info = (ks->info & KanjiEmptyInfo) ? 1 : 0;
      Vcanna_through_info = (ks->info & KanjiThroughInfo) ? 1 : 0;
    }

  return val;
}

DEFUN ("canna-set-bunsetsu-kugiri", Fcanna_set_bunsetsu, 0, 1, 0, /*
This function sets the clause separator.
If non-nil value is specified, the white space separator will be used.
No separator will be used otherwise.
*/
       (num))
{
  int kugiri; /* 文節区切りをするか？ */

  kugiri = NILP (num) ? 0 : 1;

  jrKanjiControl (0, KC_SETBUNSETSUKUGIRI, (char *) kugiri);

  return Qnil;
}

/* For whatever reason, calling Fding directly from libCanna loses */
static void call_Fding()
{
  extern Lisp_Object Fding();

  Fding (Qnil, Qnil, Qnil);
}

DEFUN ("canna-initialize", Fcanna_initialize, 0, 3, 0, /*
Initialize ``canna'', which is a kana-to-kanji converter for GNU Emacs.
The first arg specifies if inserting space character between BUNSETSU when
candidates are displayed.
The second arg specifies server.
The third arg specifies a file which will be used as a customization
description.
If nil is specified for each arg, the default value will be used.
*/
       (num, server, rcfile))
{
  Lisp_Object val;
  int res;
  unsigned char **p, **q;

  int kugiri; /* 文節区切りをするか？ */

  IRCP_context = -1;

  if (NILP (num))
    {
      kugiri = 1;
    }
  else
    {
      CHECK_INT (num);
      kugiri = XINT (num);
      kugiri = (kugiri == 1) ? 1 : 0;
    }

  if (NILP (server))
    {
      jrKanjiControl (0, KC_SETSERVERNAME, (char *) 0);
    }
  else
    {
      char servername[256];

      CHECK_STRING (server);
      strncpy (servername, XSTRING (server)->_data, XSTRING (server)->_size);
      servername[XSTRING (server)->_size] = '\0';
      jrKanjiControl (0, KC_SETSERVERNAME, servername);
    }

  if (NILP (rcfile))
    {
      jrKanjiControl (0, KC_SETINITFILENAME, (char *) 0);
    }
  else
    {
      char rcname[256];

      CHECK_STRING (rcfile);
      strncpy (rcname, XSTRING (rcfile)->_data, XSTRING (rcfile)->_size);
      rcname[XSTRING (rcfile)->_size] = '\0';
      jrKanjiControl (0, KC_SETINITFILENAME, rcname);
    }

  warning = (char **) 0;
#ifdef nec_ews_svr4
  stop_polling ();
#endif /* nec_ews_svr4 */
  res = jrKanjiControl (0, KC_INITIALIZE, (char *)&warning);
#ifdef nec_ews_svr4
  start_polling ();
#endif /* nec_ews_svr4 */
  val = Qnil;
  if (warning)
    {
      for (p = q = (unsigned char **) warning ; *q ; q++)
	;
      while (p < q)
	{
	  q--;
	  val = Fcons (make_string (*q, strlen (*q)), val);
	}
    }
  val = Fcons (val, Qnil);

  if (res == -1)
    {
      val = Fcons (make_string ((unsigned char*) jrKanjiError, 
				strlen (jrKanjiError)), val);
      /* イニシャライズで失敗した場合。 */
      return Fcons (Qnil, val);
    }
  else
    {
      extern void (*jrBeepFunc)();
      Lisp_Object CANNA_mode_keys ();

      jrBeepFunc = call_Fding;

#ifdef KC_SETAPPNAME
#ifndef CANNA_MULE
      wcKanjiControl (0, KC_SETAPPNAME, "nemacs");
#else /* CANNA_MULE */
      wcKanjiControl (0, KC_SETAPPNAME, "mule");
#endif /* CANNA_MULE */
#endif /* KC_SETAPPNAME */

      jrKanjiControl (0, KC_SETBUNSETSUKUGIRI, (char *) kugiri);
      jrKanjiControl (0, KC_SETWIDTH, (char *) 78);
#ifndef CANNA_MULE
      jrKanjiControl (0, KC_INHIBITHANKAKUKANA, (char *) 1);
#else
      /* mule だったら半角カタカナも使える */
      if (Vcanna_inhibit_hankakukana)
	jrKanjiControl (0, KC_INHIBITHANKAKUKANA, (char *) 1);
#endif
      jrKanjiControl (0, KC_YOMIINFO, (char *) 2); /* ※２: ローマ字まで返す */
      val = Fcons (Qnil, val);
      return Fcons (CANNA_mode_keys (), val);
    }
}

DEFUN ("canna-finalize", Fcanna_finalize, 0, 0, 0, /*
finalize ``canna'', which is a kana-to-kanji converter for GNU Emacs.
This cause to write miscellaneous informations to kana-to-kanji dictionary.
*/
       ())
{
  Lisp_Object val;
  unsigned char **p;

  jrKanjiControl (0, KC_FINALIZE, (char *)&warning);

  val = Qnil;
  if (warning)
    {
      for (p = (unsigned char**) warning ; *p ; p++)
	{
	  val = Fcons (make_string (*p, strlen (*p)), val);
	}
    }
  val = Fcons (val, Qnil);
  IRCP_context = -1;
  return val;
}

DEFUN ("canna-touroku-string", Fcanna_touroku_string, 1, 1, 0, /*
Register Kanji words into kana-to-kanji conversion dictionary.
*/
       (str))
{
  jrKanjiStatusWithValue ksv;
  jrKanjiStatus ks;
  int len;
  Lisp_Object val;
#ifdef CANNA_MULE
  unsigned char cbuf[4096];
#endif

  CHECK_STRING (str);
  ksv.buffer = (unsigned char *) buf;
  ksv.bytes_buffer = KEYTOSTRSIZE;
#ifndef CANNA_MULE
  ks.echoStr = XSTRING (str)->_data;
  ks.length = XSTRING (str)->_size;
#else /* CANNA_MULE */
  m2c (XSTRING (str)->_data, XSTRING (str)->_size, cbuf);
  ks.echoStr = cbuf;
  ks.length = strlen (cbuf);
#endif /* CANNA_MULE */
  ksv.ks = &ks;
  len = jrKanjiControl (0, KC_DEFINEKANJI, (char *)&ksv);
  val = storeResults (buf, ksv.val, ksv.ks);
  return val;
}

DEFUN ("canna-set-width", Fcanna_set_width, 1, 1, 0, /*
Set status-line width information, which is used to display 
kanji candidates.
*/
       (num))
{
  CHECK_INT (num);

  jrKanjiControl (0, KC_SETWIDTH,  (char *) XINT (num));
  return Qnil;
}

DEFUN ("canna-change-mode", Fcanna_change_mode, 1, 1, 0, /*
Change Japanese pre-edit mode.
*/
       (num))
{
  jrKanjiStatusWithValue ksv;
  jrKanjiStatus ks;
  Lisp_Object val;

  CHECK_INT (num);

  ksv.buffer = (unsigned char *) buf;
  ksv.bytes_buffer = KEYTOSTRSIZE;
  ksv.ks = &ks;
  ksv.val = XINT (num);
  jrKanjiControl (0, KC_CHANGEMODE,  (char *)&ksv);
  val = storeResults (buf, ksv.val, ksv.ks);
  return val;
}

Lisp_Object
CANNA_mode_keys (void)
{
#define CANNAWORKBUFSIZE 32
  char xxx[CANNAWORKBUFSIZE];
  Lisp_Object val;
  int i, n;

  n = jrKanjiControl (0, KC_MODEKEYS, xxx);
  val = Qnil;
  for (i = n ; i > 0 ;)
    {
      --i;
      /* !!#### something fucked here */
      val = Fcons (make_char ((int)(0xFF & (unsigned char) xxx[i])), val);
    }
  return val;
}

DEFUN ("canna-store-yomi", Fcanna_store_yomi, 1, 2, 0, /*
Store yomi characters as a YOMI of kana-to-kanji conversion.
*/
       (yomi, roma))
{
  jrKanjiStatusWithValue ksv;
  jrKanjiStatus ks;

  CHECK_STRING (yomi);
#ifndef CANNA_MULE
  strncpy (buf, XSTRING (yomi)->_data, XSTRING (yomi)->_size);
  ks.length = XSTRING (yomi)->_size;
  buf[ks.length] = '\0';
#else /* CANNA_MULE */
  m2c (XSTRING (yomi)->_data, XSTRING (yomi)->_size, buf);
  ks.length = strlen (buf);
#endif /* CANNA_MULE */

  if (NILP (roma))
    {
      ks.mode = 0;
    }
  else
    {
      CHECK_STRING (roma);

#ifndef CANNA_MULE
      strncpy (buf + XSTRING (yomi)->_size + 1, XSTRING (roma)->_data,
	       XSTRING (roma)->_size);
      buf[XSTRING (yomi)->_size + 1 + XSTRING (roma)->_size] = '\0';
      ks.mode = (unsigned char *)(buf + XSTRING (yomi)->_size + 1);
#else /* CANNA_MULE */
      ks.mode = (unsigned char *)(buf + ks.length + 1);
      m2c (XSTRING (roma)->_data, XSTRING (roma)->_size, ks.mode);
#endif /* CANNA_MULE */
    }

  ks.echoStr = (unsigned char *) buf;
  ksv.buffer = (unsigned char *) buf; /* 返値用 */
  ksv.bytes_buffer = KEYTOSTRSIZE;
  ksv.ks = &ks;

  jrKanjiControl (0, KC_STOREYOMI, (char *)&ksv);

  return storeResults (buf, ksv.val, ksv.ks);
}

DEFUN ("canna-do-function", Fcanna_do_function, 1, 2, 0, /*
Do specified function at current mode.
*/
       (num, ch))
{
  jrKanjiStatusWithValue ksv;
  jrKanjiStatus ks;
  Lisp_Object val;

  CHECK_INT (num);

  if (NILP (ch))
    {
      *buf = '@';
    }
  else
    {
      CHECK_CHAR (ch);
      *buf = XCHAR (ch);
    }

  ksv.buffer = (unsigned char *) buf;
  ksv.bytes_buffer = KEYTOSTRSIZE;
  ksv.ks = &ks;
  ksv.val = XINT (num);
  jrKanjiControl (0, KC_DO, (char *) &ksv);
  val = storeResults (buf, ksv.val, ksv.ks);
  return val;
}

DEFUN ("canna-parse", Fcanna_parse, 1, 1, 0, /*
Parse customize string.
*/
       (str))
{
  Lisp_Object val;
  unsigned char **p;
  int n;

  CHECK_STRING (str);

#ifndef CANNA_MULE
  strncpy (buf, XSTRING (str)->_data, XSTRING (str)->_size);
  buf[XSTRING (str)->_size] = '\0';
#else /* CANNA_MULE */
  m2c (XSTRING (str)->_data, XSTRING (str)->_size, buf);
#endif /* CANNA_MULE */
  p = (unsigned char**) buf;
  n = jrKanjiControl (0, KC_PARSE,  (char *) &p);
  val = Qnil;
  while (n > 0)
    {
      n--;
      val = Fcons (make_string (p[n], strlen (p[n])), val);
    }
  return val;
}

DEFUN ("canna-query-mode", Fcanna_query_mode, 0, 0, 0, /*
Get current mode string.
*/
       ())
{
  unsigned char buf[256];

  jrKanjiControl (0, KC_QUERYMODE, buf);
  return make_string (buf, strlen (buf));
}

/*
 * Functions following this line are for KKCP interface compatible
 * library.  These functions may be used by MILK system.
 */

#define RKBUFSIZE 1024

static unsigned char yomibuf[RKBUFSIZE];
static short kugiri[RKBUFSIZE / 2];

static int
confirmContext (void)
{
  if (IRCP_context < 0)
    {
      int context;

      if ((context = jrKanjiControl (0, KC_GETCONTEXT, (char *) 0)) == -1)
	{
	  return 0;
	}
      IRCP_context = context;
    }
  return 1;
}

static int
byteLen (int bun, int len)
{
  int i = 0, offset = 0, ch;

  if (0 <= bun && bun < RKBUFSIZE)
    {
      offset = kugiri[bun];
    }

  while (len-- > 0 && (ch = (int) yomibuf[offset + i]))
    {
      i++;
      if (ch & 0x80)
	{
	  i++;
	}
    }
  return i;
}

DEFUN ("canna-henkan-begin", Fcanna_henkan_begin, 1, 1, 0, /*
かな漢字変換した結果を返還する。文節切りがしてある。
*/
       (yomi))
{
  int nbun;

  CHECK_STRING (yomi);
  if (confirmContext () == 0)
    {
      return Qnil;
    }
#ifndef CANNA_MULE
  strncpy (yomibuf, XSTRING (yomi)->_data, XSTRING (yomi)->_size);
  yomibuf[XSTRING (yomi)->_size] = '\0';
  nbun = RkBgnBun (IRCP_context, XSTRING (yomi)->_data, XSTRING (yomi)->_size,
		   (RK_XFER << RK_XFERBITS) | RK_KFER);
#else /* CANNA_MULE */
  m2c (XSTRING (yomi)->_data, XSTRING (yomi)->_size, yomibuf);
  nbun = RkBgnBun (IRCP_context, (char *) yomibuf, strlen (yomibuf),
		   (RK_XFER << RK_XFERBITS) | RK_KFER);
#endif /* CANNA_MULE */

  return kanjiYomiList (IRCP_context, nbun);
}

static Lisp_Object
kanjiYomiList (int context, int nbun)
{
  Lisp_Object val, res = Qnil;
  unsigned char RkBuf[RKBUFSIZE];
  int len, i, total;

  for (i = nbun ; i > 0 ; )
    {
      i--;
      RkGoTo (context, i);
      len = RkGetKanji (context, RkBuf, RKBUFSIZE);
      val = make_string (RkBuf, len);
      len = RkGetYomi (context, RkBuf, RKBUFSIZE);
      res = Fcons (Fcons (val, make_string (RkBuf, len)), res);
      if (i < RKBUFSIZE / 2)
	{
	  kugiri[i] = len;
	}
    }
  for (i = 0, total = 0 ; i < nbun ; i++)
    {
      int temp = kugiri[i];
      kugiri[i] = total;
      total += temp;
    }
  return res;
}

DEFUN ("canna-henkan-next", Fcanna_henkan_next, 1, 1, 0, /*
候補一覧を求める。
*/
       (bunsetsu))
{
  int i, slen, len;
  unsigned char *p, RkBuf[RKBUFSIZE];
  Lisp_Object res = Qnil, endp;

  CHECK_INT (bunsetsu);
  if (confirmContext () == 0)
    {
      return Qnil;
    }
  RkGoTo (IRCP_context, XINT (bunsetsu));
  len = RkGetKanjiList (IRCP_context, RkBuf, RKBUFSIZE);
  p = RkBuf;
  for (i = 0 ; i < len ; i++)
    {
      slen = strlen (p);
      if (NILP(res))
	{
	  endp = res = Fcons (make_string (p, slen), Qnil);
	}
      else
	{
	  endp = XCDR (endp) = Fcons (make_string (p, slen), Qnil);
	}
      p += slen + 1;
    }
  return res;
}

DEFUN ("canna-bunsetu-henkou", Fcanna_bunsetu_henkou, 2, 2, 0, /*
文節の長さを指定する。
*/
       (bunsetsu, bunlen))
{
  int nbun, len;

  CHECK_INT (bunsetsu);
  CHECK_INT (bunlen);
  
  nbun = XINT (bunsetsu);
  if (confirmContext () == 0)
    {
      return Qnil;
    }
  RkGoTo (IRCP_context, nbun);
  len = byteLen (nbun, XINT (bunlen));
  return kanjiYomiList (IRCP_context, RkResize (IRCP_context, len));
}

DEFUN ("canna-henkan-kakutei", Fcanna_henkan_kakutei, 2, 2, 0, /*
候補選択。
*/
       (bun, kouho))
{
  int nbun, nkouho;

  if (confirmContext () == 0)
    {
      return Qnil;
    }
  nbun = XINT(bun);
  RkGoTo (IRCP_context, nbun);

  nkouho = XINT(kouho);
  RkXfer (IRCP_context, nkouho);
  return Qt;
}

DEFUN ("canna-henkan-end", Fcanna_henkan_end, 0, 0, 0, /*
変換終了。
*/
       ())
{
  if (confirmContext () == 0)
    {
      return Qnil;
    }
  RkEndBun (IRCP_context, 1); /* 学習はいつでも行って良いものなのか？ */
  return Qt;
}

DEFUN ("canna-henkan-quit", Fcanna_henkan_quit, 0, 0, 0, /*
変換終了。
*/
       ())
{
  if (confirmContext () == 0)
    {
      return Qnil;
    }
  RkEndBun (IRCP_context, 0);
  return Qt;
}

/* variables below this line is constants of Canna */

static int Vcanna_mode_AlphaMode = IROHA_MODE_AlphaMode;
static int Vcanna_mode_EmptyMode = IROHA_MODE_EmptyMode;
static int Vcanna_mode_KigoMode = IROHA_MODE_KigoMode;
static int Vcanna_mode_YomiMode = IROHA_MODE_YomiMode;
static int Vcanna_mode_JishuMode = IROHA_MODE_JishuMode;
static int Vcanna_mode_TankouhoMode = IROHA_MODE_TankouhoMode;
static int Vcanna_mode_IchiranMode = IROHA_MODE_IchiranMode;
static int Vcanna_mode_YesNoMode = IROHA_MODE_YesNoMode;
static int Vcanna_mode_OnOffMode = IROHA_MODE_OnOffMode;
#ifdef CANNA_MODE_AdjustBunsetsuMode
static int Vcanna_mode_AdjustBunsetsuMode = CANNA_MODE_AdjustBunsetsuMode;
#endif
#ifdef CANNA_MODE_ChikujiYomiMode
static int Vcanna_mode_ChikujiYomiMode = CANNA_MODE_ChikujiYomiMode;
static int Vcanna_mode_ChikujiTanMode = CANNA_MODE_ChikujiTanMode;
#endif

static int Vcanna_mode_HenkanMode = IROHA_MODE_HenkanMode;
#ifdef CANNA_MODE_HenkanNyuryokuMode
static int Vcanna_mode_HenkanNyuryokuMode = CANNA_MODE_HenkanNyuryokuMode;
#endif
#ifdef CANNA_MODE_ZenHiraHenkanMode
static int Vcanna_mode_ZenHiraHenkanMode = CANNA_MODE_ZenHiraHenkanMode;
#ifdef CANNA_MODE_HanHiraHenkanMode
static int Vcanna_mode_HanHiraHenkanMode = CANNA_MODE_HanHiraHenkanMode;
#endif
static int Vcanna_mode_ZenKataHenkanMode = CANNA_MODE_ZenKataHenkanMode;
static int Vcanna_mode_HanKataHenkanMode = CANNA_MODE_HanKataHenkanMode;
static int Vcanna_mode_ZenAlphaHenkanMode = CANNA_MODE_ZenAlphaHenkanMode;
static int Vcanna_mode_HanAlphaHenkanMode = CANNA_MODE_HanAlphaHenkanMode;
#endif
static int Vcanna_mode_ZenHiraKakuteiMode = IROHA_MODE_ZenHiraKakuteiMode;
#ifdef CANNA_MODE_HanHiraKakuteiMode
static int Vcanna_mode_HanHiraKakuteiMode = CANNA_MODE_HanHiraKakuteiMode;
#endif
static int Vcanna_mode_ZenKataKakuteiMode = IROHA_MODE_ZenKataKakuteiMode;
static int Vcanna_mode_HanKataKakuteiMode = IROHA_MODE_HanKataKakuteiMode;
static int Vcanna_mode_ZenAlphaKakuteiMode = IROHA_MODE_ZenAlphaKakuteiMode;
static int Vcanna_mode_HanAlphaKakuteiMode = IROHA_MODE_HanAlphaKakuteiMode;
static int Vcanna_mode_HexMode = IROHA_MODE_HexMode;
static int Vcanna_mode_BushuMode = IROHA_MODE_BushuMode;
static int Vcanna_mode_ExtendMode = IROHA_MODE_ExtendMode;
static int Vcanna_mode_RussianMode = IROHA_MODE_RussianMode;
static int Vcanna_mode_GreekMode = IROHA_MODE_GreekMode;
static int Vcanna_mode_LineMode = IROHA_MODE_LineMode;
static int Vcanna_mode_ChangingServerMode = IROHA_MODE_ChangingServerMode;
static int Vcanna_mode_HenkanMethodMode = IROHA_MODE_HenkanMethodMode;
static int Vcanna_mode_DeleteDicMode = IROHA_MODE_DeleteDicMode;
static int Vcanna_mode_TourokuMode = IROHA_MODE_TourokuMode;
static int Vcanna_mode_TourokuEmptyMode = IROHA_MODE_TourokuEmptyMode;
static int Vcanna_mode_TourokuHinshiMode = IROHA_MODE_TourokuHinshiMode;
static int Vcanna_mode_TourokuDicMode = IROHA_MODE_TourokuDicMode;
static int Vcanna_mode_QuotedInsertMode = IROHA_MODE_QuotedInsertMode;
static int Vcanna_mode_BubunMuhenkanMode = IROHA_MODE_BubunMuhenkanMode;
static int Vcanna_mode_MountDicMode = IROHA_MODE_MountDicMode;

static int Vcanna_fn_SelfInsert = IROHA_FN_SelfInsert;
static int Vcanna_fn_FunctionalInsert = IROHA_FN_FunctionalInsert;
static int Vcanna_fn_QuotedInsert = IROHA_FN_QuotedInsert;
static int Vcanna_fn_JapaneseMode = IROHA_FN_JapaneseMode;
static int Vcanna_fn_AlphaMode = IROHA_FN_AlphaMode;
static int Vcanna_fn_HenkanNyuryokuMode = IROHA_FN_HenkanNyuryokuMode;
static int Vcanna_fn_Forward = IROHA_FN_Forward;
static int Vcanna_fn_Backward = IROHA_FN_Backward;
static int Vcanna_fn_Next = IROHA_FN_Next;
static int Vcanna_fn_Prev = IROHA_FN_Prev;
static int Vcanna_fn_BeginningOfLine = IROHA_FN_BeginningOfLine;
static int Vcanna_fn_EndOfLine = IROHA_FN_EndOfLine;
static int Vcanna_fn_DeleteNext = IROHA_FN_DeleteNext;
static int Vcanna_fn_DeletePrevious = IROHA_FN_DeletePrevious;
static int Vcanna_fn_KillToEndOfLine = IROHA_FN_KillToEndOfLine;
static int Vcanna_fn_Henkan = IROHA_FN_Henkan;
static int Vcanna_fn_Kakutei = IROHA_FN_Kakutei;
static int Vcanna_fn_Extend = IROHA_FN_Extend;
static int Vcanna_fn_Shrink = IROHA_FN_Shrink;
#ifdef CANNA_FN_AdjustBunsetsu
static int Vcanna_fn_AdjustBunsetsu = CANNA_FN_AdjustBunsetsu;
#endif
static int Vcanna_fn_Quit = IROHA_FN_Quit;
static int Vcanna_fn_ConvertAsHex = IROHA_FN_ConvertAsHex;
static int Vcanna_fn_ConvertAsBushu = IROHA_FN_ConvertAsBushu;
static int Vcanna_fn_KouhoIchiran = IROHA_FN_KouhoIchiran;
static int Vcanna_fn_BubunMuhenkan = IROHA_FN_BubunMuhenkan;
static int Vcanna_fn_Zenkaku = IROHA_FN_Zenkaku;
static int Vcanna_fn_Hankaku = IROHA_FN_Hankaku;
static int Vcanna_fn_ToUpper = IROHA_FN_ToUpper;
static int Vcanna_fn_Capitalize = IROHA_FN_Capitalize;
static int Vcanna_fn_ToLower = IROHA_FN_ToLower;
static int Vcanna_fn_Hiragana = IROHA_FN_Hiragana;
static int Vcanna_fn_Katakana = IROHA_FN_Katakana;
static int Vcanna_fn_Romaji = IROHA_FN_Romaji;
#ifdef CANNA_FN_BaseHiragana
static int Vcanna_fn_BaseHiragana = CANNA_FN_BaseHiragana;
static int Vcanna_fn_BaseKatakana = CANNA_FN_BaseKatakana;
static int Vcanna_fn_BaseEisu = CANNA_FN_BaseEisu;
static int Vcanna_fn_BaseZenkaku = CANNA_FN_BaseZenkaku;
static int Vcanna_fn_BaseHankaku = CANNA_FN_BaseHankaku;
static int Vcanna_fn_BaseKana = CANNA_FN_BaseKana;
static int Vcanna_fn_BaseKakutei = CANNA_FN_BaseKakutei;
static int Vcanna_fn_BaseHenkan = CANNA_FN_BaseHenkan;
static int Vcanna_fn_BaseHiraKataToggle = CANNA_FN_BaseHiraKataToggle;
static int Vcanna_fn_BaseZenHanToggle = CANNA_FN_BaseZenHanToggle;
static int Vcanna_fn_BaseKanaEisuToggle = CANNA_FN_BaseKanaEisuToggle;
static int Vcanna_fn_BaseKakuteiHenkanToggle =
  CANNA_FN_BaseKakuteiHenkanToggle;
static int Vcanna_fn_BaseRotateForward = CANNA_FN_BaseRotateForward;
static int Vcanna_fn_BaseRotateBackward = CANNA_FN_BaseRotateBackward;
#endif
static int Vcanna_fn_ExtendMode = IROHA_FN_ExtendMode;
static int Vcanna_fn_Touroku = IROHA_FN_Touroku;
static int Vcanna_fn_HexMode = IROHA_FN_HexMode;
static int Vcanna_fn_BushuMode = IROHA_FN_BushuMode;
static int Vcanna_fn_KigouMode = IROHA_FN_KigouMode;
#ifdef CANNA_FN_Mark
static int Vcanna_fn_Mark = CANNA_FN_Mark;
#endif
#ifdef CANNA_FN_TemporalMode
static int Vcanna_fn_TemporalMode = CANNA_FN_TemporalMode;
#endif

static int Vcanna_key_Nfer = IROHA_KEY_Nfer;
static int Vcanna_key_Xfer = IROHA_KEY_Xfer;
static int Vcanna_key_Up = IROHA_KEY_Up;
static int Vcanna_key_Left = IROHA_KEY_Left;
static int Vcanna_key_Right = IROHA_KEY_Right;
static int Vcanna_key_Down = IROHA_KEY_Down;
static int Vcanna_key_Insert = IROHA_KEY_Insert;
static int Vcanna_key_Rollup = IROHA_KEY_Rollup;
static int Vcanna_key_Rolldown = IROHA_KEY_Rolldown;
static int Vcanna_key_Home = IROHA_KEY_Home;
static int Vcanna_key_Help = IROHA_KEY_Help;
static int Vcanna_key_KP_Key = IROHA_KEY_KP_Key;
static int Vcanna_key_Shift_Nfer = IROHA_KEY_Shift_Nfer;
static int Vcanna_key_Shift_Xfer = IROHA_KEY_Shift_Xfer;
static int Vcanna_key_Shift_Up = IROHA_KEY_Shift_Up;
static int Vcanna_key_Shift_Left = IROHA_KEY_Shift_Left;
static int Vcanna_key_Shift_Right = IROHA_KEY_Shift_Right;
static int Vcanna_key_Shift_Down = IROHA_KEY_Shift_Down;
static int Vcanna_key_Cntrl_Nfer = IROHA_KEY_Cntrl_Nfer;
static int Vcanna_key_Cntrl_Xfer = IROHA_KEY_Cntrl_Xfer;
static int Vcanna_key_Cntrl_Up = IROHA_KEY_Cntrl_Up;
static int Vcanna_key_Cntrl_Left = IROHA_KEY_Cntrl_Left;
static int Vcanna_key_Cntrl_Right = IROHA_KEY_Cntrl_Right;
static int Vcanna_key_Cntrl_Down = IROHA_KEY_Cntrl_Down;

Lisp_Object VCANNA; /* by MORIOKA Tomohiko <morioka@jaist.ac.jp>
		          1996/6/7 */

void
syms_of_mule_canna (void)
{
  DEFVAR_LISP ("CANNA", &VCANNA);		/* hir@nec, 1992.5.21 */
  VCANNA = Qt;					/* hir@nec, 1992.5.21 */
  
  DEFSUBR (Fcanna_key_proc);
  DEFSUBR (Fcanna_initialize);
  DEFSUBR (Fcanna_finalize);
  DEFSUBR (Fcanna_touroku_string);
  DEFSUBR (Fcanna_set_width);
  DEFSUBR (Fcanna_change_mode);
  DEFSUBR (Fcanna_store_yomi);
  DEFSUBR (Fcanna_do_function);
  DEFSUBR (Fcanna_parse);
  DEFSUBR (Fcanna_query_mode);
  DEFSUBR (Fcanna_set_bunsetsu);

  DEFSUBR (Fcanna_henkan_begin);
  DEFSUBR (Fcanna_henkan_next);
  DEFSUBR (Fcanna_bunsetu_henkou);
  DEFSUBR (Fcanna_henkan_kakutei);
  DEFSUBR (Fcanna_henkan_end);
  DEFSUBR (Fcanna_henkan_quit);
}

void
vars_of_mule_canna (void)
{
  DEFVAR_LISP ("canna-kakutei-string", &Vcanna_kakutei_string /*

*/ );
  DEFVAR_LISP ("canna-kakutei-yomi",   &Vcanna_kakutei_yomi /*

*/ );
  DEFVAR_LISP ("canna-kakutei-romaji", &Vcanna_kakutei_romaji /*

*/ );
  DEFVAR_LISP ("canna-henkan-string",  &Vcanna_henkan_string /*

*/ );
  DEFVAR_INT ("canna-henkan-length",  &Vcanna_henkan_length /*

*/ );
  DEFVAR_INT ("canna-henkan-revpos",  &Vcanna_henkan_revPos /*

*/ );
  DEFVAR_INT ("canna-henkan-revlen",  &Vcanna_henkan_revLen /*

*/ );
  DEFVAR_LISP ("canna-ichiran-string", &Vcanna_ichiran_string /*

*/ );
  DEFVAR_INT ("canna-ichiran-length", &Vcanna_ichiran_length /*

*/ );
  DEFVAR_INT ("canna-ichiran-revpos", &Vcanna_ichiran_revPos /*

*/ );
  DEFVAR_INT ("canna-ichiran-revlen", &Vcanna_ichiran_revLen /*

*/ );
  DEFVAR_LISP ("canna-mode-string",    &Vcanna_mode_string /*

*/ );

  DEFVAR_BOOL ("canna-empty-info", &Vcanna_empty_info /*
For canna
*/ );
  DEFVAR_BOOL ("canna-through-info", &Vcanna_through_info /*
For canna
*/ );
  DEFVAR_BOOL ("canna-underline", &Vcanna_underline /*
For canna
*/ );
  DEFVAR_BOOL ("canna-inhibit-hankakukana", &Vcanna_inhibit_hankakukana /*
For canna
*/ );

  DEFVAR_INT ("canna-mode-alpha-mode", &Vcanna_mode_AlphaMode /*

*/ );
  DEFVAR_INT ("canna-mode-empty-mode", &Vcanna_mode_EmptyMode /*

*/ );
  DEFVAR_INT ("canna-mode-kigo-mode",  &Vcanna_mode_KigoMode /*

*/ );
  DEFVAR_INT ("canna-mode-yomi-mode",  &Vcanna_mode_YomiMode /*

*/ );
  DEFVAR_INT ("canna-mode-jishu-mode", &Vcanna_mode_JishuMode /*

*/ );
  DEFVAR_INT ("canna-mode-tankouho-mode", &Vcanna_mode_TankouhoMode /*

*/ );
  DEFVAR_INT ("canna-mode-ichiran-mode",  &Vcanna_mode_IchiranMode /*

*/ );
  DEFVAR_INT ("canna-mode-yes-no-mode", &Vcanna_mode_YesNoMode /*

*/ );
  DEFVAR_INT ("canna-mode-on-off-mode", &Vcanna_mode_OnOffMode /*

*/ );
#ifdef CANNA_MODE_AdjustBunsetsuMode
  DEFVAR_INT ("canna-mode-adjust-bunsetsu-mode",
	      &Vcanna_mode_AdjustBunsetsuMode /*

*/ );
#endif
#ifdef CANNA_MODE_ChikujiYomiMode
  DEFVAR_INT ("canna-mode-chikuji-yomi-mode", &Vcanna_mode_ChikujiYomiMode /*

*/ );
  DEFVAR_INT ("canna-mode-chikuji-bunsetsu-mode",
	      &Vcanna_mode_ChikujiTanMode /*

*/ );
#endif

  DEFVAR_INT ("canna-mode-henkan-mode", &Vcanna_mode_HenkanMode /*

*/ );
#ifdef CANNA_MODE_HenkanNyuryokuMode
  DEFVAR_INT ("canna-mode-henkan-nyuuryoku-mode",
	      &Vcanna_mode_HenkanNyuryokuMode /*

*/ );
#endif
#ifdef CANNA_MODE_ZenHiraHenkanMode
  DEFVAR_INT ("canna-mode-zen-hira-henkan-mode",
	      &Vcanna_mode_ZenHiraHenkanMode /*

*/ );
#ifdef CANNA_MODE_HanHiraHenkanMode
  DEFVAR_INT ("canna-mode-han-hira-henkan-mode",
	      &Vcanna_mode_HanHiraHenkanMode /*

*/ );
#endif
  DEFVAR_INT ("canna-mode-zen-kata-henkan-mode",
	      &Vcanna_mode_ZenKataHenkanMode /*

*/ );
  DEFVAR_INT ("canna-mode-han-kata-henkan-mode",
	      &Vcanna_mode_HanKataHenkanMode /*

*/ );
  DEFVAR_INT ("canna-mode-zen-alpha-henkan-mode",
	      &Vcanna_mode_ZenAlphaHenkanMode /*

*/ );
  DEFVAR_INT ("canna-mode-han-alpha-henkan-mode",
	      &Vcanna_mode_HanAlphaHenkanMode /*

*/ );
#endif
  DEFVAR_INT ("canna-mode-zen-hira-kakutei-mode",
	      &Vcanna_mode_ZenHiraKakuteiMode /*

*/ );
#ifdef CANNA_MODE_HanHiraKakuteiMode
  DEFVAR_INT ("canna-mode-han-hira-kakutei-mode",
	      &Vcanna_mode_HanHiraKakuteiMode /*

*/ );
#endif
  DEFVAR_INT ("canna-mode-zen-kata-kakutei-mode",
	      &Vcanna_mode_ZenKataKakuteiMode /*

*/ );
  DEFVAR_INT ("canna-mode-han-kata-kakutei-mode",
	      &Vcanna_mode_HanKataKakuteiMode /*

*/ );
  DEFVAR_INT ("canna-mode-zen-alpha-kakutei-mode",
	      &Vcanna_mode_ZenAlphaKakuteiMode /*

*/ );
  DEFVAR_INT ("canna-mode-han-alpha-kakutei-mode",
	      &Vcanna_mode_HanAlphaKakuteiMode /*

*/ );
  DEFVAR_INT ("canna-mode-hex-mode", &Vcanna_mode_HexMode /*

*/ );
  DEFVAR_INT ("canna-mode-bushu-mode", &Vcanna_mode_BushuMode /*

*/ );
  DEFVAR_INT ("canna-mode-extend-mode", &Vcanna_mode_ExtendMode /*

*/ );
  DEFVAR_INT ("canna-mode-russian-mode", &Vcanna_mode_RussianMode /*

*/ );
  DEFVAR_INT ("canna-mode-greek-mode", &Vcanna_mode_GreekMode /*

*/ );
  DEFVAR_INT ("canna-mode-line-mode", &Vcanna_mode_LineMode /*

*/ );
  DEFVAR_INT ("canna-mode-changing-server-mode",
	      &Vcanna_mode_ChangingServerMode /*

*/ );
  DEFVAR_INT ("canna-mode-henkan-method-mode",
	      &Vcanna_mode_HenkanMethodMode /*

*/ );
  DEFVAR_INT ("canna-mode-delete-dic-mode", &Vcanna_mode_DeleteDicMode /*

*/ );
  DEFVAR_INT ("canna-mode-touroku-mode", &Vcanna_mode_TourokuMode /*

*/ );
  DEFVAR_INT ("canna-mode-touroku-empty-mode",
	      &Vcanna_mode_TourokuEmptyMode /*

*/ );
  DEFVAR_INT ("canna-mode-touroku-hinshi-mode",
	      &Vcanna_mode_TourokuHinshiMode /*

*/ );
  DEFVAR_INT ("canna-mode-touroku-dic-mode", &Vcanna_mode_TourokuDicMode /*

*/ );
  DEFVAR_INT ("canna-mode-quoted-insert-mode",
	      &Vcanna_mode_QuotedInsertMode /*

*/ );
  DEFVAR_INT ("canna-mode-bubun-muhenkan-mode",
	      &Vcanna_mode_BubunMuhenkanMode /*

*/ );
  DEFVAR_INT ("canna-mode-mount-dic-mode", &Vcanna_mode_MountDicMode /*

*/ );

  DEFVAR_INT ("canna-func-self-insert", &Vcanna_fn_SelfInsert  /*

*/ );
  DEFVAR_INT ("canna-func-functional-insert", &Vcanna_fn_FunctionalInsert  /*

*/ );
  DEFVAR_INT ("canna-func-quoted-insert", &Vcanna_fn_QuotedInsert  /*

*/ );
  DEFVAR_INT ("canna-func-japanese-mode", &Vcanna_fn_JapaneseMode  /*

*/ );
  DEFVAR_INT ("canna-func-alpha-mode", &Vcanna_fn_AlphaMode  /*

*/ );
  DEFVAR_INT ("canna-func-henkan-nyuryoku-mode",
	      &Vcanna_fn_HenkanNyuryokuMode  /*

*/ );
  DEFVAR_INT ("canna-func-forward", &Vcanna_fn_Forward  /*

*/ );
  DEFVAR_INT ("canna-func-backward", &Vcanna_fn_Backward  /*

*/ );
  DEFVAR_INT ("canna-func-next", &Vcanna_fn_Next  /*

*/ );
  DEFVAR_INT ("canna-func-previous", &Vcanna_fn_Prev  /*

*/ );
  DEFVAR_INT ("canna-func-beginning-of-line", &Vcanna_fn_BeginningOfLine  /*

*/ );
  DEFVAR_INT ("canna-func-end-of-line", &Vcanna_fn_EndOfLine  /*

*/ );
  DEFVAR_INT ("canna-func-delete-next", &Vcanna_fn_DeleteNext  /*

*/ );
  DEFVAR_INT ("canna-func-delete_previous", &Vcanna_fn_DeletePrevious  /*

*/ );
  DEFVAR_INT ("canna-func-kill-to-end-of-line", &Vcanna_fn_KillToEndOfLine /*

*/ );
  DEFVAR_INT ("canna-func-henkan", &Vcanna_fn_Henkan  /*

*/ );
  DEFVAR_INT ("canna-func-kakutei", &Vcanna_fn_Kakutei  /*

*/ );
  DEFVAR_INT ("canna-func-extend", &Vcanna_fn_Extend  /*

*/ );
  DEFVAR_INT ("canna-func-shrink", &Vcanna_fn_Shrink  /*

*/ );
#ifdef CANNA_FN_AdjustBunsetsu
  DEFVAR_INT ("canna-func-adjust-bunsetsu", &Vcanna_fn_AdjustBunsetsu  /*

*/ );
#endif
  DEFVAR_INT ("canna-func-quit", &Vcanna_fn_Quit  /*

*/ );
  DEFVAR_INT ("canna-func-convert-as-hex", &Vcanna_fn_ConvertAsHex  /*

*/ );
  DEFVAR_INT ("canna-func-convert-as-bushu", &Vcanna_fn_ConvertAsBushu  /*

*/ );
  DEFVAR_INT ("canna-func-kouho-ichiran", &Vcanna_fn_KouhoIchiran  /*

*/ );
  DEFVAR_INT ("canna-func-bubun-muhenkan", &Vcanna_fn_BubunMuhenkan  /*

*/ );
  DEFVAR_INT ("canna-func-zenkaku", &Vcanna_fn_Zenkaku  /*

*/ );
  DEFVAR_INT ("canna-func-hankaku", &Vcanna_fn_Hankaku  /*

*/ );
  DEFVAR_INT ("canna-func-to-upper", &Vcanna_fn_ToUpper  /*

*/ );
  DEFVAR_INT ("canna-func-capitalize", &Vcanna_fn_Capitalize  /*

*/ );
  DEFVAR_INT ("canna-func-to-lower", &Vcanna_fn_ToLower  /*

*/ );
  DEFVAR_INT ("canna-func-hiragana", &Vcanna_fn_Hiragana  /*

*/ );
  DEFVAR_INT ("canna-func-katakana", &Vcanna_fn_Katakana  /*

*/ );
  DEFVAR_INT ("canna-func-romaji", &Vcanna_fn_Romaji  /*

*/ );
#ifdef CANNA_FN_BaseHiragana
  DEFVAR_INT ("canna-func-base-hiragana", &Vcanna_fn_BaseHiragana  /*

*/ );
  DEFVAR_INT ("canna-func-base-katakana", &Vcanna_fn_BaseKatakana  /*

*/ );
  DEFVAR_INT ("canna-func-base-eisu", &Vcanna_fn_BaseEisu  /*

*/ );
  DEFVAR_INT ("canna-func-base-zenkaku", &Vcanna_fn_BaseZenkaku  /*

*/ );
  DEFVAR_INT ("canna-func-base-hankaku", &Vcanna_fn_BaseHankaku  /*

*/ );
  DEFVAR_INT ("canna-func-base-kana", &Vcanna_fn_BaseKana  /*

*/ );
  DEFVAR_INT ("canna-func-base-kakutei", &Vcanna_fn_BaseKakutei  /*

*/ );
  DEFVAR_INT ("canna-func-base-henkan", &Vcanna_fn_BaseHenkan  /*

*/ );
  DEFVAR_INT ("canna-func-base-hiragana-katakana-toggle",
	      &Vcanna_fn_BaseHiraKataToggle  /*

*/ );
  DEFVAR_INT ("canna-func-base-zenkaku-hankaku-toggle",
	      &Vcanna_fn_BaseZenHanToggle  /*

*/ );
  DEFVAR_INT ("canna-func-base-kana-eisu-toggle",
	      &Vcanna_fn_BaseKanaEisuToggle  /*

*/ );
  DEFVAR_INT ("canna-func-base-kakutei-henkan-toggle",
	      &Vcanna_fn_BaseKakuteiHenkanToggle  /*

*/ );
  DEFVAR_INT ("canna-func-base-rotate-forward",
	      &Vcanna_fn_BaseRotateForward  /*

*/ );
  DEFVAR_INT ("canna-func-base-rotate-backward",
	      &Vcanna_fn_BaseRotateBackward  /*

*/ );
#endif
  DEFVAR_INT ("canna-func-extend-mode", &Vcanna_fn_ExtendMode  /*

*/ );
  DEFVAR_INT ("canna-func-touroku", &Vcanna_fn_Touroku  /*

*/ );
  DEFVAR_INT ("canna-func-hex-mode", &Vcanna_fn_HexMode  /*

*/ );
  DEFVAR_INT ("canna-func-bushu-mode", &Vcanna_fn_BushuMode  /*

*/ );
  DEFVAR_INT ("canna-func-kigo-mode", &Vcanna_fn_KigouMode  /*

*/ );
#ifdef CANNA_FN_Mark
  DEFVAR_INT ("canna-func-mark", &Vcanna_fn_Mark  /*

*/ );
#endif
#ifdef CANNA_FN_TemporalMode
  DEFVAR_INT ("canna-func-temporal-mode", &Vcanna_fn_TemporalMode  /*

*/ );
#endif

  DEFVAR_INT ("canna-key-nfer", &Vcanna_key_Nfer /*

*/ );
  DEFVAR_INT ("canna-key-xfer", &Vcanna_key_Xfer /*

*/ );
  DEFVAR_INT ("canna-key-up", &Vcanna_key_Up /*

*/ );
  DEFVAR_INT ("canna-key-left", &Vcanna_key_Left /*

*/ );
  DEFVAR_INT ("canna-key-right", &Vcanna_key_Right /*

*/ );
  DEFVAR_INT ("canna-key-down", &Vcanna_key_Down /*

*/ );
  DEFVAR_INT ("canna-key-insert", &Vcanna_key_Insert /*

*/ );
  DEFVAR_INT ("canna-key-rollup", &Vcanna_key_Rollup /*

*/ );
  DEFVAR_INT ("canna-key-rolldown", &Vcanna_key_Rolldown /*

*/ );
  DEFVAR_INT ("canna-key-home", &Vcanna_key_Home /*

*/ );
  DEFVAR_INT ("canna-key-help", &Vcanna_key_Help /*

*/ );
  DEFVAR_INT ("canna-key-kp-key", &Vcanna_key_KP_Key /*

*/ );
  DEFVAR_INT ("canna-key-shift-nfer", &Vcanna_key_Shift_Nfer /*

*/ );
  DEFVAR_INT ("canna-key-shift-xfer", &Vcanna_key_Shift_Xfer /*

*/ );
  DEFVAR_INT ("canna-key-shift-up", &Vcanna_key_Shift_Up /*

*/ );
  DEFVAR_INT ("canna-key-shift-left", &Vcanna_key_Shift_Left /*

*/ );
  DEFVAR_INT ("canna-key-shift-right", &Vcanna_key_Shift_Right /*

*/ );
  DEFVAR_INT ("canna-key-shift-down", &Vcanna_key_Shift_Down /*

*/ );
  DEFVAR_INT ("canna-key-control-nfer", &Vcanna_key_Cntrl_Nfer /*

*/ );
  DEFVAR_INT ("canna-key-control-xfer", &Vcanna_key_Cntrl_Xfer /*

*/ );
  DEFVAR_INT ("canna-key-control-up", &Vcanna_key_Cntrl_Up /*

*/ );
  DEFVAR_INT ("canna-key-control-left", &Vcanna_key_Cntrl_Left /*

*/ );
  DEFVAR_INT ("canna-key-control-right", &Vcanna_key_Cntrl_Right /*

*/ );
  DEFVAR_INT ("canna-key-control-down", &Vcanna_key_Cntrl_Down /*

*/ );

  Fprovide(intern("CANNA"));
}

#ifdef CANNA_MULE
/* To handle MULE internal code and EUC.
   I assume CANNA can handle only Japanese EUC. */

/* EUC multibyte string to MULE internal string */

static void
c2mu (char *cp, int l, char *mp)
{
  char	ch, *ep = cp+l;
  
  while ((cp < ep) && (ch = *cp))
    {
      if ((unsigned char) ch == ISO_CODE_SS2)
	{
	  *mp++ = LEADING_BYTE_KATAKANA_JISX0201;
	  cp++;
	}
      else if ((unsigned char) ch == ISO_CODE_SS3)
	{
	  *mp++ = LEADING_BYTE_JAPANESE_JISX0212;
	  cp++;
	  *mp++ = *cp++;
	}
      else if (ch & 0x80)
	{
	  *mp++ = LEADING_BYTE_JAPANESE_JISX0208;
	  *mp++ = *cp++;
	}
      *mp++ = *cp++;
    }
  *mp = 0;
}

/* MULE internal string to EUC multibyte string */

static void
m2c (unsigned char *mp, int l, unsigned char *cp)
{
  unsigned char	ch, *ep = mp + l;;
  
  while ((mp < ep) && (ch = *mp++))
    {
      switch (ch)
	{
	case LEADING_BYTE_KATAKANA_JISX0201:
	  *cp++ = ISO_CODE_SS2;
	  *cp++ = *mp++;
	  break;
	case LEADING_BYTE_JAPANESE_JISX0212:
	  *cp++ = ISO_CODE_SS3;
	case LEADING_BYTE_JAPANESE_JISX0208:
	  *cp++ = *mp++;
	  *cp++ = *mp++;
	  break;
	default:
	  *cp++ = ch;
	  break;
	}
    }	
  *cp = 0;
}

#undef make_string

/* make_string after converting EUC string to MULE internal string */
static Lisp_Object
mule_make_string (unsigned char *p, int l)
{
  unsigned char cbuf[4096];
  
  c2mu (p,l,cbuf);
  return (make_string (cbuf,strlen (cbuf)));
}	

/* return the MULE internal string length of EUC string */
/* Modified by sb to return a character count not byte count. */
static int
mule_strlen (unsigned char *p, int l)
{
  unsigned char ch, *cp = p;
  int len = 0;
  
  while ((cp < p + l) && (ch = *cp))
    {
      if ((unsigned char) ch == ISO_CODE_SS2)
	{
	  len++;
	  cp += 2;
	}
      else if ((unsigned char) ch == ISO_CODE_SS3)
	{
	  len++;
	  cp += 3;
	}
      else if (ch & 0x80)
	{
	  len++;
	  cp += 2;
	}
      else
	{
	  len++;
	  cp++;	
	}
    }
  return (len);
}

/* count number of characters */
static void
count_char (unsigned char *p, int len, int pos, int rev, int *clen, int *cpos,
	    int *crev)
{
  unsigned char *q = p;
  
  *clen = *cpos = *crev = 0;
  if (len == 0) return;
  while (q < p + pos)
    {
      (*clen)++;
      (*cpos)++;
      if (*q++ & 0x80) q++;
    }
  while (q < p + pos + rev)
    {
      (*clen)++;
      (*crev)++;
      if (*q++ & 0x80) q++;
    }		
  while (q < p + len)
    {
      (*clen)++;
      if (*q++ & 0x80) q++;
    }
}
#endif /* CANNA_MULE */
