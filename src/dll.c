/* Lisp interface to dynamic loading.
   Copyright (C) 1998  Joshua Rowe.
   Additional cleanup by Hrvoje Niksic.

This file is part of XEmacs.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

/* Synched up with: Not in FSF. */

/* A shared object must have the symbol `emacs_initialize' defined.
   It should contain initialization of functions, symbols, etc. and
   their loading into Lisp-land.  The function will be called without
   arguments and is not expected to return any.

   All of this needs lots and LOTS of work.  Some things to work on:

   1) A good foreign interface.  This is probably tough, because it
   implies drawing a new border between "external" and "internal"
   stuff (traditionally, Lisp code was external, while C was
   internal).  Also, we need a modules/ directory with a few nice
   sample modules, a sample Makefile, etc. so people can start
   hacking.

   2) All of this is sooo simple-minded.  As it gets more complex,
   we'll have to look at how others have done similar things
   (e.g. Perl 5 and Zsh 3.1), to avoid botching it up.  */

#include <config.h>
#include "lisp.h"
#include "buffer.h"
#include "sysdll.h"
#include <errno.h>

DEFUN ("dll-open", Fdll_open, 1, 1, "FShared object: ", /*
Load LIBRARY as a shared object file.

After the LIBRARY is dynamically linked with the executable, the
`emacs_initialize' function will be called without arguments.  It
should define all the symbols, subr's and variables the module
introduces.

After this point, any lisp symbols defined in the shared object are
available for use.
*/
       (library))
{
  /* This function can GC */
  dll_handle *handle;
  void (*function) (void);
  CONST char *filename;

  CHECK_STRING (library);
  library = Fexpand_file_name (library, Qnil);

  GET_C_CHARPTR_EXT_FILENAME_DATA_ALLOCA (XSTRING_DATA (library), filename);

  handle = (dll_handle *) dll_open (filename);
  if (handle == NULL)
    {
      signal_error (Qerror,
		    list3 (build_translated_string ("Cannot load shared library"),
			   library, build_translated_string (dll_error (handle))));
    }

  /* #### Perhaps emacs_initialize() should return a Lisp_Object, so
     we can return it?  */

  function = (void (*)(void)) dll_function (handle, "emacs_initialize");
  if (!function)
    signal_simple_error ("Shared library does not define `emacs_initialize'",
			 library);
  (*function) ();

  return Qnil;
}

void syms_of_dll ()
{
  DEFSUBR (Fdll_open);
}
