/* Lisp interface to hash tables -- include file.
   Copyright (C) 1995, 1996 Ben Wing.

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

/* Synched up with: Not in FSF. */

#ifndef _XEMACS_ELHASH_H_
#define _XEMACS_ELHASH_H_

DECLARE_LRECORD (hashtable, struct hashtable);

#define XHASHTABLE(x) XRECORD (x, hashtable, struct hashtable)
#define XSETHASHTABLE(x, p) XSETRECORD (x, p, hashtable)
#define HASHTABLEP(x) RECORDP (x, hashtable)
#define GC_HASHTABLEP(x) GC_RECORDP (x, hashtable)
#define CHECK_HASHTABLE(x) CHECK_RECORD (x, hashtable)
#define CONCHECK_HASHTABLE(x) CONCHECK_RECORD (x, hashtable)

enum hashtable_type
{
  HASHTABLE_NONWEAK,
  HASHTABLE_KEY_WEAK,
  HASHTABLE_VALUE_WEAK,
  HASHTABLE_KEY_CAR_WEAK,
  HASHTABLE_VALUE_CAR_WEAK,
  HASHTABLE_WEAK
};

enum hashtable_test_fun
{
  HASHTABLE_EQ,
  HASHTABLE_EQL,
  HASHTABLE_EQUAL
};

EXFUN (Fcopy_hashtable, 1);
EXFUN (Fhashtable_fullness, 1);
EXFUN (Fremhash, 2);

Lisp_Object make_lisp_hashtable (int size,
				 enum hashtable_type type,
				 enum hashtable_test_fun test_fun);

void elisp_maphash (int (*fn) (CONST void *key, void *contents,
				void *extra_arg),
		    Lisp_Object table,
		    void *extra_arg);

void elisp_map_remhash (int (*fn) (CONST void *key,
				   CONST void *contents,
				   void *extra_arg),
			Lisp_Object table,
			void *extra_arg);

int finish_marking_weak_hashtables (int (*obj_marked_p) (Lisp_Object),
					   void (*markobj) (Lisp_Object));
void prune_weak_hashtables (int (*obj_marked_p) (Lisp_Object));

void *elisp_hvector_malloc (unsigned int, Lisp_Object);
void elisp_hvector_free (void *ptr, Lisp_Object table);

#endif /* _XEMACS_ELHASH_H_ */
