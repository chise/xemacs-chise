# Makefile for the XEmacs Reference Manual.

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

# Modified by Ben Wing, February 1994

NAME=xemacs

MAKEINFO = makeinfo
TEXI2DVI = texi2dvi

# List of all the texinfo files in the manual:

srcs = xemacs.texi abbrevs.texi basic.texi buffers.texi building.texi \
  calendar.texi cmdargs.texi custom.texi display.texi entering.texi \
  files.texi fixit.texi glossary.texi gnu.texi help.texi indent.texi \
  keystrokes.texi killing.texi xemacs.texi m-x.texi major.texi mark.texi \
  menus.texi mini.texi misc.texi mouse.texi new.texi picture.texi \
  programs.texi reading.texi regs.texi frame.texi search.texi sending.texi \
  text.texi trouble.texi undo.texi windows.texi

all : info
info : ../../info/$(NAME).info

dvi: $(NAME).dvi
.texi.dvi :
	$(TEXI2DVI) $<

../../info/$(NAME).info: $(srcs)
	$(MAKEINFO) -o $@ $(NAME).texi

.PHONY: mostlyclean clean distclean realclean extraclean
mostlyclean:
	rm -f *.toc *.aux *.oaux *.log *.cp *.cps *.fn *.fns *.tp *.tps \
              *.vr *.vrs *.pg *.pgs *.ky *.kys
clean: mostlyclean
	rm -f *.dvi *.ps make.out core
distclean: clean
realclean: distclean
extraclean: distclean
	-rm -f *~ \#*
