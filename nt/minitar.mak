ZLIB=\path\to\zlib

all: minitar.exe

minitar.exe: minitar.obj
	cl -o minitar.exe minitar.obj $(ZLIB)\zlib.lib

minitar.obj: minitar.c
	cl -c minitar.c -I $(ZLIB)

