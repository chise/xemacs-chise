#  Makefile for man subdirectory in XEmacs
#   Copyright (C) 1995 Board of Trustees, University of Illinois
#   Copyright (C) 1994, 1995 Sun Microsystems.

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

# Avoid trouble on systems where the "SHELL" variable might be
# inherited from the environment.
SHELL = /bin/sh

EMACS = ../src/xemacs
EMACSFLAGS = -batch -q -no-site-file 

# NOTE:  You *must* have makeinfo-1.68 or later to rebuild the
# info tree.
MAKEINFO = makeinfo
TEXI2DVI = texi2dvi

.SUFFIXES:
.SUFFIXES: .info .texi .dvi

RECURSIVE_MAKE = $(MAKE) $(MFLAGS) MAKEINFO='$(MAKEINFO)' TEXI2DVI='$(TEXI2DVI)'

# Ughhh!  The things we do to have portable makefiles...

INFODIR = ../info

info_files = \
	$(INFODIR)/cl.info \
	$(INFODIR)/custom.info \
	$(INFODIR)/external-widget.info \
	$(INFODIR)/info.info \
	$(INFODIR)/standards.info \
	$(INFODIR)/term.info \
	$(INFODIR)/termcap.info \
	$(INFODIR)/texinfo.info \
	$(INFODIR)/widget.info \
	$(INFODIR)/xemacs-faq.info

dvi_files = \
	cl.dvi \
	custom.dvi \
	external-widget.dvi \
	info.dvi \
	standards.dvi \
	term.dvi \
	termcap.dvi \
	texinfo.dvi \
	widget.dvi \
	xemacs-faq.dvi

../info/cl.info : cl.texi
	-$(MAKEINFO) cl.texi -o ../info/cl.info

../info/custom.info : custom.texi
	-$(MAKEINFO) custom.texi -o ../info/custom.info

../info/external-widget.info : external-widget.texi
	-$(MAKEINFO) external-widget.texi -o ../info/external-widget.info

../info/info.info : info.texi
	-$(MAKEINFO) info.texi -o ../info/info.info

../info/standards.info : standards.texi
	-$(MAKEINFO) standards.texi -o ../info/standards.info

../info/term.info : term.texi
	-$(MAKEINFO) term.texi -o ../info/term.info

../info/termcap.info : termcap.texi
	-$(MAKEINFO) termcap.texi -o ../info/termcap.info

../info/texinfo.info : texinfo.texi
	-$(MAKEINFO) texinfo.texi -o ../info/texinfo.info

../info/widget.info : widget.texi
	-$(MAKEINFO) widget.texi -o ../info/widget.info

../info/xemacs-faq.info : xemacs-faq.texi
	-$(MAKEINFO) xemacs-faq.texi -o ../info/xemacs-faq.info


# ../info/w3.info : w3.texi
#	-$(MAKEINFO) w3.texi -o ../info/w3.info

# ../info/vm.info : vm.texi
#	-$(EMACS) $(EMACSFLAGS) -insert vm.texi -l texinfmt \
#		-f texinfo-format-buffer -f save-buffer
#	-mv vm.info* ../info

# special = # ../info/w3.info ../info/vm.info ../info/texinfo.info

all: info

# Subdirectories to make recursively.
SUBDIR = xemacs lispref new-users-guide internals
.PHONY: $(SUBDIR)

info : $(info_files)
	-for d in $(SUBDIR) ; do (cd ./$$d && $(RECURSIVE_MAKE) $@) ; done

.PHONY: info dvi

xemacs: FRC.xemacs
	-cd ./$@ && $(RECURSIVE_MAKE)
lispref: FRC.lispref
	-cd ./$@ && $(RECURSIVE_MAKE)
new-users-guide: FRC.new-users-guide
	-cd ./$@ && $(RECURSIVE_MAKE)
internals: FRC.internals
	-cd ./$@ && $(RECURSIVE_MAKE)
# tm: FRC.tm
#	-cd ./$@ && $(RECURSIVE_MAKE)
# gnats: FRC.gnats
#	-cd ./$@ && $(RECURSIVE_MAKE)
# FRC.xemacs FRC.lispref FRC.new-users-guide FRC.internals FRC.tm FRC.gnats:
FRC.info FRC.dvi FRC.xemacs FRC.lispref FRC.new-users-guide FRC.internals:


.texi.dvi:
	$(TEXI2DVI) $<

dvi : $(dvi_files)
	-for d in $(SUBDIR) ; do (cd ./$${d} && $(RECURSIVE_MAKE) $@) ; done


.PHONY: mostlyclean clean distclean realclean extraclean
mostlyclean:
	-for d in $(SUBDIR) ; do (cd ./$${d} && $(RECURSIVE_MAKE) $@) ; done
	rm -f *.toc *.aux *.log *.op \
	      *.cp *.cps *.fn *.fns *.ky *.kys *.pg *.pgs *.vr *.vrs *.tp *.tps
clean: mostlyclean
	-for d in $(SUBDIR) ; do (cd ./$${d} && $(RECURSIVE_MAKE) $@) ; done
	rm -f *.o core *.dvi
distclean: clean
	-for d in $(SUBDIR) ; do (cd ./$${d} && $(RECURSIVE_MAKE) $@) ; done
realclean: distclean
	-for d in $(SUBDIR) ; do (cd ./$${d} && $(RECURSIVE_MAKE) $@) ; done
extraclean: distclean
	-for d in $(SUBDIR) ; do (cd ./$${d} && $(RECURSIVE_MAKE) $@) ; done
	-rm -f *~ \#*
