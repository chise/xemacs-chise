#
# XPM Makefile for Microsoft NMAKE without X libraries
#

!if !defined(DEBUG_XEMACS)
DEBUG_XEMACS=0
!endif

!if $(DEBUG_XEMACS)
OPT=-Od -Zi
!else
OPT=-O2 -G5 -Zi
!endif

WARN_CPP_FLAGS = -W3

CC=cl
CFLAGS=-nologo -DFOR_MSW $(WARN_CPP_FLAGS) $(OPT) $(INCLUDES) -Fo$@ -c

OBJS= data.obj create.obj misc.obj rgb.obj scan.obj parse.obj hashtab.obj \
      WrFFrI.obj RdFToI.obj CrIFrDat.obj CrDatFrI.obj \
      CrIFrBuf.obj CrBufFrI.obj \
      RdFToDat.obj WrFFrDat.obj \
      Attrib.obj Image.obj Info.obj RdFToBuf.obj WrFFrBuf.obj \
      simx.obj

# nmake rule

.SUFFIXES:
.SUFFIXES:	.c

.c.obj:
	$(CC) $(CFLAGS) $< -Fo$@


# targets

all: ..\X11\xpm.h Xpm.lib

..\X11\xpm.h: ..\X11\NUL xpm.h
	copy xpm.h ..\X11

..\X11\NUL:
	mkdir ..\X11

Xpm.lib: $(OBJS)
	link.exe -lib -nologo -out:$@ $(OBJS)
