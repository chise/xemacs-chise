/* The lisp stack.
   Copyright (C) 1985, 1986, 1987, 1992, 1993 Free Software Foundation, Inc.

This file is part of XEmacs.

XEmacs is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2, or (at your option) any
later version.

XEmacs is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with XEmacs; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

/* Synched up with: FSF 19.30.  Contained redundantly in various C files
   in FSFmacs. */

/* Authorship:

   FSF: Original version; a long time ago.
   XEmacs: split out of some C files. (For some obscure reason, a header
           file couldn't be used in FSF Emacs, but XEmacs doesn't have
	   that problem.)
   Mly (probably) or JWZ: Some changes.
 */

#ifndef _XEMACS_BACKTRACE_H_
#define _XEMACS_BACKTRACE_H_

#include <setjmp.h>

/* These definitions are used in eval.c and alloc.c */

struct backtrace
  {
    struct backtrace *next;
    Lisp_Object *function;
    Lisp_Object *args;		/* Points to vector of args. */
    int nargs;			/* Length of vector.
				   If nargs is UNEVALLED, args points to
				   slot holding list of unevalled args */
    int pdlcount;               /* specpdl_depth () when invoked */
#ifdef EMACS_BTL
    /* The value of a Lisp integer that specifies the symbol being
       "invoked" by this node in the backtrace, or 0 if the backtrace
       doesn't correspond to a such an invocation */
    int id_number;
#endif
    char evalargs;
    /* Nonzero means call value of debugger when done with this operation. */
    char debug_on_exit;
  };

/* This structure helps implement the `catch' and `throw' control
   structure.  A struct catchtag contains all the information needed
   to restore the state of the interpreter after a non-local jump.

   Handlers for error conditions (represented by `struct handler'
   structures) just point to a catch tag to do the cleanup required
   for their jumps.

   catchtag structures are chained together in the C calling stack;
   the `next' member points to the next outer catchtag.

   A call like (throw TAG VAL) searches for a catchtag whose `tag'
   member is TAG, and then unbinds to it.  The `val' member is used to
   hold VAL while the stack is unwound; `val' is returned as the value
   of the catch form.

   All the other members are concerned with restoring the interpreter
   state.  */

struct catchtag
  {
    Lisp_Object tag;
    Lisp_Object val;
    struct catchtag *next;
    struct gcpro *gcpro;
    JMP_BUF jmp;
    struct backtrace *backlist;
#if 0 /* FSFmacs */
    /* #### */
    struct handler *handlerlist;
#endif
    int lisp_eval_depth;
    int pdlcount;
#if 0 /* FSFmacs */
    /* This is the equivalent of async_timer_suppress_count.
       We probably don't have to bother with this. */
    int poll_suppress_count;
#endif
  };

/* Dynamic-binding-o-rama */

/* Structure for recording Lisp call stack for backtrace purposes.  */

/* The special binding stack holds the outer values of variables while
   they are bound by a function application or a let form, stores the
   code to be executed for Lisp unwind-protect forms, and stores the C
   functions to be called for record_unwind_protect.

   If func is non-zero, undoing this binding applies func to old_value;
      This implements record_unwind_protect.
   If func is zero and symbol is nil, undoing this binding evaluates
      the list of forms in old_value; this implements Lisp's unwind-protect
      form.
   Otherwise, undoing this binding stores old_value as symbol's value; this
      undoes the bindings made by a let form or function call.  */

struct specbinding
  {
    Lisp_Object symbol, old_value;
    Lisp_Object (*func) (Lisp_Object); /* for unwind-protect */
  };

#if 0 /* FSFmacs */
/* #### */
/* Everything needed to describe an active condition case.  */
struct handler
  {
    /* The handler clauses and variable from the condition-case form.  */
    Lisp_Object handler;
    Lisp_Object var;
    /* Fsignal stores here the condition-case clause that applies,
       and Fcondition_case thus knows which clause to run.  */
    Lisp_Object chosen_clause;

    /* Used to effect the longjump out to the handler.  */
    struct catchtag *tag;

    /* The next enclosing handler.  */
    struct handler *next;
  };

extern struct handler *handlerlist;

#endif

/* These are extern because GC needs to mark them */
extern struct specbinding *specpdl;
extern struct specbinding *specpdl_ptr;
extern struct catchtag *catchlist;
extern struct backtrace *backtrace_list;

#endif /* _XEMACS_BACKTRACE_H_ */
