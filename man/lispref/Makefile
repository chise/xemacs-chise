# Makefile for the  XEmacs Lisp Programmer's Manual.

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

VERSION=2.4
NAME=lispref
manual = elisp-manual-19-$(VERSION)

TEXI2DVI = texi2dvi
MAKEINFO = makeinfo

# Uncomment this line for permuted index.
# permuted_index = 1 

# List of all the texinfo files in the manual:

srcs = abbrevs.texi annotations.texi back.texi backups.texi buffers.texi \
  building.texi commands.texi compile.texi consoles-devices.texi control.texi \
  databases.texi debugging.texi dialog.texi display.texi edebug-inc.texi \
  edebug.texi errors.texi eval.texi extents.texi faces.texi files.texi \
  frames.texi functions.texi glyphs.texi hash-tables.texi help.texi \
  hooks.texi index.texi internationalization.texi intro.texi \
  keymaps.texi ldap.texi lispref.texi lists.texi loading.texi locals.texi \
  macros.texi maps.texi markers.texi menus.texi minibuf.texi modes.texi \
  mouse.texi mule.texi numbers.texi objects.texi os.texi positions.texi \
  processes.texi range-tables.texi scrollbars.texi searching.texi \
  sequences.texi specifiers.texi streams.texi strings.texi symbols.texi \
  syntax.texi text.texi tips.texi toolbar.texi tooltalk.texi variables.texi \
  windows.texi x-windows.texi index.unperm index.perm

all : info
info : ../../info/$(NAME).info

../../info/$(NAME).info: $(srcs) index.texi
	$(MAKEINFO) -o $@ $(NAME).texi

dvi: $(NAME).dvi

$(NAME).dvi: $(srcs) index.texi
	# Avoid losing old contents of aux file entirely.
	-mv $(NAME).aux $(NAME).oaux
	# First shot to define xrefs:
	$(TEX) $(NAME).texi
	if [ a${permuted_index} != a ]; \
	then ./permute-index && mv permuted.fns $(NAME).fns; \
	else texindex $(NAME).??; \
	fi
	$(TEX) $(NAME).texi

index.texi:
	if [ a${permuted_index} != a ]; \
	then ln -s index.perm   index.texi; \
	else ln -s index.unperm index.texi; \
	fi

.PHONY: mostlyclean clean distclean realclean extraclean
mostlyclean:
	rm -f *.toc *.aux *.log *.cp *.cps *.fn *.fns *.tp *.tps \
              *.vr *.vrs *.pg *.pgs *.ky *.kys
clean: mostlyclean
	rm -f *.dvi *.ps make.out core index.texi
distclean: clean
realclean: distclean
extraclean: distclean
	-rm -f *~ \#*
