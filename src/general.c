/* Commonly-used symbols
   Copyright (C) 1995 Sun Microsystems.
   Copyright (C) 1995, 1996 Ben Wing.

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

/* Synched up with: Not in FSF. */

/* The purpose of this file is as a central place to stick symbols
   that don't have any obvious connection to any particular module
   and might be used in many different contexts.

   #### More should be put here.
   */

#include <config.h>
#include "lisp.h"

Lisp_Object Qactually_requested;
Lisp_Object Qafter;
Lisp_Object Qall;
Lisp_Object Qand;
Lisp_Object Qassoc;
Lisp_Object Qat;
Lisp_Object Qautodetect;
Lisp_Object Qbad_variable;
Lisp_Object Qbefore;
Lisp_Object Qbinary;
Lisp_Object Qbitmap;
Lisp_Object Qboolean;
Lisp_Object Qbottom;
Lisp_Object Qbottom_margin;
Lisp_Object Qbuffer;
Lisp_Object Qbutton;
Lisp_Object Qcenter;
Lisp_Object Qcategory;
Lisp_Object Qchannel;
Lisp_Object Qchar;
Lisp_Object Qcharacter;
Lisp_Object Qchars;
Lisp_Object Qcolor;
Lisp_Object Qcolumns;
Lisp_Object Qcommand;
Lisp_Object Qconsole;
Lisp_Object Qcritical;
Lisp_Object Qctext;
Lisp_Object Qcursor;
Lisp_Object Qdata;
Lisp_Object Qdead;
Lisp_Object Qdefault;
Lisp_Object Qdelete;
Lisp_Object Qdelq;
Lisp_Object Qdevice;
Lisp_Object Qdialog;
Lisp_Object Qdimension;
Lisp_Object Qdisplay;
Lisp_Object Qdoc_string;
Lisp_Object Qduplex;
Lisp_Object Qdynarr_overhead;
Lisp_Object Qempty;
Lisp_Object Qeq;
Lisp_Object Qeql;
Lisp_Object Qequal;
Lisp_Object Qeval;
Lisp_Object Qextents;
Lisp_Object Qface;
Lisp_Object Qfile_name;
Lisp_Object Qfont;
Lisp_Object Qframe;
Lisp_Object Qfunction;
Lisp_Object Qfuncall;
Lisp_Object Qgap_overhead;
Lisp_Object Qgeneric;
Lisp_Object Qgeometry;
Lisp_Object Qglobal;
Lisp_Object Qgutter;
Lisp_Object Qheight;
Lisp_Object Qhighlight;
Lisp_Object Qhorizontal;
Lisp_Object Qicon;
Lisp_Object Qid;
Lisp_Object Qimage;
Lisp_Object Qinfo;
Lisp_Object Qinherit;
Lisp_Object Qinteger;
Lisp_Object Qinternal;
Lisp_Object Qkey;
Lisp_Object Qkey_assoc;
Lisp_Object Qkeyboard;
Lisp_Object Qkeymap;
Lisp_Object Qlandscape;
Lisp_Object Qlast_command;
Lisp_Object Qleft;
Lisp_Object Qleft_margin;
Lisp_Object Qlet;
Lisp_Object Qlist;
Lisp_Object Qmagic;
Lisp_Object Qmalloc_overhead;
Lisp_Object Qmarkers;
Lisp_Object Qmax;
Lisp_Object Qmemory;
Lisp_Object Qmenubar;
Lisp_Object Qmessage;
Lisp_Object Qminus;
Lisp_Object Qmodifiers;
Lisp_Object Qmotion;
Lisp_Object Qmsprinter;
Lisp_Object Qmswindows;
Lisp_Object Qname;
Lisp_Object Qnone;
Lisp_Object Qnot;
Lisp_Object Qnothing;
Lisp_Object Qnotice;
Lisp_Object Qobject;
Lisp_Object Qold_assoc;
Lisp_Object Qold_delete;
Lisp_Object Qold_delq;
Lisp_Object Qold_rassoc;
Lisp_Object Qold_rassq;
Lisp_Object Qonly;
Lisp_Object Qor;
Lisp_Object Qorientation;
Lisp_Object Qother;
Lisp_Object Qpointer;
Lisp_Object Qpopup;
Lisp_Object Qportrait;
Lisp_Object Qprint;
Lisp_Object Qprinter;
Lisp_Object Qprocess;
Lisp_Object Qprovide;
Lisp_Object Qrassoc;
Lisp_Object Qrassq;
Lisp_Object Qrequire;
Lisp_Object Qresource;
Lisp_Object Qreturn;
Lisp_Object Qreverse;
Lisp_Object Qright;
Lisp_Object Qright_margin;
Lisp_Object Qsearch;
Lisp_Object Qselected;
Lisp_Object Qsignal;
Lisp_Object Qsimple;
Lisp_Object Qsize;
Lisp_Object Qspace;
Lisp_Object Qspecifier;
Lisp_Object Qstream;
Lisp_Object Qstring;
Lisp_Object Qsymbol;
Lisp_Object Qsyntax;
Lisp_Object Qterminal;
Lisp_Object Qtest;
Lisp_Object Qtext;
Lisp_Object Qthis_command;
Lisp_Object Qtimeout;
Lisp_Object Qtimestamp;
Lisp_Object Qtoolbar;
Lisp_Object Qtop;
Lisp_Object Qtop_margin;
Lisp_Object Qtty;
Lisp_Object Qtype;
Lisp_Object Qundecided;
Lisp_Object Qundefined;
Lisp_Object Qunimplemented;
Lisp_Object Qvalue_assoc;
Lisp_Object Qvertical;
Lisp_Object Qwarning;
Lisp_Object Qwidth;
Lisp_Object Qwidget;
Lisp_Object Qwindow;
Lisp_Object Qwindow_system;
Lisp_Object Qx;
Lisp_Object Qy;

void
syms_of_general (void)
{
  defsymbol (&Qactually_requested, "actually-requested");
  defsymbol (&Qafter, "after");
  defsymbol (&Qall, "all");
  defsymbol (&Qand, "and");
  defsymbol (&Qassoc, "assoc");
  defsymbol (&Qat, "at");
  defsymbol (&Qautodetect, "autodetect");
  defsymbol (&Qbad_variable, "bad-variable");
  defsymbol (&Qbefore, "before");
  defsymbol (&Qbinary, "binary");
  defsymbol (&Qbitmap, "bitmap");
  defsymbol (&Qboolean, "boolean");
  defsymbol (&Qbottom, "bottom");
  defsymbol (&Qbottom_margin, "bottom-margin");
  defsymbol (&Qbuffer, "buffer");
  defsymbol (&Qbutton, "button");
  defsymbol (&Qcategory, "category");
  defsymbol (&Qcenter, "center");
  defsymbol (&Qchannel, "channel");
  defsymbol (&Qchar, "char");
  defsymbol (&Qcharacter, "character");
  defsymbol (&Qchars, "chars");
  defsymbol (&Qcolor, "color");
  defsymbol (&Qcolumns, "columns");
  defsymbol (&Qcommand, "command");
  defsymbol (&Qconsole, "console");
  defsymbol (&Qcritical, "critical");
  defsymbol (&Qctext, "ctext");
  defsymbol (&Qcursor, "cursor");
  defsymbol (&Qdata, "data");
  defsymbol (&Qdead, "dead");
  defsymbol (&Qdefault, "default");
  defsymbol (&Qdelete, "delete");
  defsymbol (&Qdelq, "delq");
  defsymbol (&Qdevice, "device");
  defsymbol (&Qdialog, "dialog");
  defsymbol (&Qdimension, "dimension");
  defsymbol (&Qdisplay, "display");
  defsymbol (&Qdoc_string, "doc-string");
  defsymbol (&Qduplex, "duplex");
  defsymbol (&Qdynarr_overhead, "dynarr-overhead");
  defsymbol (&Qempty, "empty");
  defsymbol (&Qeq, "eq");
  defsymbol (&Qeql, "eql");
  defsymbol (&Qequal, "equal");
  defsymbol (&Qeval, "eval");
  defsymbol (&Qextents, "extents");
  defsymbol (&Qface, "face");
  defsymbol (&Qfile_name, "file-name");
  defsymbol (&Qfont, "font");
  defsymbol (&Qframe, "frame");
  defsymbol (&Qfunction, "function");
  defsymbol (&Qfuncall, "funcall");
  defsymbol (&Qgap_overhead, "gap-overhead");
  defsymbol (&Qgeneric, "generic");
  defsymbol (&Qgeometry, "geometry");
  defsymbol (&Qglobal, "global");
  defsymbol (&Qgutter, "gutter");
  defsymbol (&Qheight, "height");
  defsymbol (&Qhighlight, "highlight");
  defsymbol (&Qhorizontal, "horizontal");
  defsymbol (&Qicon, "icon");
  defsymbol (&Qid, "id");
  defsymbol (&Qimage, "image");
  defsymbol (&Qinfo, "info");
  defsymbol (&Qinherit, "inherit");
  defsymbol (&Qinteger, "integer");
  defsymbol (&Qinternal, "internal");
  defsymbol (&Qkey, "key");
  defsymbol (&Qkey_assoc, "key-assoc");
  defsymbol (&Qkeyboard, "keyboard");
  defsymbol (&Qkeymap, "keymap");
  defsymbol (&Qlandscape, "landscape");
  defsymbol (&Qlast_command, "last-command");
  defsymbol (&Qleft, "left");
  defsymbol (&Qleft_margin, "left-margin");
  defsymbol (&Qlet, "let");
  defsymbol (&Qlist, "list");
  defsymbol (&Qmagic, "magic");
  defsymbol (&Qmalloc_overhead, "malloc-overhead");
  defsymbol (&Qmarkers, "markers");
  defsymbol (&Qmax, "max");
  defsymbol (&Qmemory, "memory");
  defsymbol (&Qmenubar, "menubar");
  defsymbol (&Qmessage, "message");
  defsymbol (&Qminus, "-");
  defsymbol (&Qmodifiers, "modifiers");
  defsymbol (&Qmotion, "motion");
  defsymbol (&Qmsprinter, "msprinter");
  defsymbol (&Qmswindows, "mswindows");
  defsymbol (&Qname, "name");
  defsymbol (&Qnone, "none");
  defsymbol (&Qnot, "not");
  defsymbol (&Qnothing, "nothing");
  defsymbol (&Qnotice, "notice");
  defsymbol (&Qobject, "object");
  defsymbol (&Qold_assoc, "old-assoc");
  defsymbol (&Qold_delete, "old-delete");
  defsymbol (&Qold_delq, "old-delq");
  defsymbol (&Qold_rassoc, "old-rassoc");
  defsymbol (&Qold_rassq, "old-rassq");
  defsymbol (&Qonly, "only");
  defsymbol (&Qor, "or");
  defsymbol (&Qorientation, "orientation");
  defsymbol (&Qother, "other");
  defsymbol (&Qpointer, "pointer");
  defsymbol (&Qpopup, "popup");
  defsymbol (&Qportrait, "portrait");
  defsymbol (&Qprint, "print");
  defsymbol (&Qprinter, "printer");
  defsymbol (&Qprocess, "process");
  defsymbol (&Qprovide, "provide");
  defsymbol (&Qrassoc, "rassoc");
  defsymbol (&Qrassq, "rassq");
  defsymbol (&Qrequire, "require");
  defsymbol (&Qresource, "resource");
  defsymbol (&Qreturn, "return");
  defsymbol (&Qreverse, "reverse");
  defsymbol (&Qright, "right");
  defsymbol (&Qright_margin, "right-margin");
  defsymbol (&Qsearch, "search");
  defsymbol (&Qselected, "selected");
  defsymbol (&Qsignal, "signal");
  defsymbol (&Qsimple, "simple");
  defsymbol (&Qsize, "size");
  defsymbol (&Qspace, "space");
  defsymbol (&Qspecifier, "specifier");
  defsymbol (&Qstream, "stream");
  defsymbol (&Qstring, "string");
  defsymbol (&Qsymbol, "symbol");
  defsymbol (&Qsyntax, "syntax");
  defsymbol (&Qterminal, "terminal");
  defsymbol (&Qtest, "test");
  defsymbol (&Qtext, "text");
  defsymbol (&Qthis_command, "this-command");
  defsymbol (&Qtimeout, "timeout");
  defsymbol (&Qtimestamp, "timestamp");
  defsymbol (&Qtoolbar, "toolbar");
  defsymbol (&Qtop, "top");
  defsymbol (&Qtop_margin, "top-margin");
  defsymbol (&Qtty, "tty");
  defsymbol (&Qtype, "type");
  defsymbol (&Qundecided, "undecided");
  defsymbol (&Qundefined, "undefined");
  defsymbol (&Qunimplemented, "unimplemented");
  defsymbol (&Qvalue_assoc, "value-assoc");
  defsymbol (&Qvertical, "vertical");
  defsymbol (&Qwarning, "warning");
  defsymbol (&Qwidth, "width");
  defsymbol (&Qwidget, "widget");
  defsymbol (&Qwindow, "window");
  defsymbol (&Qwindow_system, "window-system");
  defsymbol (&Qx, "x");
  defsymbol (&Qy, "y");
}
