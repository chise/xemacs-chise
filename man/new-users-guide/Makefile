# Makefile for the XEmacs New Users Guide

# This file is part of XEmacs.

# XEmacs is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2, or (at your option) any
# later version.

# XEmacs is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.

# You should have received a copy of the GNU General Public License
# along with XEmacs; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA.

NAME=new-users-guide

SHELL = /bin/sh
TEXI2DVI = texi2dvi
MAKEINFO = makeinfo

# List of all the texinfo files in the manual:

srcs = new-users-guide.texi custom1.texi files.texi region.texi \
  custom2.texi help.texi search.texi edit.texi modes.texi \
  xmenu.texi enter.texi

all : info
info : ../../info/$(NAME).info

../../info/$(NAME).info: $(srcs)
	$(MAKEINFO) -o $@ $(NAME).texi

dvi : $(NAME).dvi
.texi.dvi :
	$(TEXI2DVI) $<

.PHONY: mostlyclean clean distclean realclean extraclean
mostlyclean:
	rm -f *.toc *.aux *.oaux *.log *.cp *.cps *.fn *.fns *.tp *.tps \
              *.vr *.vrs *.pg *.pgs *.ky *.kys
clean: mostlyclean
	rm -f *.dvi *.ps make.out core
distclean:  clean
realclean:  clean
extraclean: clean
	-rm -f *~ \#*
