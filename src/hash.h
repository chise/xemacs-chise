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

#ifndef _HASH_H_
#define _HASH_H_

typedef struct
{
  CONST void *key;
  void	     *contents;
} hentry;

struct _C_hashtable
{
  hentry	*harray;
  long		zero_set;
  void		*zero_entry;
  size_t	size;		/* size of the hasharray */
  unsigned int	fullness;	/* number of entries in the hashtable */
  unsigned long (*hash_function) (CONST void *);
  int		(*test_function) (CONST void *, CONST void *);
#ifdef emacs
  Lisp_Object elisp_table;
#endif
};

typedef struct _C_hashtable *c_hashtable;

/* size is the number of initial entries. The hashtable will be grown
   automatically if the number of entries approaches the size */
c_hashtable make_hashtable (unsigned int size);

c_hashtable make_general_hashtable (unsigned int hsize,
				    unsigned long (*hash_function)
				    (CONST void *),
				    int (*test_function) (CONST void *,
							  CONST void *));

c_hashtable make_strings_hashtable (unsigned int hsize);

/* clears the hash table. A freshly created hashtable is already cleared up */
void clrhash (c_hashtable hash);

/* frees the table and substructures */
void free_hashtable (c_hashtable hash);

/* returns a hentry whose key is 0 if the entry does not exist in hashtable */
CONST void *gethash (CONST void *key, c_hashtable hash,
		     CONST void **ret_value);

/* key should be different from 0 */
void puthash (CONST void *key, void *contents, c_hashtable hash);

/* delete the entry which key is key */
void remhash (CONST void *key, c_hashtable hash);

typedef int (*maphash_function) (CONST void* key, void* contents, void* arg);

typedef int (*remhash_predicate) (CONST void* key, CONST void* contents,
                                  void* arg);

typedef void (*generic_hashtable_op) (c_hashtable table,
                                      void *arg1, void *arg2, void *arg3);

/* calls mf with the following arguments:  key, contents, arg; for every
   entry in the hashtable */
void maphash (maphash_function fn, c_hashtable hash, void* arg);

/* delete objects from the table which satisfy the predicate */
void map_remhash (remhash_predicate predicate, c_hashtable hash, void *arg);

/* copies all the entries of src into dest -- dest is modified as needed
   so it is as big as src. */
void copy_hash (c_hashtable dest, c_hashtable src);

/* makes sure that hashtable can hold at least needed_size entries */
void expand_hashtable (c_hashtable hash, unsigned int needed_size);

#ifdef emacs	/* for elhash.c */
unsigned int compute_harray_size (unsigned int);
#endif

#endif /* _HASH_H_ */
