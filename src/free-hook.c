/* This file is part of XEmacs.

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

/* Synched up with: Not in FSF. */

/* Debugging hooks for malloc. */

/* These hooks work with gmalloc to catch allocation errors.
   In particular, the following is trapped:

   * Freeing the same pointer twice.
   * Trying to free a pointer not returned by malloc.
   * Trying to realloc a pointer not returned by malloc.

   In addition, every word of every block freed is set to
   0xdeadbeef.  This causes many uses of freed storage to be
   trapped or recognized.

   When you use this, the storage used by the last FREE_QUEUE_LIMIT
   calls to free() is not recycled.  When you call free for the Nth
   time, the (N - FREE_QUEUE_LIMIT)'th block is actually recycled.

   For these last FREE_QUEUE_LIMIT calls to free() a backtrace is
   saved showing where it was called from.  The function
   find_backtrace() is provided here to be called from GDB with a
   pointer (such as would be passed to free()) as argument, e.g.
   (gdb) p/a *find_backtrace (0x234000).  If SAVE_ARGS is defined,
   the first three arguments to each function are saved as well as the
   return addresses.

   If UNMAPPED_FREE is defined, instead of setting every word of freed
   storage to 0xdeadbeef, every call to malloc goes on its own page(s).
   When free() is called, the block is read and write protected.  This
   is very useful when debugging, since it usually generates a bus error
   when the deadbeef hack might only cause some garbage to be printed.
   However, this is too slow for everyday use, since it takes an enormous
   number of pages.


   Some other features that would be useful are:

   * Checking for storage leaks.
     This could be done by a GC-like facility that would scan the data
     segment looking for pointers to allocated storage and tell you
     about those that are no longer referenced.  This could be invoked
     at any time.  Another possibility is to report on what allocated
     storage is still in use when the process is exited.  Typically
     there will be a large amount, so this might not be very useful.
*/

#if defined (EMACS_BTL) && defined (sun4) && !defined (__lucid)
/* currently only works in this configuration */
# define SAVE_STACK
#endif

#ifdef emacs
#ifdef SAVE_STACK
#include "cadillac-btl.h"
#endif
#include <config.h>
#include "lisp.h"
#else
void *malloc (unsigned long);
#endif

#if !defined(HAVE_LIBMCHECK)
#include <stdio.h>

#include "hash.h"

#ifdef UNMAPPED_FREE
#include <sys/mman.h>
#include <sys/param.h>
#define ROUND_UP_TO_PAGE(i) (((i) + PAGEOFFSET) & PAGEMASK)
#endif

#include <sys/types.h>

/* System function prototypes don't belong in C source files */
/* extern void free (void *); */

c_hashtable pointer_table;

extern void (*__free_hook) (void *);
extern void *(*__malloc_hook) (unsigned long);

static void *check_malloc (unsigned long);

typedef void (*fun_ptr) ();

#ifdef SAVE_STACK
#define FREE_QUEUE_LIMIT 1000
#else
/* free_queue is not too useful without backtrace logging */
#define FREE_QUEUE_LIMIT 1
#endif
#define TRACE_LIMIT 20

typedef struct {
  fun_ptr return_pc;
#ifdef SAVE_ARGS
  void *arg[3];
#endif
} fun_entry;

typedef struct {
  void *address;
  unsigned long length;
#ifdef SAVE_STACK
  fun_entry backtrace[TRACE_LIMIT];
#endif
} free_queue_entry;

free_queue_entry free_queue[FREE_QUEUE_LIMIT];

int current_free;

#ifdef SAVE_STACK
static void
init_frame (FRAME *fptr)
{
  FRAME tmp_frame;

#ifdef sparc
  /* Do the system trap ST_FLUSH_WINDOWS */
  asm ("ta 3");
  asm ("st %sp, [%i0+0]");
  asm ("st %fp, [%i0+4]");
#endif

  fptr->pc = (char *) init_frame;
  tmp_frame = *fptr;

  PREVIOUS_FRAME (tmp_frame);

  *fptr = tmp_frame;
  return;
}

#ifdef SAVE_ARGS
static void *
frame_arg (FRAME *fptr, int index)
{
  return ((void *) FRAME_ARG(*fptr, index));
}
#endif

static void
save_backtrace (FRAME *current_frame_ptr, fun_entry *table)
{
  int i = 0;
#ifdef SAVE_ARGS
  int j;
#endif
  FRAME current_frame = *current_frame_ptr;

  /* Get up and out of free() */
  PREVIOUS_FRAME (current_frame);

  /* now do the basic loop adding data until there is no more */
  while (PREVIOUS_FRAME (current_frame) && i < TRACE_LIMIT)
    {
      table[i].return_pc = (void (*)())FRAME_PC (current_frame);
#ifdef SAVE_ARGS
      for (j = 0; j < 3; j++)
	table[i].arg[j] = frame_arg (&current_frame, j);
#endif
      i++;
    }
  memset (&table[i], 0, sizeof (fun_entry) * (TRACE_LIMIT - i));
}

free_queue_entry *
find_backtrace (void *ptr)
{
  int i;

  for (i = 0; i < FREE_QUEUE_LIMIT; i++)
    if (free_queue[i].address == ptr)
      return &free_queue[i];

  return 0;
}
#endif /* SAVE_STACK */

int strict_free_check;

static void
check_free (void *ptr)
{
#ifdef SAVE_STACK
  FRAME start_frame;

  init_frame (&start_frame);
#endif

  __free_hook = 0;
  __malloc_hook = 0;
  if (!pointer_table)
    pointer_table = make_hashtable (max (100, FREE_QUEUE_LIMIT * 2));
  if (ptr != 0)
    {
      long size;
#ifdef UNMAPPED_FREE
      unsigned long rounded_up_size;
#endif

      EMACS_INT present = (EMACS_INT) gethash (ptr, pointer_table,
					       (CONST void **) &size);

      if (!present)
	{
	/* This can only happen if you try to free something that didn't
	   come from malloc */
#if !defined(__linux__)
	  /* I originally wrote:  "There's really no need to drop core."
	     I have seen the error of my ways. -slb */
	  if (strict_free_check)
	    abort ();
#endif
	  printf("Freeing unmalloc'ed memory at %p\n", ptr);
	  __free_hook = check_free;
	  __malloc_hook = check_malloc;
	  goto end;
	}

      if (size < 0)
	{
	  /* This happens when you free twice */
#if !defined(__linux__)
	  /* See above comment. */
	  if (strict_free_check)
	    abort ();
#endif
	  printf("Freeing %p twice\n", ptr);
	  __free_hook = check_free;
	  __malloc_hook = check_malloc;
	  goto end;
	}

      puthash (ptr, (void *)-size, pointer_table);
#ifdef UNMAPPED_FREE
      /* Round up size to an even number of pages. */
      rounded_up_size = ROUND_UP_TO_PAGE (size);
      /* Protect the pages freed from all access */
      if (strict_free_check)
	mprotect (ptr, rounded_up_size, PROT_NONE);
#else
      /* Set every word in the block to 0xdeadbeef */
      if (strict_free_check)
	{
	  unsigned long long_length = (size + (sizeof (long) - 1))
	    / sizeof (long);
	  unsigned long i;

	  for (i = 0; i < long_length; i++)
	    ((unsigned long *) ptr)[i] = 0xdeadbeef;
	}
#endif
      free_queue[current_free].address = ptr;
      free_queue[current_free].length = size;
#ifdef SAVE_STACK
      save_backtrace (&start_frame,
		      free_queue[current_free].backtrace);
#endif
      current_free++;
      if (current_free >= FREE_QUEUE_LIMIT)
	current_free = 0;
      /* Really free this if there's something there */
      {
	void *old = free_queue[current_free].address;

	if (old)
	  {
#ifdef UNMAPPED_FREE
	    unsigned long old_len = free_queue[current_free].length;

	    mprotect (old, old_len,  PROT_READ | PROT_WRITE | PROT_EXEC);
#endif
	    free (old);
	    remhash (old, pointer_table);
	  }
      }
    }
  __free_hook = check_free;
  __malloc_hook = check_malloc;

 end:
  return;
}

static void *
check_malloc (unsigned long size)
{
  unsigned long rounded_up_size;
  void *result;

  __free_hook = 0;
  __malloc_hook = 0;
  if (size == 0)
    {
      result = 0;
      goto end;
    }
#ifdef UNMAPPED_FREE
  /* Round up to an even number of pages. */
  rounded_up_size = ROUND_UP_TO_PAGE (size);
#else
  rounded_up_size = size;
#endif
  result = malloc (rounded_up_size);
  if (!pointer_table)
    pointer_table = make_hashtable (FREE_QUEUE_LIMIT * 2);
  puthash (result, (void *)size, pointer_table);
  __free_hook = check_free;
  __malloc_hook = check_malloc;
 end:
  return result;
}

extern void *(*__realloc_hook) (void *, unsigned long);

#ifdef MIN
#undef MIN
#endif
#define MIN(A, B) ((A) < (B) ? (A) : (B))

/* Don't optimize realloc */

static void *
check_realloc (void * ptr, unsigned long size)
{
  EMACS_INT present;
  unsigned long old_size;
  void *result = malloc (size);

  if (!ptr) return result;
  present = (EMACS_INT) gethash (ptr, pointer_table, (CONST void **) &old_size);
  if (!present)
    {
    /* This can only happen by reallocing a pointer that didn't
       come from malloc. */
#if !defined(__linux__)
      /* see comment in check_free(). */
      abort ();
#endif
      printf("Realloc'ing unmalloc'ed pointer at %p\n", ptr);
    }

  if (result == 0)
    goto end;
  memcpy (result, ptr, MIN (size, old_size));
  free (ptr);
 end:
  return result;
}

void enable_strict_free_check (void);
void
enable_strict_free_check (void)
{
  strict_free_check = 1;
}

void disable_strict_free_check (void);
void
disable_strict_free_check (void)
{
  strict_free_check = 0;
}

/* Note: All BLOCK_INPUT stuff removed from this file because it's
   completely gone in XEmacs */

static void *
block_input_malloc (unsigned long size);

static void
block_input_free (void* ptr)
{
  __free_hook = 0;
  __malloc_hook = 0;
  free (ptr);
  __free_hook = block_input_free;
  __malloc_hook = block_input_malloc;
}

static void *
block_input_malloc (unsigned long size)
{
  void* result;
  __free_hook = 0;
  __malloc_hook = 0;
  result = malloc (size);
  __free_hook = block_input_free;
  __malloc_hook = block_input_malloc;
  return result;
}


static void *
block_input_realloc (void* ptr, unsigned long size)
{
  void* result;
  __free_hook = 0;
  __malloc_hook = 0;
  __realloc_hook = 0;
  result = realloc (ptr, size);
  __free_hook = block_input_free;
  __malloc_hook = block_input_malloc;
  __realloc_hook = block_input_realloc;
  return result;
}

#ifdef emacs

void disable_free_hook (void);
void
disable_free_hook (void)
{
  __free_hook = block_input_free;
  __malloc_hook = block_input_malloc;
  __realloc_hook = block_input_realloc;
}

void
init_free_hook (void)
{
  __free_hook = check_free;
  __malloc_hook = check_malloc;
  __realloc_hook = check_realloc;
  current_free = 0;
  strict_free_check = 1;
}

void really_free_one_entry (void *, int, int *);

DEFUN ("really-free", Freally_free, 0, 1, "P", /*
Actually free the storage held by the free() debug hook.
A no-op if the free hook is disabled.
*/
       (arg))
{
  int count[2];
  Lisp_Object lisp_count[2];

  if ((__free_hook != 0) && pointer_table)
    {
      count[0] = 0;
      count[1] = 0;
      __free_hook = 0;
      maphash ((maphash_function)really_free_one_entry,
               pointer_table, (void *)&count);
      memset (free_queue, 0, sizeof (free_queue_entry) * FREE_QUEUE_LIMIT);
      current_free = 0;
      __free_hook = check_free;
      XSETINT (lisp_count[0], count[0]);
      XSETINT (lisp_count[1], count[1]);
      return Fcons (lisp_count[0], lisp_count[1]);
    }
  else
    return Fcons (make_int (0), make_int (0));
}

void
really_free_one_entry (void *key, int contents, int *countp)
{
  if (contents < 0)
    {
      free (key);
#ifdef UNMAPPED_FREE
      mprotect (key, -contents, PROT_READ | PROT_WRITE | PROT_EXEC);
#endif
      remhash (key, pointer_table);
      countp[0]++;
      countp[1] += -contents;
    }
}

void
syms_of_free_hook (void)
{
  DEFSUBR (Freally_free);
}

#else
void (*__free_hook)() = check_free;
void *(*__malloc_hook)() = check_malloc;
void *(*__realloc_hook)() = check_realloc;
#endif

#endif /* !defined(HAVE_LIBMCHECK) */

#if defined(DEBUG_INPUT_BLOCKING) || defined (DEBUG_GCPRO)

/* Note: There is no more input blocking in XEmacs */
typedef enum {
  block_type, unblock_type, totally_type,
  gcpro1_type, gcpro2_type, gcpro3_type, gcpro4_type, ungcpro_type
} blocktype;

struct block_input_history_struct
{
  char *file;
  int line;
  blocktype type;
  int value;
#ifdef SAVE_STACK
  fun_entry backtrace[TRACE_LIMIT];
#endif
};

typedef struct block_input_history_struct block_input_history;

#endif

#ifdef DEBUG_INPUT_BLOCKING

int blhistptr;

#define BLHISTLIMIT 1000

block_input_history blhist[BLHISTLIMIT];

note_block_input (char *file, int line)
{
  note_block (file, line, block_type);
  if (interrupt_input_blocked > 2) abort();
}

note_unblock_input (char* file, int line)
{
  note_block (file, line, unblock_type);
}

note_totally_unblocked (char* file, int line)
{
  note_block (file, line, totally_type);
}

note_block (char *file, int line, blocktype type)
{
#ifdef SAVE_STACK
  FRAME start_frame;

  init_frame (&start_frame);
#endif

  blhist[blhistptr].file = file;
  blhist[blhistptr].line = line;
  blhist[blhistptr].type = type;
  blhist[blhistptr].value = interrupt_input_blocked;

#ifdef SAVE_STACK
  save_backtrace (&start_frame,
		  blhist[blhistptr].backtrace);
#endif

  blhistptr++;
  if (blhistptr >= BLHISTLIMIT)
    blhistptr = 0;
}

#endif


#ifdef DEBUG_GCPRO

int gcprohistptr;
#define GCPROHISTLIMIT 1000
block_input_history gcprohist[GCPROHISTLIMIT];

static void
log_gcpro (char *file, int line, struct gcpro *value, blocktype type)
{
  FRAME start_frame;

  if (type == ungcpro_type)
    {
      if (value == gcprolist) goto OK;
      if (! gcprolist) abort ();
      if (value == gcprolist->next) goto OK;
      if (! gcprolist->next) abort ();
      if (value == gcprolist->next->next) goto OK;
      if (! gcprolist->next->next) abort ();
      if (value == gcprolist->next->next->next) goto OK;
      abort ();
    OK:;
    }
#ifdef SAVE_STACK
  init_frame (&start_frame);
#endif
  gcprohist[gcprohistptr].file = file;
  gcprohist[gcprohistptr].line = line;
  gcprohist[gcprohistptr].type = type;
  gcprohist[gcprohistptr].value = (int) value;
#ifdef SAVE_STACK
  save_backtrace (&start_frame, gcprohist[gcprohistptr].backtrace);
#endif
  gcprohistptr++;
  if (gcprohistptr >= GCPROHISTLIMIT)
    gcprohistptr = 0;
}

void
debug_gcpro1 (char *file, int line, struct gcpro *gcpro1, Lisp_Object *var)
{
  gcpro1->next = gcprolist; gcpro1->var = var; gcpro1->nvars = 1;
  gcprolist = gcpro1;
  log_gcpro (file, line, gcpro1, gcpro1_type);
}

void
debug_gcpro2 (char *file, int line, struct gcpro *gcpro1, struct gcpro *gcpro2,
	      Lisp_Object *var1, Lisp_Object *var2)
{
  gcpro1->next = gcprolist; gcpro1->var = var1; gcpro1->nvars = 1;
  gcpro2->next = gcpro1; gcpro2->var = var2; gcpro2->nvars = 1;
  gcprolist = gcpro2;
  log_gcpro (file, line, gcpro2, gcpro2_type);
}

void
debug_gcpro3 (char *file, int line, struct gcpro *gcpro1, struct gcpro *gcpro2,
	      struct gcpro *gcpro3, Lisp_Object *var1, Lisp_Object *var2,
	      Lisp_Object *var3)
{
  gcpro1->next = gcprolist; gcpro1->var = var1; gcpro1->nvars = 1;
  gcpro2->next = gcpro1; gcpro2->var = var2; gcpro2->nvars = 1;
  gcpro3->next = gcpro2; gcpro3->var = var3; gcpro3->nvars = 1;
  gcprolist = gcpro3;
  log_gcpro (file, line, gcpro3, gcpro3_type);
}

void
debug_gcpro4 (char *file, int line, struct gcpro *gcpro1, struct gcpro *gcpro2,
	      struct gcpro *gcpro3, struct gcpro *gcpro4, Lisp_Object *var1,
	      Lisp_Object *var2, Lisp_Object *var3, Lisp_Object *var4)
{
  log_gcpro (file, line, gcpro4, gcpro4_type);
  gcpro1->next = gcprolist; gcpro1->var = var1; gcpro1->nvars = 1;
  gcpro2->next = gcpro1; gcpro2->var = var2; gcpro2->nvars = 1;
  gcpro3->next = gcpro2; gcpro3->var = var3; gcpro3->nvars = 1;
  gcpro4->next = gcpro3; gcpro4->var = var4; gcpro4->nvars = 1;
  gcprolist = gcpro4;
}

void
debug_gcpro5 (char *file, int line, struct gcpro *gcpro1, struct gcpro *gcpro2,
	      struct gcpro *gcpro3, struct gcpro *gcpro4, struct gcpro *gcpro5,
	      Lisp_Object *var1, Lisp_Object *var2, Lisp_Object *var3,
	      Lisp_Object *var4, Lisp_Object *var5)
{
  log_gcpro (file, line, gcpro5, gcpro5_type);
  gcpro1->next = gcprolist; gcpro1->var = var1; gcpro1->nvars = 1;
  gcpro2->next = gcpro1; gcpro2->var = var2; gcpro2->nvars = 1;
  gcpro3->next = gcpro2; gcpro3->var = var3; gcpro3->nvars = 1;
  gcpro4->next = gcpro3; gcpro4->var = var4; gcpro4->nvars = 1;
  gcpro5->next = gcpro4; gcpro5->var = var5; gcpro5->nvars = 1;
  gcprolist = gcpro5;
}

void
debug_ungcpro (char *file, int line, struct gcpro *gcpro1)
{
  log_gcpro (file, line, gcpro1, ungcpro_type);
  gcprolist = gcpro1->next;
}

void
show_gcprohist (void)
{
  int i, j;
  for (i = 0, j = gcprohistptr;
       i < GCPROHISTLIMIT;
       i++, j++)
    {
      if (j >= GCPROHISTLIMIT)
	j = 0;
      printf ("%3d  %s		%d	%s	0x%x\n",
	      j, gcprohist[j].file, gcprohist[j].line,
	      (gcprohist[j].type == gcpro1_type ? "GCPRO1" :
	       gcprohist[j].type == gcpro2_type ? "GCPRO2" :
	       gcprohist[j].type == gcpro3_type ? "GCPRO3" :
	       gcprohist[j].type == gcpro4_type ? "GCPRO4" :
	       gcprohist[j].type == ungcpro_type ? "UNGCPRO" : "???"),
	      gcprohist[j].value);
    }
  fflush (stdout);
}

#endif
