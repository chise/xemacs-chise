/* Header for CCL (Code Conversion Language) interpreter.
   Copyright (C) 1995 Electrotechnical Laboratory, JAPAN.
   Licensed to the Free Software Foundation.

This file is part of XEmacs.

GNU Emacs is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GNU Emacs is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GNU Emacs; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

/* Synched up with: FSF Emacs 20.2 */

#ifndef _CCL_H
#define _CCL_H

/* Structure to hold information about running CCL code.  Read
   comments in the file ccl.c for the detail of each field.  */
struct ccl_program {
  int size;			/* Size of the compiled code.  */
  Lisp_Object *prog;		/* Pointer into the compiled code.  */
  int ic;			/* Instruction Counter (index for PROG).  */
  int eof_ic;			/* Instruction Counter for end-of-file
				   processing code.  */
  int reg[8];			/* CCL registers, reg[7] is used for
				   condition flag of relational
				   operations.  */
  int last_block;		/* Set to 1 while processing the last
				   block. */
  int status;			/* Exit status of the CCL program.  */
  int buf_magnification;	/* Output buffer magnification.  How
				   many times bigger the output buffer
				   should be than the input buffer.  */
};

int ccl_driver (struct ccl_program *ccl, CONST unsigned char *source,
		unsigned_char_dynarr *destination, int src_bytes, int *consumed);
void setup_ccl_program (struct ccl_program *ccl, Lisp_Object val);

/* Alist of fontname patterns vs corresponding CCL program.  */
extern Lisp_Object Vfont_ccl_encoder_alist;

#endif /* _CCL_H */
