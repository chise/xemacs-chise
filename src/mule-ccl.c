/* CCL (Code Conversion Language) interpreter.
   Copyright (C) 1995, 1997 Electrotechnical Laboratory, JAPAN.
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

/* Synched up with : FSF Emacs 20.2 */

#ifdef emacs

#include <config.h>
#include "lisp.h"
#include "buffer.h"
#include "character.h"
#include "mule-ccl.h"
#include "file-coding.h"

#else  /* not emacs */

#include <stdio.h>
#include "mulelib.h"

#endif /* not emacs */

/* Alist of fontname patterns vs corresponding CCL program.  */
Lisp_Object Vfont_ccl_encoder_alist;

/* Vector of CCL program names vs corresponding program data.  */
Lisp_Object Vccl_program_table;

/* CCL (Code Conversion Language) is a simple language which has
   operations on one input buffer, one output buffer, and 7 registers.
   The syntax of CCL is described in `ccl.el'.  Emacs Lisp function
   `ccl-compile' compiles a CCL program and produces a CCL code which
   is a vector of integers.  The structure of this vector is as
   follows: The 1st element: buffer-magnification, a factor for the
   size of output buffer compared with the size of input buffer.  The
   2nd element: address of CCL code to be executed when encountered
   with end of input stream.  The 3rd and the remaining elements: CCL
   codes.  */

/* Header of CCL compiled code */
#define CCL_HEADER_BUF_MAG	0
#define CCL_HEADER_EOF		1
#define CCL_HEADER_MAIN		2

/* CCL code is a sequence of 28-bit non-negative integers (i.e. the
   MSB is always 0), each contains CCL command and/or arguments in the
   following format:

	|----------------- integer (28-bit) ------------------|
	|------- 17-bit ------|- 3-bit --|- 3-bit --|- 5-bit -|
	|--constant argument--|-register-|-register-|-command-|
	   ccccccccccccccccc      RRR        rrr       XXXXX
  or
	|------- relative address -------|-register-|-command-|
	       cccccccccccccccccccc          rrr       XXXXX
  or
	|------------- constant or other args ----------------|
                     cccccccccccccccccccccccccccc

   where, `cc...c' is a non-negative integer indicating constant value
   (the left most `c' is always 0) or an absolute jump address, `RRR'
   and `rrr' are CCL register number, `XXXXX' is one of the following
   CCL commands.  */

/* CCL commands

   Each comment fields shows one or more lines for command syntax and
   the following lines for semantics of the command.  In semantics, IC
   stands for Instruction Counter.  */

#define CCL_SetRegister		0x00 /* Set register a register value:
					1:00000000000000000RRRrrrXXXXX
					------------------------------
					reg[rrr] = reg[RRR];
					*/

#define CCL_SetShortConst	0x01 /* Set register a short constant value:
					1:CCCCCCCCCCCCCCCCCCCCrrrXXXXX
					------------------------------
					reg[rrr] = CCCCCCCCCCCCCCCCCCC;
					*/

#define CCL_SetConst		0x02 /* Set register a constant value:
					1:00000000000000000000rrrXXXXX
					2:CONSTANT
					------------------------------
					reg[rrr] = CONSTANT;
					IC++;
					*/

#define CCL_SetArray		0x03 /* Set register an element of array:
					1:CCCCCCCCCCCCCCCCCRRRrrrXXXXX
					2:ELEMENT[0]
					3:ELEMENT[1]
					...
					------------------------------
					if (0 <= reg[RRR] < CC..C)
					  reg[rrr] = ELEMENT[reg[RRR]];
					IC += CC..C;
					*/

#define CCL_Jump		0x04 /* Jump:
					1:A--D--D--R--E--S--S-000XXXXX
					------------------------------
					IC += ADDRESS;
					*/

/* Note: If CC..C is greater than 0, the second code is omitted.  */

#define CCL_JumpCond		0x05 /* Jump conditional:
					1:A--D--D--R--E--S--S-rrrXXXXX
					------------------------------
					if (!reg[rrr])
					  IC += ADDRESS;
					*/


#define CCL_WriteRegisterJump	0x06 /* Write register and jump:
					1:A--D--D--R--E--S--S-rrrXXXXX
					------------------------------
					write (reg[rrr]);
					IC += ADDRESS;
					*/

#define CCL_WriteRegisterReadJump 0x07 /* Write register, read, and jump:
					1:A--D--D--R--E--S--S-rrrXXXXX
					2:A--D--D--R--E--S--S-rrrYYYYY
					-----------------------------
					write (reg[rrr]);
					IC++;
					read (reg[rrr]);
					IC += ADDRESS;
					*/
/* Note: If read is suspended, the resumed execution starts from the
   second code (YYYYY == CCL_ReadJump).  */

#define CCL_WriteConstJump	0x08 /* Write constant and jump:
					1:A--D--D--R--E--S--S-000XXXXX
					2:CONST
					------------------------------
					write (CONST);
					IC += ADDRESS;
					*/

#define CCL_WriteConstReadJump	0x09 /* Write constant, read, and jump:
					1:A--D--D--R--E--S--S-rrrXXXXX
					2:CONST
					3:A--D--D--R--E--S--S-rrrYYYYY
					-----------------------------
					write (CONST);
					IC += 2;
					read (reg[rrr]);
					IC += ADDRESS;
					*/
/* Note: If read is suspended, the resumed execution starts from the
   second code (YYYYY == CCL_ReadJump).  */

#define CCL_WriteStringJump	0x0A /* Write string and jump:
					1:A--D--D--R--E--S--S-000XXXXX
					2:LENGTH
					3:0000STRIN[0]STRIN[1]STRIN[2]
					...
					------------------------------
					write_string (STRING, LENGTH);
					IC += ADDRESS;
					*/

#define CCL_WriteArrayReadJump	0x0B /* Write an array element, read, and jump:
					1:A--D--D--R--E--S--S-rrrXXXXX
					2:LENGTH
					3:ELEMENET[0]
					4:ELEMENET[1]
					...
					N:A--D--D--R--E--S--S-rrrYYYYY
					------------------------------
					if (0 <= reg[rrr] < LENGTH)
					  write (ELEMENT[reg[rrr]]);
					IC += LENGTH + 2; (... pointing at N+1)
					read (reg[rrr]);
					IC += ADDRESS;
					*/
/* Note: If read is suspended, the resumed execution starts from the
   Nth code (YYYYY == CCL_ReadJump).  */

#define CCL_ReadJump		0x0C /* Read and jump:
					1:A--D--D--R--E--S--S-rrrYYYYY
					-----------------------------
					read (reg[rrr]);
					IC += ADDRESS;
					*/

#define CCL_Branch		0x0D /* Jump by branch table:
					1:CCCCCCCCCCCCCCCCCCCCrrrXXXXX
					2:A--D--D--R--E-S-S[0]000XXXXX
					3:A--D--D--R--E-S-S[1]000XXXXX
					...
					------------------------------
					if (0 <= reg[rrr] < CC..C)
					  IC += ADDRESS[reg[rrr]];
					else
					  IC += ADDRESS[CC..C];
					*/

#define CCL_ReadRegister	0x0E /* Read bytes into registers:
					1:CCCCCCCCCCCCCCCCCCCCrrrXXXXX
					2:CCCCCCCCCCCCCCCCCCCCrrrXXXXX
					...
					------------------------------
					while (CCC--)
					  read (reg[rrr]);
					*/

#define CCL_WriteExprConst	0x0F  /* write result of expression:
					1:00000OPERATION000RRR000XXXXX
					2:CONSTANT
					------------------------------
					write (reg[RRR] OPERATION CONSTANT);
					IC++;
					*/

/* Note: If the Nth read is suspended, the resumed execution starts
   from the Nth code.  */

#define CCL_ReadBranch		0x10 /* Read one byte into a register,
					and jump by branch table:
					1:CCCCCCCCCCCCCCCCCCCCrrrXXXXX
					2:A--D--D--R--E-S-S[0]000XXXXX
					3:A--D--D--R--E-S-S[1]000XXXXX
					...
					------------------------------
					read (read[rrr]);
					if (0 <= reg[rrr] < CC..C)
					  IC += ADDRESS[reg[rrr]];
					else
					  IC += ADDRESS[CC..C];
					*/

#define CCL_WriteRegister	0x11 /* Write registers:
					1:CCCCCCCCCCCCCCCCCCCrrrXXXXX
					2:CCCCCCCCCCCCCCCCCCCrrrXXXXX
					...
					------------------------------
					while (CCC--)
					  write (reg[rrr]);
					...
					*/

/* Note: If the Nth write is suspended, the resumed execution
   starts from the Nth code.  */

#define CCL_WriteExprRegister	0x12 /* Write result of expression
					1:00000OPERATIONRrrRRR000XXXXX
					------------------------------
					write (reg[RRR] OPERATION reg[Rrr]);
					*/

#define CCL_Call		0x13 /* Write a constant:
					1:CCCCCCCCCCCCCCCCCCCC000XXXXX
					------------------------------
					call (CC..C)
					*/

#define CCL_WriteConstString	0x14 /* Write a constant or a string:
					1:CCCCCCCCCCCCCCCCCCCCrrrXXXXX
					[2:0000STRIN[0]STRIN[1]STRIN[2]]
					[...]
					-----------------------------
					if (!rrr)
					  write (CC..C)
					else
					  write_string (STRING, CC..C);
					  IC += (CC..C + 2) / 3;
					*/

#define CCL_WriteArray		0x15 /* Write an element of array:
					1:CCCCCCCCCCCCCCCCCCCCrrrXXXXX
					2:ELEMENT[0]
					3:ELEMENT[1]
					...
					------------------------------
					if (0 <= reg[rrr] < CC..C)
					  write (ELEMENT[reg[rrr]]);
					IC += CC..C;
					*/

#define CCL_End			0x16 /* Terminate:
					1:00000000000000000000000XXXXX
					------------------------------
					terminate ();
					*/

/* The following two codes execute an assignment arithmetic/logical
   operation.  The form of the operation is like REG OP= OPERAND.  */

#define CCL_ExprSelfConst	0x17 /* REG OP= constant:
					1:00000OPERATION000000rrrXXXXX
					2:CONSTANT
					------------------------------
					reg[rrr] OPERATION= CONSTANT;
					*/

#define CCL_ExprSelfReg		0x18 /* REG1 OP= REG2:
					1:00000OPERATION000RRRrrrXXXXX
					------------------------------
					reg[rrr] OPERATION= reg[RRR];
					*/

/* The following codes execute an arithmetic/logical operation.  The
   form of the operation is like REG_X = REG_Y OP OPERAND2.  */

#define CCL_SetExprConst	0x19 /* REG_X = REG_Y OP constant:
					1:00000OPERATION000RRRrrrXXXXX
					2:CONSTANT
					------------------------------
					reg[rrr] = reg[RRR] OPERATION CONSTANT;
					IC++;
					*/

#define CCL_SetExprReg		0x1A /* REG1 = REG2 OP REG3:
					1:00000OPERATIONRrrRRRrrrXXXXX
					------------------------------
					reg[rrr] = reg[RRR] OPERATION reg[Rrr];
					*/

#define CCL_JumpCondExprConst	0x1B /* Jump conditional according to
					an operation on constant:
					1:A--D--D--R--E--S--S-rrrXXXXX
					2:OPERATION
					3:CONSTANT
					-----------------------------
					reg[7] = reg[rrr] OPERATION CONSTANT;
					if (!(reg[7]))
					  IC += ADDRESS;
					else
					  IC += 2
					*/

#define CCL_JumpCondExprReg	0x1C /* Jump conditional according to
					an operation on register:
					1:A--D--D--R--E--S--S-rrrXXXXX
					2:OPERATION
					3:RRR
					-----------------------------
					reg[7] = reg[rrr] OPERATION reg[RRR];
					if (!reg[7])
					  IC += ADDRESS;
					else
					  IC += 2;
					*/

#define CCL_ReadJumpCondExprConst 0x1D /* Read and jump conditional according
					  to an operation on constant:
					1:A--D--D--R--E--S--S-rrrXXXXX
					2:OPERATION
					3:CONSTANT
					-----------------------------
					read (reg[rrr]);
					reg[7] = reg[rrr] OPERATION CONSTANT;
					if (!reg[7])
					  IC += ADDRESS;
					else
					  IC += 2;
					*/

#define CCL_ReadJumpCondExprReg	0x1E /* Read and jump conditional according
					to an operation on register:
					1:A--D--D--R--E--S--S-rrrXXXXX
					2:OPERATION
					3:RRR
					-----------------------------
					read (reg[rrr]);
					reg[7] = reg[rrr] OPERATION reg[RRR];
					if (!reg[7])
					  IC += ADDRESS;
					else
					  IC += 2;
					*/

#define CCL_Extention		0x1F /* Extended CCL code
					1:ExtendedCOMMNDRrrRRRrrrXXXXX
					2:ARGUEMENT
					3:...
					------------------------------
					extended_command (rrr,RRR,Rrr,ARGS)
				      */


/* CCL arithmetic/logical operators. */
#define CCL_PLUS	0x00	/* X = Y + Z */
#define CCL_MINUS	0x01	/* X = Y - Z */
#define CCL_MUL		0x02	/* X = Y * Z */
#define CCL_DIV		0x03	/* X = Y / Z */
#define CCL_MOD		0x04	/* X = Y % Z */
#define CCL_AND		0x05	/* X = Y & Z */
#define CCL_OR		0x06	/* X = Y | Z */
#define CCL_XOR		0x07	/* X = Y ^ Z */
#define CCL_LSH		0x08	/* X = Y << Z */
#define CCL_RSH		0x09	/* X = Y >> Z */
#define CCL_LSH8	0x0A	/* X = (Y << 8) | Z */
#define CCL_RSH8	0x0B	/* X = Y >> 8, r[7] = Y & 0xFF  */
#define CCL_DIVMOD	0x0C	/* X = Y / Z, r[7] = Y % Z */
#define CCL_LS		0x10	/* X = (X < Y) */
#define CCL_GT		0x11	/* X = (X > Y) */
#define CCL_EQ		0x12	/* X = (X == Y) */
#define CCL_LE		0x13	/* X = (X <= Y) */
#define CCL_GE		0x14	/* X = (X >= Y) */
#define CCL_NE		0x15	/* X = (X != Y) */

#define CCL_ENCODE_SJIS 0x16	/* X = HIGHER_BYTE (SJIS (Y, Z))
				   r[7] = LOWER_BYTE (SJIS (Y, Z) */
#define CCL_DECODE_SJIS 0x17	/* X = HIGHER_BYTE (DE-SJIS (Y, Z))
				   r[7] = LOWER_BYTE (DE-SJIS (Y, Z)) */

/* Macros for exit status of CCL program.  */
#define CCL_STAT_SUCCESS	0 /* Terminated successfully.  */
#define CCL_STAT_SUSPEND	1 /* Terminated because of empty input
				     buffer or full output buffer.  */
#define CCL_STAT_INVALID_CMD	2 /* Terminated because of invalid
				     command.  */
#define CCL_STAT_QUIT		3 /* Terminated because of quit.  */

/* Encode one character CH to multibyte form and write to the current
   output buffer.  If CH is less than 256, CH is written as is.  */
#define CCL_WRITE_CHAR(ch) do {				\
  if (!destination)					\
    {							\
      ccl->status = CCL_STAT_INVALID_CMD;		\
      goto ccl_error_handler;				\
    }							\
  else							\
    {							\
      Bufbyte work[MAX_EMCHAR_LEN];			\
      int len = ( ch < ( conversion_mode == CCL_MODE_ENCODING ? \
                         256 : 128 ) ) ?			\
	simple_set_charptr_emchar (work, ch) :		\
	non_ascii_set_charptr_emchar (work, ch);	\
      Dynarr_add_many (destination, work, len);		\
    }							\
} while (0)

/* Write a string at ccl_prog[IC] of length LEN to the current output
   buffer.  */
#define CCL_WRITE_STRING(len) do {			\
  if (!destination)					\
    {							\
      ccl->status = CCL_STAT_INVALID_CMD;		\
      goto ccl_error_handler;				\
    }							\
  else							\
    for (i = 0; i < len; i++)				\
      Dynarr_add(destination,				\
		 (XINT (ccl_prog[ic + (i / 3)])		\
		  >> ((2 - (i % 3)) * 8)) & 0xFF);	\
} while (0)

/* Read one byte from the current input buffer into Rth register.  */
#define CCL_READ_CHAR(r) do {			\
  if (!src)					\
    {						\
      ccl->status = CCL_STAT_INVALID_CMD;	\
      goto ccl_error_handler;			\
    }						\
  else if (src < src_end)			\
    r = *src++;					\
  else if (ccl->last_block)			\
    {						\
      ic = ccl->eof_ic;				\
      goto ccl_finish;				\
    }						\
  else						\
    /* Suspend CCL program because of		\
       reading from empty input buffer or	\
       writing to full output buffer.		\
       When this program is resumed, the	\
       same I/O command is executed.  */	\
    {						\
      ic--;					\
      ccl->status = CCL_STAT_SUSPEND;		\
      goto ccl_finish;				\
    }						\
} while (0)


/* Execute CCL code on SRC_BYTES length text at SOURCE.  The resulting
   text goes to a place pointed by DESTINATION. The bytes actually
   processed is returned as *CONSUMED.  The return value is the length
   of the resulting text.  As a side effect, the contents of CCL registers
   are updated.  If SOURCE or DESTINATION is NULL, only operations on
   registers are permitted.  */

#ifdef CCL_DEBUG
#define CCL_DEBUG_BACKTRACE_LEN 256
int ccl_backtrace_table[CCL_BACKTRACE_TABLE];
int ccl_backtrace_idx;
#endif

struct ccl_prog_stack
  {
    Lisp_Object *ccl_prog;	/* Pointer to an array of CCL code.  */
    int ic;			/* Instruction Counter.  */
  };

int
ccl_driver (struct ccl_program *ccl, CONST unsigned char *source, unsigned_char_dynarr *destination, int src_bytes, int *consumed, int conversion_mode)
{
  int *reg = ccl->reg;
  int ic = ccl->ic;
  int code = -1; /* init to illegal value,  */
  int field1, field2;
  Lisp_Object *ccl_prog = ccl->prog;
  CONST unsigned char *src = source, *src_end = src + src_bytes;
  int jump_address = 0; /* shut up the compiler */

  int i, j, op;
  int stack_idx = 0;
  /* For the moment, we only support depth 256 of stack.  */
  struct ccl_prog_stack ccl_prog_stack_struct[256];

  if (ic >= ccl->eof_ic)
    ic = CCL_HEADER_MAIN;

#ifdef CCL_DEBUG
  ccl_backtrace_idx = 0;
#endif

  for (;;)
    {
#ifdef CCL_DEBUG
      ccl_backtrace_table[ccl_backtrace_idx++] = ic;
      if (ccl_backtrace_idx >= CCL_DEBUG_BACKTRACE_LEN)
	ccl_backtrace_idx = 0;
      ccl_backtrace_table[ccl_backtrace_idx] = 0;
#endif

      if (!NILP (Vquit_flag) && NILP (Vinhibit_quit))
	{
	  /* We can't just signal Qquit, instead break the loop as if
             the whole data is processed.  Don't reset Vquit_flag, it
             must be handled later at a safer place.  */
	  if (consumed)
	    src = source + src_bytes;
	  ccl->status = CCL_STAT_QUIT;
	  break;
	}

      code = XINT (ccl_prog[ic]); ic++;
      field1 = code >> 8;
      field2 = (code & 0xFF) >> 5;

#define rrr field2
#define RRR (field1 & 7)
#define Rrr ((field1 >> 3) & 7)
#define ADDR field1

      switch (code & 0x1F)
	{
	case CCL_SetRegister:	/* 00000000000000000RRRrrrXXXXX */
	  reg[rrr] = reg[RRR];
	  break;

	case CCL_SetShortConst:	/* CCCCCCCCCCCCCCCCCCCCrrrXXXXX */
	  reg[rrr] = field1;
	  break;

	case CCL_SetConst:	/* 00000000000000000000rrrXXXXX */
	  reg[rrr] = XINT (ccl_prog[ic]);
	  ic++;
	  break;

	case CCL_SetArray:	/* CCCCCCCCCCCCCCCCCCCCRRRrrrXXXXX */
	  i = reg[RRR];
	  j = field1 >> 3;
	  if ((unsigned int) i < j)
	    reg[rrr] = XINT (ccl_prog[ic + i]);
	  ic += j;
	  break;

	case CCL_Jump:		/* A--D--D--R--E--S--S-000XXXXX */
	  ic += ADDR;
	  break;

	case CCL_JumpCond:	/* A--D--D--R--E--S--S-rrrXXXXX */
	  if (!reg[rrr])
	    ic += ADDR;
	  break;

	case CCL_WriteRegisterJump: /* A--D--D--R--E--S--S-rrrXXXXX */
	  i = reg[rrr];
	  CCL_WRITE_CHAR (i);
	  ic += ADDR;
	  break;

	case CCL_WriteRegisterReadJump: /* A--D--D--R--E--S--S-rrrXXXXX */
	  i = reg[rrr];
	  CCL_WRITE_CHAR (i);
	  ic++;
	  CCL_READ_CHAR (reg[rrr]);
	  ic += ADDR - 1;
	  break;

	case CCL_WriteConstJump: /* A--D--D--R--E--S--S-000XXXXX */
	  i = XINT (ccl_prog[ic]);
	  CCL_WRITE_CHAR (i);
	  ic += ADDR;
	  break;

	case CCL_WriteConstReadJump: /* A--D--D--R--E--S--S-rrrXXXXX */
	  i = XINT (ccl_prog[ic]);
	  CCL_WRITE_CHAR (i);
	  ic++;
	  CCL_READ_CHAR (reg[rrr]);
	  ic += ADDR - 1;
	  break;

	case CCL_WriteStringJump: /* A--D--D--R--E--S--S-000XXXXX */
	  j = XINT (ccl_prog[ic]);
	  ic++;
	  CCL_WRITE_STRING (j);
	  ic += ADDR - 1;
	  break;

	case CCL_WriteArrayReadJump: /* A--D--D--R--E--S--S-rrrXXXXX */
	  i = reg[rrr];
	  j = XINT (ccl_prog[ic]);
	  if ((unsigned int) i < j)
	    {
	      i = XINT (ccl_prog[ic + 1 + i]);
	      CCL_WRITE_CHAR (i);
	    }
	  ic += j + 2;
	  CCL_READ_CHAR (reg[rrr]);
	  ic += ADDR - (j + 2);
	  break;

	case CCL_ReadJump:	/* A--D--D--R--E--S--S-rrrYYYYY */
	  CCL_READ_CHAR (reg[rrr]);
	  ic += ADDR;
	  break;

	case CCL_ReadBranch:	/* CCCCCCCCCCCCCCCCCCCCrrrXXXXX */
	  CCL_READ_CHAR (reg[rrr]);
	  /* fall through ... */
	case CCL_Branch:	/* CCCCCCCCCCCCCCCCCCCCrrrXXXXX */
	  if ((unsigned int) reg[rrr] < field1)
	    ic += XINT (ccl_prog[ic + reg[rrr]]);
	  else
	    ic += XINT (ccl_prog[ic + field1]);
	  break;

	case CCL_ReadRegister:	/* CCCCCCCCCCCCCCCCCCCCrrXXXXX */
	  while (1)
	    {
	      CCL_READ_CHAR (reg[rrr]);
	      if (!field1) break;
	      code = XINT (ccl_prog[ic]); ic++;
	      field1 = code >> 8;
	      field2 = (code & 0xFF) >> 5;
	    }
	  break;

	case CCL_WriteExprConst:  /* 1:00000OPERATION000RRR000XXXXX */
	  rrr = 7;
	  i = reg[RRR];
	  j = XINT (ccl_prog[ic]);
	  op = field1 >> 6;
	  ic++;
	  goto ccl_set_expr;

	case CCL_WriteRegister:	/* CCCCCCCCCCCCCCCCCCCrrrXXXXX */
	  while (1)
	    {
	      i = reg[rrr];
	      CCL_WRITE_CHAR (i);
	      if (!field1) break;
	      code = XINT (ccl_prog[ic]); ic++;
	      field1 = code >> 8;
	      field2 = (code & 0xFF) >> 5;
	    }
	  break;

	case CCL_WriteExprRegister: /* 1:00000OPERATIONRrrRRR000XXXXX */
	  rrr = 7;
	  i = reg[RRR];
	  j = reg[Rrr];
	  op = field1 >> 6;
	  goto ccl_set_expr;

	case CCL_Call:		/* CCCCCCCCCCCCCCCCCCCC000XXXXX */
	  {
	    Lisp_Object slot;

	    if (stack_idx >= 256
		|| field1 < 0
		|| field1 >= XVECTOR_LENGTH (Vccl_program_table)
		|| (slot = XVECTOR_DATA (Vccl_program_table)[field1],
		    !CONSP (slot))
		|| !VECTORP (XCDR (slot)))
	      {
		if (stack_idx > 0)
		  {
		    ccl_prog = ccl_prog_stack_struct[0].ccl_prog;
		    ic = ccl_prog_stack_struct[0].ic;
		  }
		ccl->status = CCL_STAT_INVALID_CMD;
		goto ccl_error_handler;
	      }

	    ccl_prog_stack_struct[stack_idx].ccl_prog = ccl_prog;
	    ccl_prog_stack_struct[stack_idx].ic = ic;
	    stack_idx++;
	    ccl_prog = XVECTOR_DATA (XCDR (slot));
	    ic = CCL_HEADER_MAIN;
	  }
	  break;

	case CCL_WriteConstString: /* CCCCCCCCCCCCCCCCCCCCrrrXXXXX */
	  if (!rrr)
	    CCL_WRITE_CHAR (field1);
	  else
	    {
	      CCL_WRITE_STRING (field1);
	      ic += (field1 + 2) / 3;
	    }
	  break;

	case CCL_WriteArray:	/* CCCCCCCCCCCCCCCCCCCCrrrXXXXX */
	  i = reg[rrr];
	  if ((unsigned int) i < field1)
	    {
	      j = XINT (ccl_prog[ic + i]);
	      CCL_WRITE_CHAR (j);
	    }
	  ic += field1;
	  break;

	case CCL_End:		/* 0000000000000000000000XXXXX */
	  if (stack_idx-- > 0)
	    {
	      ccl_prog = ccl_prog_stack_struct[stack_idx].ccl_prog;
	      ic = ccl_prog_stack_struct[stack_idx].ic;
	      break;
	    }
	  /* Terminate CCL program successfully.  */
	  ccl->status = CCL_STAT_SUCCESS;
	  ccl->ic = CCL_HEADER_MAIN;
	  goto ccl_finish;

	case CCL_ExprSelfConst: /* 00000OPERATION000000rrrXXXXX */
	  i = XINT (ccl_prog[ic]);
	  ic++;
	  op = field1 >> 6;
	  goto ccl_expr_self;

	case CCL_ExprSelfReg:	/* 00000OPERATION000RRRrrrXXXXX */
	  i = reg[RRR];
	  op = field1 >> 6;

	ccl_expr_self:
	  switch (op)
	    {
	    case CCL_PLUS: reg[rrr] += i; break;
	    case CCL_MINUS: reg[rrr] -= i; break;
	    case CCL_MUL: reg[rrr] *= i; break;
	    case CCL_DIV: reg[rrr] /= i; break;
	    case CCL_MOD: reg[rrr] %= i; break;
	    case CCL_AND: reg[rrr] &= i; break;
	    case CCL_OR: reg[rrr] |= i; break;
	    case CCL_XOR: reg[rrr] ^= i; break;
	    case CCL_LSH: reg[rrr] <<= i; break;
	    case CCL_RSH: reg[rrr] >>= i; break;
	    case CCL_LSH8: reg[rrr] <<= 8; reg[rrr] |= i; break;
	    case CCL_RSH8: reg[7] = reg[rrr] & 0xFF; reg[rrr] >>= 8; break;
	    case CCL_DIVMOD: reg[7] = reg[rrr] % i; reg[rrr] /= i; break;
	    case CCL_LS: reg[rrr] = reg[rrr] < i; break;
	    case CCL_GT: reg[rrr] = reg[rrr] > i; break;
	    case CCL_EQ: reg[rrr] = reg[rrr] == i; break;
	    case CCL_LE: reg[rrr] = reg[rrr] <= i; break;
	    case CCL_GE: reg[rrr] = reg[rrr] >= i; break;
	    case CCL_NE: reg[rrr] = reg[rrr] != i; break;
	    default:
	      ccl->status = CCL_STAT_INVALID_CMD;
	      goto ccl_error_handler;
	    }
	  break;

	case CCL_SetExprConst:	/* 00000OPERATION000RRRrrrXXXXX */
	  i = reg[RRR];
	  j = XINT (ccl_prog[ic]);
	  op = field1 >> 6;
	  jump_address = ++ic;
	  goto ccl_set_expr;

	case CCL_SetExprReg:	/* 00000OPERATIONRrrRRRrrrXXXXX */
	  i = reg[RRR];
	  j = reg[Rrr];
	  op = field1 >> 6;
	  jump_address = ic;
	  goto ccl_set_expr;

	case CCL_ReadJumpCondExprConst: /* A--D--D--R--E--S--S-rrrXXXXX */
	  CCL_READ_CHAR (reg[rrr]);
	case CCL_JumpCondExprConst: /* A--D--D--R--E--S--S-rrrXXXXX */
	  i = reg[rrr];
	  op = XINT (ccl_prog[ic]);
	  jump_address = ic++ + ADDR;
	  j = XINT (ccl_prog[ic]);
	  ic++;
	  rrr = 7;
	  goto ccl_set_expr;

	case CCL_ReadJumpCondExprReg: /* A--D--D--R--E--S--S-rrrXXXXX */
	  CCL_READ_CHAR (reg[rrr]);
	case CCL_JumpCondExprReg:
	  i = reg[rrr];
	  op = XINT (ccl_prog[ic]);
	  jump_address = ic++ + ADDR;
	  j = reg[XINT (ccl_prog[ic])];
	  ic++;
	  rrr = 7;

	ccl_set_expr:
	  switch (op)
	    {
	    case CCL_PLUS: reg[rrr] = i + j; break;
	    case CCL_MINUS: reg[rrr] = i - j; break;
	    case CCL_MUL: reg[rrr] = i * j; break;
	    case CCL_DIV: reg[rrr] = i / j; break;
	    case CCL_MOD: reg[rrr] = i % j; break;
	    case CCL_AND: reg[rrr] = i & j; break;
	    case CCL_OR: reg[rrr] = i | j; break;
	    case CCL_XOR: reg[rrr] = i ^ j; break;
	    case CCL_LSH: reg[rrr] = i << j; break;
	    case CCL_RSH: reg[rrr] = i >> j; break;
	    case CCL_LSH8: reg[rrr] = (i << 8) | j; break;
	    case CCL_RSH8: reg[rrr] = i >> 8; reg[7] = i & 0xFF; break;
	    case CCL_DIVMOD: reg[rrr] = i / j; reg[7] = i % j; break;
	    case CCL_LS: reg[rrr] = i < j; break;
	    case CCL_GT: reg[rrr] = i > j; break;
	    case CCL_EQ: reg[rrr] = i == j; break;
	    case CCL_LE: reg[rrr] = i <= j; break;
	    case CCL_GE: reg[rrr] = i >= j; break;
	    case CCL_NE: reg[rrr] = i != j; break;
	    case CCL_ENCODE_SJIS: ENCODE_SJIS (i, j, reg[rrr], reg[7]); break;
	    case CCL_DECODE_SJIS: DECODE_SJIS (i, j, reg[rrr], reg[7]); break;
	    default:
	      ccl->status = CCL_STAT_INVALID_CMD;
	      goto ccl_error_handler;
	    }
	  code &= 0x1F;
	  if (code == CCL_WriteExprConst || code == CCL_WriteExprRegister)
	    {
	      i = reg[rrr];
	      CCL_WRITE_CHAR (i);
	    }
	  else if (!reg[rrr])
	    ic = jump_address;
	  break;

	default:
	  ccl->status = CCL_STAT_INVALID_CMD;
	  goto ccl_error_handler;
	}
    }

 ccl_error_handler:
  if (destination)
    {
      /* We can insert an error message only if DESTINATION is
         specified and we still have a room to store the message
         there.  */
      char msg[256];

      switch (ccl->status)
	{
	  /* Terminate CCL program because of invalid command.
	     Should not occur in the normal case.  */
	case CCL_STAT_INVALID_CMD:
	  sprintf(msg, "\nCCL: Invalid command %x (ccl_code = %x) at %d.",
		  code & 0x1F, code, ic);
#ifdef CCL_DEBUG
	  {
	    int i = ccl_backtrace_idx - 1;
	    int j;

	    Dynarr_add_many (destination, (unsigned char *) msg, strlen (msg));

	    for (j = 0; j < CCL_DEBUG_BACKTRACE_LEN; j++, i--)
	      {
		if (i < 0) i = CCL_DEBUG_BACKTRACE_LEN - 1;
		if (ccl_backtrace_table[i] == 0)
		  break;
		sprintf(msg, " %d", ccl_backtrace_table[i]);
		Dynarr_add_many (destination, (unsigned char *) msg, strlen (msg));
	      }
	  }
#endif
	  goto ccl_finish;

	case CCL_STAT_QUIT:
	  sprintf(msg, "\nCCL: Quited.");
	  break;

	default:
	  sprintf(msg, "\nCCL: Unknown error type (%d).", ccl->status);
	}

      Dynarr_add_many (destination, (unsigned char *) msg, strlen (msg));
    }

 ccl_finish:
  ccl->ic = ic;
  if (consumed) *consumed = src - source;
  if (destination)
    return Dynarr_length (destination);
  else
    return 0;
}

/* Setup fields of the structure pointed by CCL appropriately for the
   execution of compiled CCL code in VEC (vector of integer).  */
void
setup_ccl_program (struct ccl_program *ccl, Lisp_Object vec)
{
  int i;

  ccl->size = XVECTOR_LENGTH (vec);
  ccl->prog = XVECTOR_DATA (vec);
  ccl->ic = CCL_HEADER_MAIN;
  ccl->eof_ic = XINT (XVECTOR_DATA (vec)[CCL_HEADER_EOF]);
  ccl->buf_magnification = XINT (XVECTOR_DATA (vec)[CCL_HEADER_BUF_MAG]);
  for (i = 0; i < 8; i++)
    ccl->reg[i] = 0;
  ccl->last_block = 0;
  ccl->status = 0;
}

#ifdef emacs

DEFUN ("ccl-execute", Fccl_execute, 2, 2, 0, /*
Execute CCL-PROGRAM with registers initialized by REGISTERS.
CCL-PROGRAM is a compiled code generated by `ccl-compile',
 no I/O commands should appear in the CCL program.
REGISTERS is a vector of [R0 R1 ... R7] where RN is an initial value
 of Nth register.
As side effect, each element of REGISTER holds the value of
 corresponding register after the execution.
*/
  (ccl_prog, reg))
{
  struct ccl_program ccl;
  int i;

  CHECK_VECTOR (ccl_prog);
  CHECK_VECTOR (reg);
  if (XVECTOR_LENGTH (reg) != 8)
    signal_simple_error ("Vector should be of length 8", reg);

  setup_ccl_program (&ccl, ccl_prog);
  for (i = 0; i < 8; i++)
    ccl.reg[i] = (INTP (XVECTOR_DATA (reg)[i])
		  ? XINT (XVECTOR_DATA (reg)[i])
		  : 0);

  ccl_driver (&ccl, (CONST unsigned char *)0, (unsigned_char_dynarr *)0,
	      0, (int *)0, CCL_MODE_ENCODING);
  QUIT;
  if (ccl.status != CCL_STAT_SUCCESS)
    error ("Error in CCL program at %dth code", ccl.ic);

  for (i = 0; i < 8; i++)
    XSETINT (XVECTOR_DATA (reg)[i], ccl.reg[i]);
  return Qnil;
}

DEFUN ("ccl-execute-on-string", Fccl_execute_on_string, 3, 4, 0, /*
Execute CCL-PROGRAM with initial STATUS on STRING.
CCL-PROGRAM is a compiled code generated by `ccl-compile'.
Read buffer is set to STRING, and write buffer is allocated automatically.
STATUS is a vector of [R0 R1 ... R7 IC], where
 R0..R7 are initial values of corresponding registers,
 IC is the instruction counter specifying from where to start the program.
If R0..R7 are nil, they are initialized to 0.
If IC is nil, it is initialized to head of the CCL program.
Returns the contents of write buffer as a string,
 and as side effect, STATUS is updated.
If optional 4th arg CONTINUE is non-nil, keep IC on read operation
when read buffer is exausted, else, IC is always set to the end of
CCL-PROGRAM on exit.
*/
  (ccl_prog, status, str, contin))
{
  Lisp_Object val;
  struct ccl_program ccl;
  int i, produced;
  unsigned_char_dynarr *outbuf;
  struct gcpro gcpro1, gcpro2, gcpro3;

  CHECK_VECTOR (ccl_prog);
  CHECK_VECTOR (status);
  if (XVECTOR_LENGTH (status) != 9)
    signal_simple_error ("Vector should be of length 9", status);
  CHECK_STRING (str);
  GCPRO3 (ccl_prog, status, str);

  setup_ccl_program (&ccl, ccl_prog);
  for (i = 0; i < 8; i++)
    {
      if (NILP (XVECTOR_DATA (status)[i]))
	XSETINT (XVECTOR_DATA (status)[i], 0);
      if (INTP (XVECTOR_DATA (status)[i]))
	ccl.reg[i] = XINT (XVECTOR_DATA (status)[i]);
    }
  if (INTP (XVECTOR_DATA (status)[8]))
    {
      i = XINT (XVECTOR_DATA (status)[8]);
      if (ccl.ic < i && i < ccl.size)
	ccl.ic = i;
    }
  outbuf = Dynarr_new (unsigned_char);
  ccl.last_block = NILP (contin);
  produced = ccl_driver (&ccl, XSTRING_DATA (str), outbuf,
			 XSTRING_LENGTH (str), (int *)0, CCL_MODE_ENCODING);
  for (i = 0; i < 8; i++)
    XVECTOR_DATA (status)[i] = make_int(ccl.reg[i]);
  XSETINT (XVECTOR_DATA (status)[8], ccl.ic);
  UNGCPRO;

  val = make_string (Dynarr_atp (outbuf, 0), produced);
  Dynarr_free (outbuf);
  QUIT;
  if (ccl.status != CCL_STAT_SUCCESS
      && ccl.status != CCL_STAT_SUSPEND)
    error ("Error in CCL program at %dth code", ccl.ic);

  return val;
}

DEFUN ("register-ccl-program", Fregister_ccl_program, 2, 2, 0, /*
Register CCL program PROGRAM of NAME in `ccl-program-table'.
PROGRAM should be a compiled code of CCL program, or nil.
Return index number of the registered CCL program.
*/
  (name, ccl_prog))
{
  int len = XVECTOR_LENGTH (Vccl_program_table);
  int i;

  CHECK_SYMBOL (name);
  if (!NILP (ccl_prog))
    CHECK_VECTOR (ccl_prog);

  for (i = 0; i < len; i++)
    {
      Lisp_Object slot = XVECTOR_DATA (Vccl_program_table)[i];

      if (!CONSP (slot))
	break;

      if (EQ (name, XCAR (slot)))
	{
	  XCDR (slot) = ccl_prog;
	  return make_int (i);
	}
    }

  if (i == len)
    {
      Lisp_Object new_table = Fmake_vector (make_int (len * 2), Qnil);
      int j;

      for (j = 0; j < len; j++)
	XVECTOR_DATA (new_table)[j]
	  = XVECTOR_DATA (Vccl_program_table)[j];
      Vccl_program_table = new_table;
    }

  XVECTOR_DATA (Vccl_program_table)[i] = Fcons (name, ccl_prog);
  return make_int (i);
}

void
syms_of_mule_ccl (void)
{
  DEFSUBR (Fccl_execute);
  DEFSUBR (Fccl_execute_on_string);
  DEFSUBR (Fregister_ccl_program);
}

void
vars_of_mule_ccl (void)
{
  staticpro (&Vccl_program_table);
  Vccl_program_table = Fmake_vector (make_int (32), Qnil);

  DEFVAR_LISP ("font-ccl-encoder-alist", &Vfont_ccl_encoder_alist /*
Alist of fontname patterns vs corresponding CCL program.
Each element looks like (REGEXP . CCL-CODE),
 where CCL-CODE is a compiled CCL program.
When a font whose name matches REGEXP is used for displaying a character,
 CCL-CODE is executed to calculate the code point in the font
 from the charset number and position code(s) of the character which are set
 in CCL registers R0, R1, and R2 before the execution.
The code point in the font is set in CCL registers R1 and R2
 when the execution terminated.
If the font is single-byte font, the register R2 is not used.
*/ );
  Vfont_ccl_encoder_alist = Qnil;
}

#endif  /* emacs */
