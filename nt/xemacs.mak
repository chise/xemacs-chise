#   Makefile for Microsoft NMAKE
#   Copyright (C) 1995 Board of Trustees, University of Illinois.
#   Copyright (C) 1995, 1996 Ben Wing.
#   Copyright (C) 1995 Sun Microsystems, Inc.
#   Copyright (C) 1998 Free Software Foundation, Inc.
#
# This file is part of XEmacs.
#
# XEmacs is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2, or (at your option) any
# later version.
#
# XEmacs is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License
# along with XEmacs; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA.
#
# Synched up with: Not in FSF.
#

XEMACS=..
LISP=$(XEMACS)\lisp
MODULES=$(XEMACS)\modules
NT=$(XEMACS)\nt
OUTDIR=$(NT)\obj

# Program name and version

!include "..\version.sh"

!if !defined(INFODOCK)
INFODOCK=0
!endif

!if $(INFODOCK)
INFODOCK_VERSION_STRING=$(infodock_major_version).$(infodock_minor_version).$(infodock_build_version)
PROGRAM_DEFINES=-DINFODOCK 					\
	-DPATH_VERSION=\"$(INFODOCK_VERSION_STRING)\"		\
	-DPATH_PROGNAME=\"infodock\" 				\
	-DINFODOCK_MAJOR_VERSION=$(infodock_major_version)	\
	-DINFODOCK_MINOR_VERSION=$(infodock_minor_version)	\
	-DINFODOCK_BUILD_VERSION=$(infodock_build_version)
!else
!if "$(emacs_beta_version)" != ""
XEMACS_VERSION_STRING=$(emacs_major_version).$(emacs_minor_version)-b$(emacs_beta_version)
!else
XEMACS_VERSION_STRING=$(emacs_major_version).$(emacs_minor_version)
!endif
PROGRAM_DEFINES=						\
	-DPATH_VERSION=\"$(XEMACS_VERSION_STRING)\"		\
	-DPATH_PROGNAME=\"xemacs\"
!endif

#
# Command line options defaults
#
!if !defined(INSTALL_DIR)
! if $(INFODOCK)
INSTALL_DIR=c:\Program Files\Infodock\Infodock-$(INFODOCK_VERSION_STRING)
! else
INSTALL_DIR=c:\Program Files\XEmacs\XEmacs-$(XEMACS_VERSION_STRING)
! endif
!endif
!if !defined(HAVE_MULE)
HAVE_MULE=0
!endif
!if !defined(PACKAGE_PATH)
! if !defined(PACKAGE_PREFIX)
PACKAGE_PREFIX=c:\Program Files\XEmacs
! endif
! if $(HAVE_MULE)
PACKAGE_PATH=~\.xemacs;;$(PACKAGE_PREFIX)\site-packages;$(PACKAGE_PREFIX)\mule-packages;$(PACKAGE_PREFIX)\xemacs-packages
! else
PACKAGE_PATH=~\.xemacs;;$(PACKAGE_PREFIX)\site-packages;$(PACKAGE_PREFIX)\xemacs-packages
! endif
!endif
PATH_PACKAGEPATH="$(PACKAGE_PATH:\=\\)"
!if !defined(HAVE_MSW)
HAVE_MSW=1
!endif
!if !defined(HAVE_X)
HAVE_X=0
!endif
!if !defined(HAVE_XPM)
HAVE_XPM=0
!endif
!if !defined(HAVE_PNG)
HAVE_PNG=0
!endif
!if !defined(HAVE_TIFF)
HAVE_TIFF=0
!endif
!if !defined(HAVE_JPEG)
HAVE_JPEG=0
!endif
!if !defined(HAVE_XFACE)
HAVE_XFACE=0
!endif
!if !defined(HAVE_GIF)
HAVE_GIF=1
!endif
!if !defined(HAVE_TOOLBARS)
HAVE_TOOLBARS=$(HAVE_XPM)
!endif
!if !defined(HAVE_DIALOGS)
HAVE_DIALOGS=1
!endif
!if !defined(HAVE_MSW_C_DIRED)
HAVE_MSW_C_DIRED=1
!endif
!if !defined(HAVE_NATIVE_SOUND)
HAVE_NATIVE_SOUND=1
!endif
!if !defined(DEBUG_XEMACS)
DEBUG_XEMACS=0
!endif
!if !defined(USE_UNION_TYPE)
USE_UNION_TYPE=0
!endif
!if !defined(USE_MINIMAL_TAGBITS)
USE_MINIMAL_TAGBITS=0
!endif
!if !defined(USE_INDEXED_LRECORD_IMPLEMENTATION)
USE_INDEXED_LRECORD_IMPLEMENTATION=0
!endif
!if !defined(GUNG_HO)
GUNG_HO=0
!endif

#
# System configuration
#
!if !defined(OS)
OS=Windows_95/98
EMACS_CONFIGURATION=i586-pc-win32
!else if "$(PROCESSOR_ARCHITECTURE)" == "x86"
EMACS_CONFIGURATION=i586-pc-win32
!else if "$(PROCESSOR_ARCHITECTURE)" == "MIPS"
EMACS_CONFIGURATION=mips-pc-win32
!else if "$(PROCESSOR_ARCHITECTURE)" == "ALPHA"
EMACS_CONFIGURATION=alpha-pc-win32
!else if "$(PROCESSOR_ARCHITECTURE)" == "PPC"
EMACS_CONFIGURATION=ppc-pc-win32
!else
! error Unknown processor architecture type $(PROCESSOR_ARCHITECTURE)
!endif

#
# Conf error checks
#
CONFIG_ERROR=0
!if $(INFODOCK) && !exist("..\..\Infodock.rules")
!message Cannot build InfoDock without InfoDock sources
CONFIG_ERROR=1
!endif
!if !$(HAVE_MSW) && !$(HAVE_X)
!message Please specify at least one HAVE_MSW=1 and/or HAVE_X=1
CONFIG_ERROR=1
!endif
!if $(HAVE_X) && !defined(X11_DIR)
!message Please specify root directory for your X11 installation: X11_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_X) && defined(X11_DIR) && !exist("$(X11_DIR)\LIB\X11.LIB")
!message Specified X11 directory does not contain "$(X11_DIR)\LIB\X11.LIB"
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_XPM) && !defined(XPM_DIR)
!message Please specify root directory for your XPM installation: XPM_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_XPM) && defined(XPM_DIR) && !exist("$(XPM_DIR)\lib\Xpm.lib")
!message Specified XPM directory does not contain "$(XPM_DIR)\lib\Xpm.lib"
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_PNG) && !defined(PNG_DIR)
!message Please specify root directory for your PNG installation: PNG_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_PNG) && defined(PNG_DIR) && !exist("$(PNG_DIR)\libpng.lib")
!message Specified PNG directory does not contain "$(PNG_DIR)\libpng.lib"
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_PNG) && !defined(ZLIB_DIR)
!message Please specify root directory for your ZLIB installation: ZLIB_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_PNG) && defined(ZLIB_DIR) && !exist("$(ZLIB_DIR)\zlib.lib")
!message Specified ZLIB directory does not contain "$(ZLIB_DIR)\zlib.lib"
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_TIFF) && !defined(TIFF_DIR)
!message Please specify root directory for your TIFF installation: TIFF_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_TIFF) && !exist("$(TIFF_DIR)\libtiff\libtiff.lib")
!message Specified TIFF directory does not contain "$(TIFF_DIR)\libtiff\libtiff.lib"
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_JPEG) && !defined(JPEG_DIR)
!message Please specify root directory for your JPEG installation: JPEG_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_JPEG) && !exist("$(JPEG_DIR)\libjpeg.lib")
!message Specified JPEG directory does not contain "$(JPEG_DIR)\libjpeg.lib"
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_XFACE) && !defined(COMPFACE_DIR)
!message Please specify root directory for your COMPFACE installation: COMPFACE_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_XFACE) && !exist("$(COMPFACE_DIR)\libcompface.lib")
!message Specified COMPFACE directory does not contain "$(COMPFACE_DIR)\libcompface.lib"
CONFIG_ERROR=1
!endif
!if $(HAVE_MSW) && $(HAVE_TOOLBARS) && !$(HAVE_XPM)
!message Toolbars require XPM support
CONFIG_ERROR=1
!endif
!if $(CONFIG_ERROR)
!error Configuration error(s) found
!endif

#
# Handle GUNG_HO
#
!if defined(GUNG_HO)
USE_MINIMAL_TAGBITS=$(GUNG_HO)
USE_INDEXED_LRECORD_IMPLEMENTATION=$(GUNG_HO)
!endif

#
# Compiler command echo control. Define VERBOSECC=1 to get verbose compilation.
#
!if !defined(VERBOSECC)
VERBOSECC=0
!endif
!if $(VERBOSECC)
CCV=$(CC)
!else
CCV=@$(CC)
!endif

!if $(DEBUG_XEMACS)
OPT=-Od -Zi
!else
OPT=-O2 -G5
!endif

CFLAGS=-nologo -W3 $(OPT)

!if $(HAVE_X)
X_DEFINES=-DHAVE_X_WINDOWS
X_INCLUDES=-I$(X11_DIR)\include
X_LIBS=-libpath:$(X11_DIR)\lib Xaw.lib Xmu.lib Xt.lib SM.lib ICE.lib Xext.lib X11.lib
!endif

!if $(HAVE_MSW)
MSW_DEFINES=-DHAVE_MS_WINDOWS -DHAVE_SCROLLBARS -DHAVE_MENUBARS
MSW_INCLUDES=
MSW_LIBS=
!if $(HAVE_MSW_C_DIRED)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_MSW_C_DIRED
MSW_C_DIRED_SRC=$(XEMACS)\src\dired-msw.c
MSW_C_DIRED_OBJ=$(OUTDIR)\dired-msw.obj
!endif
!if $(HAVE_XPM)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_XPM -DFOR_MSW
MSW_INCLUDES=$(MSW_INCLUDES) -I"$(XPM_DIR)" -I"$(XPM_DIR)\lib"
MSW_LIBS=$(MSW_LIBS) "$(XPM_DIR)\lib\Xpm.lib"
!endif
!if $(HAVE_GIF)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_GIF
MSW_GIF_SRC=$(XEMACS)\src\dgif_lib.c $(XEMACS)\src\gif_io.c
MSW_GIF_OBJ=$(OUTDIR)\dgif_lib.obj $(OUTDIR)\gif_io.obj
!endif
!if $(HAVE_PNG)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_PNG
MSW_INCLUDES=$(MSW_INCLUDES) -I"$(PNG_DIR)" -I"$(ZLIB_DIR)"
MSW_LIBS=$(MSW_LIBS) "$(PNG_DIR)\libpng.lib" "$(ZLIB_DIR)\zlib.lib"
!endif
!if $(HAVE_TIFF)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_TIFF
MSW_INCLUDES=$(MSW_INCLUDES) -I"$(TIFF_DIR)\libtiff"
MSW_LIBS=$(MSW_LIBS) "$(TIFF_DIR)\libtiff\libtiff.lib"
!endif
!if $(HAVE_JPEG)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_JPEG
MSW_INCLUDES=$(MSW_INCLUDES) -I"$(JPEG_DIR)"
MSW_LIBS=$(MSW_LIBS) "$(JPEG_DIR)\libjpeg.lib"
!endif
!if $(HAVE_XFACE)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_XFACE
MSW_INCLUDES=$(MSW_INCLUDES) -I"$(COMPFACE_DIR)"
MSW_LIBS=$(MSW_LIBS) "$(COMPFACE_DIR)\libcompface.lib"
!endif
!if $(HAVE_TOOLBARS)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_TOOLBARS
MSW_TOOLBAR_SRC=$(XEMACS)\src\toolbar.c $(XEMACS)\src\toolbar-msw.c
MSW_TOOLBAR_OBJ=$(OUTDIR)\toolbar.obj $(OUTDIR)\toolbar-msw.obj
MSW_LIBS=$(MSW_LIBS) comctl32.lib
!endif
!if $(HAVE_DIALOGS)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_DIALOGS
MSW_DIALOG_SRC=$(XEMACS)\src\dialog.c $(XEMACS)\src\dialog-msw.c
MSW_DIALOG_OBJ=$(OUTDIR)\dialog.obj $(OUTDIR)\dialog-msw.obj
!endif
!if $(HAVE_NATIVE_SOUND)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_NATIVE_SOUND
!endif
!endif

!if $(HAVE_MULE)
MULE_DEFINES=-DMULE
!endif

!if $(DEBUG_XEMACS)
DEBUG_DEFINES=-DDEBUG_XEMACS -D_DEBUG 
DEBUG_FLAGS=-debug:full
!endif

!if $(USE_MINIMAL_TAGBITS)
TAGBITS_DEFINES=-DUSE_MINIMAL_TAGBITS
!endif
!if $(USE_INDEXED_LRECORD_IMPLEMENTATION)
LRECORD_DEFINES=-DUSE_INDEXED_LRECORD_IMPLEMENTATION
!endif
!if $(USE_UNION_TYPE)
UNION_DEFINES=-DUSE_UNION_TYPE
!endif

# Hard-coded paths

!if $(INFODOCK)
PATH_PREFIX=../..
!else
PATH_PREFIX=..
!endif

PATH_DEFINES=-DPATH_PREFIX=\"$(PATH_PREFIX)\"

# Generic variables

INCLUDES=$(X_INCLUDES) $(MSW_INCLUDES) -I$(XEMACS)\nt\inc -I$(XEMACS)\src -I$(XEMACS)\lwlib

DEFINES=$(X_DEFINES) $(MSW_DEFINES) $(MULE_DEFINES) \
	$(TAGBITS_DEFINES) $(LRECORD_DEFINES) $(UNION_DEFINES) \
	-DWIN32 -D_WIN32 -DWIN32_LEAN_AND_MEAN -DWINDOWSNT -Demacs \
	-DHAVE_CONFIG_H $(PROGRAM_DEFINES) $(PATH_DEFINES)

#------------------------------------------------------------------------------

default: $(OUTDIR)\nul all 

$(OUTDIR)\nul:
	-@mkdir $(OUTDIR)

XEMACS_INCLUDES=\
 $(XEMACS)\src\config.h \
 $(XEMACS)\src\Emacs.ad.h \
 $(XEMACS)\src\paths.h

$(XEMACS)\src\config.h:	config.h
	copy config.h $(XEMACS)\src

$(XEMACS)\src\Emacs.ad.h:	Emacs.ad.h
	copy Emacs.ad.h $(XEMACS)\src

$(XEMACS)\src\paths.h:	paths.h
	copy paths.h $(XEMACS)\src

#------------------------------------------------------------------------------

# lib-src programs

LIB_SRC = $(XEMACS)\lib-src
LIB_SRC_DEFINES = -DHAVE_CONFIG_H -DWIN32 -DWINDOWSNT

#
# Creating config.values to be used by config.el
#
CONFIG_VALUES = $(LIB_SRC)\config.values
!if [echo Creating $(CONFIG_VALUES) && echo ;;; Do not edit this file!>$(CONFIG_VALUES)]
!endif
# MAKEDIR has to be made into a string.
#!if [echo blddir>>$(CONFIG_VALUES) && echo $(ESC)"$(MAKEDIR:\=\\)\\..$(ESC)">>$(CONFIG_VALUES)]
!if [echo blddir>>$(CONFIG_VALUES) && echo "$(MAKEDIR:\=\\)\\..">>$(CONFIG_VALUES)]
!endif
!if [echo CC>>$(CONFIG_VALUES) && echo "$(CC:\=\\)">>$(CONFIG_VALUES)]
!endif
!if [echo CFLAGS>>$(CONFIG_VALUES) && echo "$(CFLAGS:\=\\)">>$(CONFIG_VALUES)]
!endif
!if [echo CPP>>$(CONFIG_VALUES) && echo "$(CPP:\=\\)">>$(CONFIG_VALUES)]
!endif
!if [echo CPPFLAGS>>$(CONFIG_VALUES) && echo "$(CPPFLAGS:\=\\)">>$(CONFIG_VALUES)]
!endif
!if [echo LISPDIR>>$(CONFIG_VALUES) && echo "$(MAKEDIR:\=\\)\\$(LISP:\=\\)">>$(CONFIG_VALUES)]
!endif
# PATH_PACKAGEPATH is already a quoted string.
!if [echo PACKAGE_PATH>>$(CONFIG_VALUES) && echo $(PATH_PACKAGEPATH)>>$(CONFIG_VALUES)]
!endif

# Inferred rule
{$(LIB_SRC)}.c{$(LIB_SRC)}.exe :
	@cd $(LIB_SRC)
	$(CCV) -I. -I$(XEMACS)/src -I$(XEMACS)/nt/inc $(LIB_SRC_DEFINES) $(CFLAGS) -Fe$@ $** -link -incremental:no
	@cd $(NT)

# Individual dependencies
ETAGS_DEPS = $(LIB_SRC)/getopt.c $(LIB_SRC)/getopt1.c $(LIB_SRC)/../src/regex.c
$(LIB_SRC)/etags.exe : $(LIB_SRC)/etags.c $(ETAGS_DEPS)
$(LIB_SRC)/movemail.exe: $(LIB_SRC)/movemail.c $(LIB_SRC)/pop.c $(ETAGS_DEPS)
	@cd $(LIB_SRC)
	$(CCV) -I. -I$(XEMACS)/src -I$(XEMACS)/nt/inc $(LIB_SRC_DEFINES) $(CFLAGS) -Fe$@ $** wsock32.lib -link -incremental:no
	@cd $(NT)

LIB_SRC_TOOLS = \
	$(LIB_SRC)/make-docfile.exe	\
	$(LIB_SRC)/hexl.exe		\
	$(LIB_SRC)/movemail.exe		\
	$(LIB_SRC)/mmencode.exe		\
	$(LIB_SRC)/sorted-doc.exe	\
	$(LIB_SRC)/wakeup.exe		\
	$(LIB_SRC)/etags.exe		

#------------------------------------------------------------------------------

# runxemacs proglet

RUNEMACS = $(XEMACS)\src\runxemacs.exe

$(RUNEMACS): $(LIB_SRC)\run.c $(LIB_SRC)\run.res
	$(CCV) -I$(LIB_SRC) $(CFLAGS) -Fe$@ -Fo$(LIB_SRC) -Fd$(LIB_SRC)\ $** kernel32.lib user32.lib -link -incremental:no

$(LIB_SRC)\run.res: $(LIB_SRC)\run.rc
	rc -I$(LIB_SRC) -Fo$@ $**

#------------------------------------------------------------------------------

# LASTFILE Library

LASTFILE=$(OUTDIR)\lastfile.lib
LASTFILE_SRC=$(XEMACS)\src
LASTFILE_FLAGS=$(CFLAGS) $(INCLUDES) -Fo$@ -Fd$* -c
LASTFILE_OBJS= \
	$(OUTDIR)\lastfile.obj

$(LASTFILE): $(XEMACS_INCLUDES) $(LASTFILE_OBJS)
	link.exe -lib -nologo -out:$@ $(LASTFILE_OBJS)

$(OUTDIR)\lastfile.obj:	$(LASTFILE_SRC)\lastfile.c
	 $(CCV) $(LASTFILE_FLAGS) $**

#------------------------------------------------------------------------------

!if $(HAVE_X)

# LWLIB Library

LWLIB=$(OUTDIR)\lwlib.lib
LWLIB_SRC=$(XEMACS)\lwlib
LWLIB_FLAGS=$(CFLAGS) $(INCLUDES) $(DEFINES) \
 -DNEED_ATHENA -DNEED_LUCID \
 -D_WINDOWS -DMENUBARS_LUCID -DSCROLLBARS_LUCID -DDIALOGS_ATHENA \
 -Fo$@ -c
LWLIB_OBJS= \
	$(OUTDIR)\lwlib-config.obj \
	$(OUTDIR)\lwlib-utils.obj \
	$(OUTDIR)\lwlib-Xaw.obj \
	$(OUTDIR)\lwlib-Xlw.obj \
	$(OUTDIR)\lwlib.obj \
	$(OUTDIR)\xlwmenu.obj \
	$(OUTDIR)\xlwscrollbar.obj

$(LWLIB): $(LWLIB_OBJS)
	link.exe -lib -nologo -out:$@ $(LWLIB_OBJS)

$(OUTDIR)\lwlib-config.obj:	$(LWLIB_SRC)\lwlib-config.c
	 $(CCV) $(LWLIB_FLAGS) $**

$(OUTDIR)\lwlib-utils.obj:	$(LWLIB_SRC)\lwlib-utils.c
	 $(CCV) $(LWLIB_FLAGS) $**

$(OUTDIR)\lwlib-Xaw.obj:	$(LWLIB_SRC)\lwlib-Xaw.c
	 $(CCV) $(LWLIB_FLAGS) $**

$(OUTDIR)\lwlib-Xlw.obj:	$(LWLIB_SRC)\lwlib-Xlw.c
	 $(CCV) $(LWLIB_FLAGS) $**

$(OUTDIR)\lwlib.obj:		$(LWLIB_SRC)\lwlib.c
	 $(CCV) $(LWLIB_FLAGS) $**

$(OUTDIR)\xlwmenu.obj:		$(LWLIB_SRC)\xlwmenu.c
	 $(CCV) $(LWLIB_FLAGS) $**

$(OUTDIR)\xlwscrollbar.obj:	$(LWLIB_SRC)\xlwscrollbar.c
	 $(CCV) $(LWLIB_FLAGS) $**

!endif
#------------------------------------------------------------------------------

DOC=$(LIB_SRC)\DOC
DOC_SRC1=\
 $(XEMACS)\src\abbrev.c \
 $(XEMACS)\src\alloc.c \
 $(XEMACS)\src\alloca.c \
 $(XEMACS)\src\blocktype.c \
 $(XEMACS)\src\buffer.c \
 $(XEMACS)\src\bytecode.c \
 $(XEMACS)\src\callint.c \
 $(XEMACS)\src\callproc.c \
 $(XEMACS)\src\casefiddle.c \
 $(XEMACS)\src\casetab.c \
 $(XEMACS)\src\chartab.c \
 $(XEMACS)\src\cmdloop.c \
 $(XEMACS)\src\cmds.c \
 $(XEMACS)\src\console-stream.c \
 $(XEMACS)\src\console.c \
 $(XEMACS)\src\data.c \
 $(XEMACS)\src\device.c
DOC_SRC2=\
 $(XEMACS)\src\dired.c \
 $(XEMACS)\src\doc.c \
 $(XEMACS)\src\doprnt.c \
 $(XEMACS)\src\dragdrop.c \
 $(XEMACS)\src\dynarr.c \
 $(XEMACS)\src\editfns.c \
 $(XEMACS)\src\elhash.c \
 $(XEMACS)\src\emacs.c \
 $(XEMACS)\src\eval.c \
 $(XEMACS)\src\event-stream.c \
 $(XEMACS)\src\events.c \
 $(XEMACS)\src\extents.c \
 $(XEMACS)\src\faces.c \
 $(XEMACS)\src\file-coding.c \
 $(XEMACS)\src\fileio.c \
 $(XEMACS)\src\filemode.c \
 $(XEMACS)\src\floatfns.c \
 $(XEMACS)\src\fns.c 
DOC_SRC3=\
 $(XEMACS)\src\font-lock.c \
 $(XEMACS)\src\frame.c \
 $(XEMACS)\src\free-hook.c \
 $(XEMACS)\src\general.c \
 $(XEMACS)\src\glyphs.c \
 $(XEMACS)\src\glyphs-eimage.c \
 $(XEMACS)\src\glyphs-widget.c \
 $(XEMACS)\src\gmalloc.c \
 $(XEMACS)\src\gui.c  \
 $(XEMACS)\src\gutter.c \
 $(XEMACS)\src\hash.c \
 $(XEMACS)\src\imgproc.c \
 $(XEMACS)\src\indent.c \
 $(XEMACS)\src\insdel.c \
 $(XEMACS)\src\intl.c \
 $(XEMACS)\src\keymap.c \
 $(XEMACS)\src\line-number.c \
 $(XEMACS)\src\lread.c \
 $(XEMACS)\src\lstream.c \
 $(XEMACS)\src\macros.c \
 $(XEMACS)\src\marker.c
DOC_SRC4=\
 $(XEMACS)\src\md5.c \
 $(XEMACS)\src\menubar.c \
 $(XEMACS)\src\minibuf.c \
 $(XEMACS)\src\nt.c \
 $(XEMACS)\src\ntheap.c \
 $(XEMACS)\src\ntplay.c \
 $(XEMACS)\src\ntproc.c \
 $(XEMACS)\src\objects.c \
 $(XEMACS)\src\opaque.c \
 $(XEMACS)\src\print.c \
 $(XEMACS)\src\process.c \
 $(XEMACS)\src\process-nt.c \
 $(XEMACS)\src\profile.c \
 $(XEMACS)\src\rangetab.c \
 $(XEMACS)\src\realpath.c \
 $(XEMACS)\src\redisplay-output.c \
 $(XEMACS)\src\redisplay.c \
 $(XEMACS)\src\regex.c \
 $(XEMACS)\src\scrollbar.c \
 $(XEMACS)\src\search.c \
 $(XEMACS)\src\select.c \
 $(XEMACS)\src\signal.c \
 $(XEMACS)\src\sound.c 
DOC_SRC5=\
 $(XEMACS)\src\specifier.c \
 $(XEMACS)\src\strftime.c \
 $(XEMACS)\src\symbols.c \
 $(XEMACS)\src\syntax.c \
 $(XEMACS)\src\sysdep.c \
 $(XEMACS)\src\termcap.c  \
 $(XEMACS)\src\tparam.c \
 $(XEMACS)\src\undo.c \
 $(XEMACS)\src\unexnt.c \
 $(XEMACS)\src\vm-limit.c \
 $(XEMACS)\src\window.c \
 $(XEMACS)\src\widget.c

!if $(HAVE_X)
DOC_SRC6=\
 $(XEMACS)\src\balloon_help.c \
 $(XEMACS)\src\console-x.c \
 $(XEMACS)\src\device-x.c  \
 $(XEMACS)\src\dialog-x.c \
 $(XEMACS)\src\EmacsFrame.c \
 $(XEMACS)\src\EmacsManager.c \
 $(XEMACS)\src\EmacsShell-sub.c\
 $(XEMACS)\src\EmacsShell.c \
 $(XEMACS)\src\event-Xt.c  \
 $(XEMACS)\src\frame-x.c \
 $(XEMACS)\src\glyphs-x.c \
 $(XEMACS)\src\gui-x.c \
 $(XEMACS)\src\menubar.c \
 $(XEMACS)\src\menubar-x.c \
 $(XEMACS)\src\objects-x.c \
 $(XEMACS)\src\redisplay-x.c \
 $(XEMACS)\src\scrollbar-x.c \
 $(XEMACS)\src\balloon-x.c \
 $(XEMACS)\src\xgccache.c \
 $(XEMACS)\src\xmu.c \
 $(XEMACS)\src\select-x.c 
!endif

!if $(HAVE_MSW)
DOC_SRC7=\
 $(XEMACS)\src\console-msw.c \
 $(XEMACS)\src\device-msw.c  \
 $(XEMACS)\src\event-msw.c  \
 $(XEMACS)\src\frame-msw.c \
 $(XEMACS)\src\glyphs-msw.c \
 $(XEMACS)\src\gui-msw.c \
 $(XEMACS)\src\menubar-msw.c \
 $(XEMACS)\src\objects-msw.c \
 $(XEMACS)\src\redisplay-msw.c \
 $(XEMACS)\src\scrollbar-msw.c \
 $(XEMACS)\src\select-msw.c \
 $(MSW_C_DIRED_SRC) \
 $(MSW_TOOLBAR_SRC) \
 $(MSW_DIALOG_SRC) \
 $(MSW_GIF_SRC)
!endif

!if $(HAVE_MULE)
DOC_SRC8=\
 $(XEMACS)\src\mule.c \
 $(XEMACS)\src\mule-charset.c \
 $(XEMACS)\src\mule-ccl.c
! if $(HAVE_X)
 DOC_SRC8=$(DOC_SRC8) $(XEMACS)\src\input-method-xlib.c
! endif
!endif

!if $(DEBUG_XEMACS)
DOC_SRC9=\
 $(XEMACS)\src\debug.c
!endif

#------------------------------------------------------------------------------

# TEMACS Executable

# This may not exist
!if "$(emacs_beta_version)" != ""
EMACS_BETA_VERSION=-DEMACS_BETA_VERSION=$(emacs_beta_version)
!ENDIF

TEMACS_DIR=$(XEMACS)\src
TEMACS=$(TEMACS_DIR)\temacs.exe
TEMACS_BROWSE=$(TEMACS_DIR)\temacs.bsc
TEMACS_SRC=$(XEMACS)\src
TEMACS_LIBS=$(LASTFILE) $(LWLIB) $(X_LIBS) $(MSW_LIBS) \
 kernel32.lib user32.lib gdi32.lib advapi32.lib \
 shell32.lib wsock32.lib winmm.lib libc.lib
TEMACS_LFLAGS=-nologo $(LIBRARIES) $(DEBUG_FLAGS) -base:0x1000000\
 -stack:0x800000 -entry:_start -subsystem:console\
 -pdb:$(TEMACS_DIR)\temacs.pdb -map:$(TEMACS_DIR)\temacs.map \
 -heap:0x00100000 -out:$@
TEMACS_CPP_FLAGS=-ML -c \
 $(CFLAGS) $(INCLUDES) $(DEFINES) $(DEBUG_DEFINES) \
 -DEMACS_MAJOR_VERSION=$(emacs_major_version) \
 -DEMACS_MINOR_VERSION=$(emacs_minor_version) \
 $(EMACS_BETA_VERSION) \
 -DXEMACS_CODENAME=\"$(xemacs_codename)\" \
 -DEMACS_CONFIGURATION=\"$(EMACS_CONFIGURATION)\" \
 -DPATH_PACKAGEPATH=\"$(PATH_PACKAGEPATH)\"

!if $(HAVE_X)
TEMACS_X_OBJS=\
	$(OUTDIR)\balloon-x.obj \
	$(OUTDIR)\balloon_help.obj \
	$(OUTDIR)\console-x.obj \
	$(OUTDIR)\device-x.obj \
	$(OUTDIR)\dialog-x.obj \
	$(OUTDIR)\EmacsFrame.obj \
	$(OUTDIR)\EmacsManager.obj \
	$(OUTDIR)\EmacsShell.obj \
	$(OUTDIR)\TopLevelEmacsShell.obj\
	$(OUTDIR)\TransientEmacsShell.obj\
	$(OUTDIR)\event-Xt.obj \
	$(OUTDIR)\frame-x.obj \
	$(OUTDIR)\glyphs-x.obj \
	$(OUTDIR)\gui-x.obj \
	$(OUTDIR)\menubar-x.obj \
	$(OUTDIR)\objects-x.obj \
	$(OUTDIR)\redisplay-x.obj \
	$(OUTDIR)\scrollbar-x.obj \
	$(OUTDIR)\xgccache.obj \
	$(OUTDIR)\xmu.obj \
	$(OUTDIR)\select-x.obj
!endif

!if $(HAVE_MSW)
TEMACS_MSW_OBJS=\
	$(OUTDIR)\console-msw.obj \
	$(OUTDIR)\device-msw.obj \
	$(OUTDIR)\event-msw.obj \
	$(OUTDIR)\frame-msw.obj \
	$(OUTDIR)\glyphs-msw.obj \
	$(OUTDIR)\gui-msw.obj \
	$(OUTDIR)\menubar-msw.obj \
	$(OUTDIR)\objects-msw.obj \
	$(OUTDIR)\redisplay-msw.obj \
	$(OUTDIR)\scrollbar-msw.obj \
	$(OUTDIR)\select-msw.obj \
	$(MSW_C_DIRED_OBJ) \
	$(MSW_TOOLBAR_OBJ) \
	$(MSW_DIALOG_OBJ) \
	$(MSW_GIF_OBJ)
!endif

!if $(HAVE_MULE)
TEMACS_MULE_OBJS=\
	$(OUTDIR)\mule.obj \
	$(OUTDIR)\mule-charset.obj \
	$(OUTDIR)\mule-ccl.obj
! if $(HAVE_X)
TEMACS_MULE_OBJS=\
	$(TEMACS_MULE_OBJS) $(OUTDIR)\input-method-xlib.obj
! endif
!endif

!if $(DEBUG_XEMACS)
TEMACS_DEBUG_OBJS=\
	$(OUTDIR)\debug.obj
!endif

TEMACS_OBJS= \
	$(TEMACS_X_OBJS)\
	$(TEMACS_MSW_OBJS)\
	$(TEMACS_CODING_OBJS)\
	$(TEMACS_MULE_OBJS)\
	$(TEMACS_DEBUG_OBJS)\
	$(OUTDIR)\abbrev.obj \
	$(OUTDIR)\alloc.obj \
	$(OUTDIR)\alloca.obj \
	$(OUTDIR)\blocktype.obj \
	$(OUTDIR)\buffer.obj \
	$(OUTDIR)\bytecode.obj \
	$(OUTDIR)\callint.obj \
	$(OUTDIR)\callproc.obj \
	$(OUTDIR)\casefiddle.obj \
	$(OUTDIR)\casetab.obj \
	$(OUTDIR)\chartab.obj \
	$(OUTDIR)\cmdloop.obj \
	$(OUTDIR)\cmds.obj \
	$(OUTDIR)\console-stream.obj \
	$(OUTDIR)\console.obj \
	$(OUTDIR)\data.obj \
	$(OUTDIR)\device.obj \
	$(OUTDIR)\dired.obj \
	$(OUTDIR)\doc.obj \
	$(OUTDIR)\doprnt.obj \
	$(OUTDIR)\dragdrop.obj \
	$(OUTDIR)\dynarr.obj \
	$(OUTDIR)\editfns.obj \
	$(OUTDIR)\elhash.obj \
	$(OUTDIR)\emacs.obj \
	$(OUTDIR)\eval.obj \
	$(OUTDIR)\event-stream.obj \
	$(OUTDIR)\events.obj \
	$(OUTDIR)\extents.obj \
	$(OUTDIR)\faces.obj \
	$(OUTDIR)\file-coding.obj \
	$(OUTDIR)\fileio.obj \
	$(OUTDIR)\filemode.obj \
	$(OUTDIR)\floatfns.obj \
	$(OUTDIR)\fns.obj \
	$(OUTDIR)\font-lock.obj \
	$(OUTDIR)\frame.obj \
	$(OUTDIR)\free-hook.obj \
	$(OUTDIR)\general.obj \
	$(OUTDIR)\glyphs.obj \
	$(OUTDIR)\glyphs-eimage.obj \
	$(OUTDIR)\glyphs-widget.obj \
	$(OUTDIR)\gmalloc.obj \
	$(OUTDIR)\gui.obj \
	$(OUTDIR)\gutter.obj \
	$(OUTDIR)\hash.obj \
	$(OUTDIR)\indent.obj \
	$(OUTDIR)\imgproc.obj \
	$(OUTDIR)\insdel.obj \
	$(OUTDIR)\intl.obj \
	$(OUTDIR)\keymap.obj \
	$(OUTDIR)\line-number.obj \
	$(OUTDIR)\lread.obj \
	$(OUTDIR)\lstream.obj \
	$(OUTDIR)\macros.obj \
	$(OUTDIR)\menubar.obj \
	$(OUTDIR)\marker.obj \
	$(OUTDIR)\md5.obj \
	$(OUTDIR)\minibuf.obj \
	$(OUTDIR)\nt.obj \
	$(OUTDIR)\ntheap.obj \
	$(OUTDIR)\ntplay.obj \
	$(OUTDIR)\ntproc.obj \
	$(OUTDIR)\objects.obj \
	$(OUTDIR)\opaque.obj \
	$(OUTDIR)\print.obj \
	$(OUTDIR)\process.obj \
	$(OUTDIR)\process-nt.obj \
	$(OUTDIR)\profile.obj \
	$(OUTDIR)\rangetab.obj \
	$(OUTDIR)\realpath.obj \
	$(OUTDIR)\redisplay-output.obj \
	$(OUTDIR)\redisplay.obj \
	$(OUTDIR)\regex.obj \
	$(OUTDIR)\scrollbar.obj \
	$(OUTDIR)\search.obj \
	$(OUTDIR)\select.obj \
	$(OUTDIR)\signal.obj \
	$(OUTDIR)\sound.obj \
	$(OUTDIR)\specifier.obj \
	$(OUTDIR)\strftime.obj \
	$(OUTDIR)\symbols.obj \
	$(OUTDIR)\syntax.obj \
	$(OUTDIR)\sysdep.obj \
	$(OUTDIR)\tparam.obj \
	$(OUTDIR)\undo.obj \
	$(OUTDIR)\unexnt.obj \
	$(OUTDIR)\vm-limit.obj \
	$(OUTDIR)\widget.obj \
	$(OUTDIR)\window.obj \
	$(OUTDIR)\xemacs.res

# Rules

.SUFFIXES:
.SUFFIXES:	.c .texi

# nmake rule
!if $(DEBUG_XEMACS)
{$(TEMACS_SRC)}.c{$(OUTDIR)}.obj:
	$(CCV) $(TEMACS_CPP_FLAGS) $< -Fo$@ -Fr$*.sbr -Fd$(OUTDIR)\temacs.pdb
!else
{$(TEMACS_SRC)}.c{$(OUTDIR)}.obj:
	$(CCV) $(TEMACS_CPP_FLAGS) $< -Fo$@
!endif

$(OUTDIR)\TopLevelEmacsShell.obj:	$(TEMACS_SRC)\EmacsShell-sub.c
	$(CCV) $(TEMACS_CPP_FLAGS) -DDEFINE_TOP_LEVEL_EMACS_SHELL $** -Fo$@

$(OUTDIR)\TransientEmacsShell.obj: $(TEMACS_SRC)\EmacsShell-sub.c
	$(CCV) $(TEMACS_CPP_FLAGS) -DDEFINE_TRANSIENT_EMACS_SHELL $** -Fo$@

$(OUTDIR)\alloc.obj: $(TEMACS_SRC)\alloc.c

#$(TEMACS_SRC)\Emacs.ad.h: $(XEMACS)\etc\Emacs.ad
#	!"sed -f ad2c.sed < $(XEMACS)\etc\Emacs.ad > $(TEMACS_SRC)\Emacs.ad.h"

#$(TEMACS_SRC)\paths.h: $(TEMACS_SRC)\paths.h.in
#	!"cd $(TEMACS_SRC); cp paths.h.in paths.h"

$(TEMACS): $(TEMACS_INCLUDES) $(TEMACS_OBJS)
!if $(DEBUG_XEMACS)
	@dir /b/s $(OUTDIR)\*.sbr > bscmake.tmp
	bscmake -nologo -o$(TEMACS_BROWSE) @bscmake.tmp
	@del bscmake.tmp
!endif
	link.exe @<<
  $(TEMACS_LFLAGS) $(TEMACS_OBJS) $(TEMACS_LIBS)
<<

$(OUTDIR)\xemacs.res: xemacs.rc
	rc -Fo$@ xemacs.rc

# Section handling automated tests starts here

SRCDIR=..\src
PROGNAME=$(SRCDIR)\xemacs.exe
blddir=$(MAKEDIR:\=\\)\\..
temacs_loadup=$(TEMACS) -batch -l $(SRCDIR)/../lisp/loadup.el
dump_temacs   = $(temacs_loadup) dump
run_temacs    = $(temacs_loadup) run-temacs
## We have automated tests!!
testdir=../tests/automated
batch_test_emacs=-batch -l $(testdir)/test-harness.el -f batch-test-emacs $(testdir)

# .PHONY: check check-temacs

check:
	cd $(SRCDIR)
	$(PROGNAME) $(batch_test_emacs)

check-temacs:
	cd $(SRCDIR)
	set EMACSBOOTSTRAPLOADPATH=$(LISP)
	set EMACSBOOTSTRAPMODULEPATH=$(MODULES)
	$(run_temacs) $(batch_test_emacs)

# Section handling automated tests ends here

# Section handling info starts here
MAKEINFO=$(PROGNAME) -no-site-file -no-init-file -batch -l texinfmt -f batch-texinfo-format

MANDIR = $(XEMACS)\man
INFODIR = $(XEMACS)\info
INFO_FILES= \
	$(INFODIR)\cl.info \
	$(INFODIR)\custom.info \
	$(INFODIR)\emodules.info \
	$(INFODIR)\external-widget.info \
	$(INFODIR)\info.info \
	$(INFODIR)\standards.info \
	$(INFODIR)\term.info \
	$(INFODIR)\termcap.info \
	$(INFODIR)\texinfo.info \
	$(INFODIR)\widget.info \
	$(INFODIR)\xemacs-faq.info \
	$(INFODIR)\xemacs.info \
	$(INFODIR)\lispref.info \
	$(INFODIR)\new-users-guide.info \
	$(INFODIR)\internals.info

{$(MANDIR)}.texi{$(INFODIR)}.info:
	$(MAKEINFO) $**

$(INFODIR)\xemacs.info:	$(MANDIR)\xemacs\xemacs.texi
	$(MAKEINFO) $**

$(MANDIR)\xemacs\xemacs.texi: \
	$(MANDIR)\xemacs\abbrevs.texi \
	$(MANDIR)\xemacs\basic.texi \
	$(MANDIR)\xemacs\buffers.texi \
	$(MANDIR)\xemacs\building.texi \
	$(MANDIR)\xemacs\calendar.texi \
	$(MANDIR)\xemacs\cmdargs.texi \
	$(MANDIR)\xemacs\custom.texi \
	$(MANDIR)\xemacs\display.texi \
	$(MANDIR)\xemacs\entering.texi \
	$(MANDIR)\xemacs\files.texi \
	$(MANDIR)\xemacs\fixit.texi \
	$(MANDIR)\xemacs\glossary.texi \
	$(MANDIR)\xemacs\gnu.texi \
	$(MANDIR)\xemacs\help.texi \
	$(MANDIR)\xemacs\indent.texi \
	$(MANDIR)\xemacs\keystrokes.texi \
	$(MANDIR)\xemacs\killing.texi \
	$(MANDIR)\xemacs\\xemacs.texi \
	$(MANDIR)\xemacs\m-x.texi \
	$(MANDIR)\xemacs\major.texi \
	$(MANDIR)\xemacs\mark.texi \
	$(MANDIR)\xemacs\menus.texi \
	$(MANDIR)\xemacs\mini.texi \
	$(MANDIR)\xemacs\misc.texi \
	$(MANDIR)\xemacs\mouse.texi \
	$(MANDIR)\xemacs\new.texi \
	$(MANDIR)\xemacs\picture.texi \
	$(MANDIR)\xemacs\programs.texi \
	$(MANDIR)\xemacs\reading.texi \
	$(MANDIR)\xemacs\regs.texi \
	$(MANDIR)\xemacs\frame.texi \
	$(MANDIR)\xemacs\search.texi \
	$(MANDIR)\xemacs\sending.texi \
	$(MANDIR)\xemacs\text.texi \
	$(MANDIR)\xemacs\trouble.texi \
	$(MANDIR)\xemacs\undo.texi \
	$(MANDIR)\xemacs\windows.texi \


$(INFODIR)\lispref.info:	$(MANDIR)\lispref\lispref.texi
	copy $(MANDIR)\lispref\index.perm $(MANDIR)\lispref\index.texi
	$(MAKEINFO) $**

$(MANDIR)\lispref\lispref.texi: \
	$(MANDIR)\lispref\abbrevs.texi \
	$(MANDIR)\lispref\annotations.texi \
	$(MANDIR)\lispref\back.texi \
	$(MANDIR)\lispref\backups.texi \
	$(MANDIR)\lispref\buffers.texi \
	$(MANDIR)\lispref\building.texi \
	$(MANDIR)\lispref\commands.texi \
	$(MANDIR)\lispref\compile.texi \
	$(MANDIR)\lispref\consoles-devices.texi \
	$(MANDIR)\lispref\control.texi \
	$(MANDIR)\lispref\databases.texi \
	$(MANDIR)\lispref\debugging.texi \
	$(MANDIR)\lispref\dialog.texi \
	$(MANDIR)\lispref\display.texi \
	$(MANDIR)\lispref\edebug-inc.texi \
	$(MANDIR)\lispref\edebug.texi \
	$(MANDIR)\lispref\errors.texi \
	$(MANDIR)\lispref\eval.texi \
	$(MANDIR)\lispref\extents.texi \
	$(MANDIR)\lispref\faces.texi \
	$(MANDIR)\lispref\files.texi \
	$(MANDIR)\lispref\frames.texi \
	$(MANDIR)\lispref\functions.texi \
	$(MANDIR)\lispref\glyphs.texi \
	$(MANDIR)\lispref\hash-tables.texi \
	$(MANDIR)\lispref\help.texi \
	$(MANDIR)\lispref\hooks.texi \
	$(MANDIR)\lispref\index.texi \
	$(MANDIR)\lispref\internationalization.texi \
	$(MANDIR)\lispref\intro.texi \
	$(MANDIR)\lispref\keymaps.texi \
	$(MANDIR)\lispref\ldap.texi \
	$(MANDIR)\lispref\lists.texi \
	$(MANDIR)\lispref\loading.texi \
	$(MANDIR)\lispref\locals.texi \
	$(MANDIR)\lispref\macros.texi \
	$(MANDIR)\lispref\maps.texi \
	$(MANDIR)\lispref\markers.texi \
	$(MANDIR)\lispref\menus.texi \
	$(MANDIR)\lispref\minibuf.texi \
	$(MANDIR)\lispref\modes.texi \
	$(MANDIR)\lispref\mouse.texi \
	$(MANDIR)\lispref\mule.texi \
	$(MANDIR)\lispref\numbers.texi \
	$(MANDIR)\lispref\objects.texi \
	$(MANDIR)\lispref\os.texi \
	$(MANDIR)\lispref\positions.texi \
	$(MANDIR)\lispref\processes.texi \
	$(MANDIR)\lispref\range-tables.texi \
	$(MANDIR)\lispref\scrollbars.texi \
	$(MANDIR)\lispref\searching.texi \
	$(MANDIR)\lispref\sequences.texi \
	$(MANDIR)\lispref\specifiers.texi \
	$(MANDIR)\lispref\streams.texi \
	$(MANDIR)\lispref\strings.texi \
	$(MANDIR)\lispref\symbols.texi \
	$(MANDIR)\lispref\syntax.texi \
	$(MANDIR)\lispref\text.texi \
	$(MANDIR)\lispref\tips.texi \
	$(MANDIR)\lispref\toolbar.texi \
	$(MANDIR)\lispref\tooltalk.texi \
	$(MANDIR)\lispref\variables.texi \
	$(MANDIR)\lispref\windows.texi \
	$(MANDIR)\lispref\x-windows.texi \
	$(MANDIR)\lispref\index.unperm \
	$(MANDIR)\lispref\index.perm \


$(INFODIR)\new-users-guide.info:	$(MANDIR)\new-users-guide\new-users-guide.texi
	$(MAKEINFO) $**

$(MANDIR)\new-users-guide\new-users-guide.texi: \
	$(MANDIR)\new-users-guide\custom1.texi \
	$(MANDIR)\new-users-guide\files.texi \
	$(MANDIR)\new-users-guide\region.texi \
	$(MANDIR)\new-users-guide\custom2.texi \
	$(MANDIR)\new-users-guide\help.texi \
	$(MANDIR)\new-users-guide\search.texi \
	$(MANDIR)\new-users-guide\edit.texi \
	$(MANDIR)\new-users-guide\modes.texi \
	$(MANDIR)\new-users-guide\xmenu.texi \
	$(MANDIR)\new-users-guide\enter.texi \


$(INFODIR)\internals.info:	$(MANDIR)\internals\internals.texi
	copy $(MANDIR)\internals\index.perm $(MANDIR)\internals\index.texi
	$(MAKEINFO) $**

$(MANDIR)\internals\internals.texi: \
	$(MANDIR)\internals\index.unperm \
	$(MANDIR)\internals\index.perm \


info:	$(INFO_FILES)

# Section handling info ends here

#------------------------------------------------------------------------------

# LISP bits 'n bobs

LOADPATH=$(LISP)

$(DOC): $(LIB_SRC)\make-docfile.exe
	-del $(DOC)
	$(TEMACS) -batch -l $(TEMACS_DIR)\..\lisp\make-docfile.el -- -o $(DOC) -i $(XEMACS)\site-packages
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC1)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC2)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC3)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC4)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC5)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC6)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC7)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC8)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC9)

update-elc:
	set EMACSBOOTSTRAPLOADPATH=$(LISP);$(PACKAGE_PATH)
	set EMACSBOOTSTRAPMODULEPATH=$(MODULES)
	$(TEMACS) -batch -l $(TEMACS_DIR)\..\lisp\update-elc.el

# This rule dumps xemacs and then possibly spawns sub-make if PURESPACE
# requirements have changed.
dump-xemacs: $(TEMACS)
	@echo >$(TEMACS_DIR)\SATISFIED
	cd $(TEMACS_DIR)
	set EMACSBOOTSTRAPLOADPATH=$(LISP);$(PACKAGE_PATH)
	-1 $(TEMACS) -batch -l $(TEMACS_DIR)\..\lisp\loadup.el dump
	@cd $(NT)
	@if not exist $(TEMACS_DIR)\SATISFIED nmake -nologo -f xemacs.mak $@

#------------------------------------------------------------------------------

# use this rule to build the complete system
all:	$(XEMACS)\Installation $(OUTDIR)\nul $(LASTFILE) $(LWLIB) $(LIB_SRC_TOOLS) $(RUNEMACS) \
	$(TEMACS) update-elc $(DOC) dump-xemacs info

temacs: $(TEMACS)

# use this rule to install the system
install:	all
	@echo Installing in $(INSTALL_DIR) ...
	@echo PlaceHolder > PlaceHolder
	@xcopy /q PROBLEMS "$(INSTALL_DIR)\"
	@xcopy /q PlaceHolder "$(INSTALL_DIR)\lock\"
	@del "$(INSTALL_DIR)\lock\PlaceHolder"
	@xcopy /q $(LIB_SRC)\*.exe "$(INSTALL_DIR)\$(EMACS_CONFIGURATION)\"
	@copy $(LIB_SRC)\DOC "$(INSTALL_DIR)\$(EMACS_CONFIGURATION)"
	@copy $(CONFIG_VALUES) "$(INSTALL_DIR)\$(EMACS_CONFIGURATION)"
	@copy $(XEMACS)\src\xemacs.exe "$(INSTALL_DIR)\$(EMACS_CONFIGURATION)"
	@copy $(RUNEMACS) "$(INSTALL_DIR)\$(EMACS_CONFIGURATION)"
	@xcopy /e /q $(XEMACS)\etc  "$(INSTALL_DIR)\etc\"
	@xcopy /e /q $(XEMACS)\info "$(INSTALL_DIR)\info\"
	@xcopy /e /q $(XEMACS)\lisp "$(INSTALL_DIR)\lisp\"
	@echo Making skeleton package tree in $(PACKAGE_PREFIX) ...
	@xcopy /q PlaceHolder "$(PACKAGE_PREFIX)\site-packages\"
	@del "$(PACKAGE_PREFIX)\site-packages\PlaceHolder"
	@xcopy /q PlaceHolder "$(PACKAGE_PREFIX)\mule-packages\"
	@del "$(PACKAGE_PREFIX)\mule-packages\PlaceHolder"
	@xcopy /q PlaceHolder "$(PACKAGE_PREFIX)\xemacs-packages\"
	@del "$(PACKAGE_PREFIX)\xemacs-packages\PlaceHolder"
	@del PlaceHolder

distclean:
	del *.bak
	del *.orig
	del *.rej
	del *.tmp
	del $(XEMACS)\Installation
	cd $(OUTDIR)
	del *.lib
	del *.obj
	del *.pdb
	del *.res
	del *.sbr
	cd $(XEMACS)\$(TEMACS_DIR)
	del config.h
	del paths.h
	del Emacs.ad.h
	del *.bak
	del *.orig
	del *.rej
	del *.exe
	del *.map
	del *.bsc
	del *.pdb
	cd $(LIB_SRC)
	del DOC
	del *.bak
	del *.orig
	del *.rej
	del *.exe
	del *.obj
	del *.pdb
	del *.res
	del $(CONFIG_VALUES)
	cd $(LISP)
	-del /s /q *.bak *.elc *.orig *.rej
	cd $(INFODIR)
	del *.info* $(MANDIR)\internals\index.texi $(MANDIR)\lispref\index.texi

depend:
	mkdepend -f xemacs.mak -p$(OUTDIR)\ -o.obj -w9999 -- $(TEMACS_CPP_FLAGS) --  $(DOC_SRC1) $(DOC_SRC2) $(DOC_SRC3) $(DOC_SRC4) $(DOC_SRC5) $(DOC_SRC6) $(DOC_SRC7) $(DOC_SRC8) $(DOC_SRC9) $(LASTFILE_SRC)\lastfile.c $(LIB_SRC)\make-docfile.c $(LIB_SRC)\run.c

$(XEMACS)\Installation:
	@type > $(XEMACS)\Installation <<
!if defined(OS)
OS: $(OS)
!endif

XEmacs $(XEMACS_VERSION_STRING) $(xemacs_codename:"=\") configured for `$(EMACS_CONFIGURATION)'.

  Building XEmacs in \"$(MAKEDIR:\=\\)\".
!if defined(CCV)
  Using compiler \"$(CC) $(CFLAGS)\".
!endif
  Installing XEmacs in \"$(INSTALL_DIR:\=\\)\".
  Package path is $(PATH_PACKAGEPATH:"=\").
!if $(INFODOCK)
  Building InfoDock.
!endif
!if $(HAVE_MSW)
  Compiling in support for Microsoft Windows native GUI.
!endif
!if $(HAVE_X)
  Compiling in support for X-Windows.
!endif
!if $(HAVE_MULE)
  Compiling in MULE.
!endif
!if $(HAVE_XPM)
  Compiling in support for XPM images.
!else
  --------------------------------------------------------------------
  WARNING: Compiling without XPM support.
  WARNING: You should strongly consider installing XPM.
  WARNING: Otherwise toolbars and other graphics will look suboptimal.
  WARNING: (a copy may be found in ftp://ftp.xemacs.org/pub/xemacs/aux)
  --------------------------------------------------------------------
!endif
!if $(HAVE_GIF)
  Compiling in support for GIF images.
!endif
!if $(HAVE_PNG)
  Compiling in support for PNG images.
!else
  --------------------------------------------------------------------
  WARNING: Compiling without PNG image support.
  WARNING: You should strongly consider installing the PNG libraries.
  WARNING: Otherwise certain images and glyphs may not display.
  WARNING: (a copy may be found in ftp://ftp.xemacs.org/pub/xemacs/aux
  --------------------------------------------------------------------
!endif
!if $(HAVE_TIFF)
  Compiling in support for TIFF images.
!endif
!if $(HAVE_JPEG)
  Compiling in support for JPEG images.
!endif
!if $(HAVE_XFACE)
  Compiling in support for X-Face message headers.
!endif
!if $(HAVE_TOOLBARS)
  Compiling in support for toolbars.
!endif
!if $(HAVE_DIALOGS)
  Compiling in support for dialogs.
!endif
!if $(HAVE_NATIVE_SOUND)
  Compiling in support for native sounds.
!endif
!if $(HAVE_MSW_C_DIRED)
  Compiling in fast dired implementation.
!else
  --------------------------------------------------------------------
  WARNING: Define HAVE_MSW_C_DIRED to be non-zero if you want XEmacs
  WARNING: to use C primitives to significantly speed up dired, at the
  WARNING: expense of an additional ~4KB of code.
  --------------------------------------------------------------------
!endif
!if $(USE_MINIMAL_TAGBITS)
  Using minimal tagbits.
!endif
!if $(USE_INDEXED_LRECORD_IMPLEMENTATION)
  Using indexed lrecord implementation.
!endif
!if $(USE_UNION_TYPE)
  Using union type for Lisp object storage.
!endif
!if $(DEBUG_XEMACS)
  Compiling in extra debug checks. XEmacs will be slow!
!endif
<<NOKEEP
	@echo --------------------------------------------------------------------
	@type $(XEMACS)\Installation
	@echo --------------------------------------------------------------------

# DO NOT DELETE THIS LINE -- make depend depends on it.

