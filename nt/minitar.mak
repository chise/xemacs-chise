ZLIB=\path\to\zlib
LIB_SRC=.
NT=.

all: $(LIB_SRC)\minitar.exe

$(LIB_SRC)\minitar.exe: $(LIB_SRC)\minitar.obj
	cl -o $@ $(LIB_SRC)\minitar.obj $(ZLIB)\zlib.lib

$(LIB_SRC)\minitar.obj: $(NT)\minitar.c
	cl -Fo$@ -c $(NT)\minitar.c -I $(ZLIB)

