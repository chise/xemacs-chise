#
# XPM Makefile for Microsoft NMAKE without X libraries
#
!if !defined(DEBUG)
!if defined(DEBUG_XEMACS)
DEBUG=$(DEBUG_XEMACS)
!else
DEBUG=0
!endif
!endif

!if !defined(USE_CRTDLL)
USE_CRTDLL=0
!endif

!if $(DEBUG)
OPT=-Od -Zi
LINK_DEBUG=-debug
!else
OPT=-Ox
!endif

!if $(USE_CRTDLL)
!if $(DEBUG)
C_LIBFLAG=-MDd
!else
C_LIBFLAG=-MD
!endif
!else
!if $(DEBUG)
C_LIBFLAG=-MLd
!else
C_LIBFLAG=-ML
!endif
!endif

WARN_CPP_FLAGS = -W3

CC=cl
CFLAGS=-nologo -DFOR_MSW $(C_LIBFLAG) $(WARN_CPP_FLAGS) \
	$(OPT) $(INCLUDES) -c

OBJS= data.obj create.obj misc.obj rgb.obj scan.obj parse.obj hashtab.obj \
      WrFFrI.obj RdFToI.obj CrIFrDat.obj CrDatFrI.obj \
      CrIFrBuf.obj CrBufFrI.obj \
      RdFToDat.obj WrFFrDat.obj \
      Attrib.obj Image.obj Info.obj RdFToBuf.obj WrFFrBuf.obj \
      simx.obj

# nmake rule

.SUFFIXES:
.SUFFIXES:	.c

.c.obj::
	$(CC) $(CFLAGS) $<


# targets

all: ..\X11\xpm.h Xpm.lib

..\X11\xpm.h: ..\X11\NUL xpm.h
	copy xpm.h ..\X11

..\X11\NUL:
	mkdir ..\X11

Xpm.lib: $(OBJS)
!if $(USE_CRTDLL)
# Target is ok, link builds lib as a side effect.
	link -nologo -dll -def:xpm.def -out:Xpm.dll gdi32.lib $(OBJS) 
!else
	lib -nologo -out:$@ $(OBJS)
!endif
