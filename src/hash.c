/* Hash tables.
   Copyright (C) 1992, 1993, 1994 Free Software Foundation, Inc.

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

#ifdef emacs
#include <config.h>
#include "lisp.h"

#define NULL_ENTRY (LISP_TO_VOID (Qnil))

#else /* !emacs */

#define NULL_ENTRY ((void *) 1)

#endif /* !emacs */

#include "hash.h"
#include "elhash.h"

static CONST unsigned int
primes []={
  13,
  29, 37, 47, 59, 71, 89, 107, 131, 163, 197, 239, 293, 353, 431, 521, 631,
  761, 919, 1103, 1327, 1597, 1931, 2333, 2801, 3371, 4049, 4861, 5839, 7013,
  8419, 10103, 12143, 14591, 17519, 21023, 25229, 30293, 36353, 43627, 52361,
  62851, 75431, 90523, 108631, 130363, 156437, 187751, 225307, 270371, 324449,
  389357, 467237, 560689, 672827, 807403, 968897, 1162687, 1395263, 1674319,
  2009191, 2411033, 2893249
};

/* strings code */

/* from base/generic-hash.cc, and hence from Dragon book, p436 */
unsigned long
string_hash (CONST void *xv)
{
  unsigned int h = 0;
  unsigned CONST char *x = (unsigned CONST char *) xv;

  if (!x) return 0;

  while (*x != 0)
    {
      unsigned int g;
      h = (h << 4) + *x++;
      if ((g = h & 0xf0000000) != 0)
	h = (h ^ (g >> 24)) ^ g;
    }

  return h;
}

unsigned long
memory_hash (CONST void *xv, size_t size)
{
  unsigned int h = 0;
  unsigned CONST char *x = (unsigned CONST char *) xv;

  if (!x) return 0;

  while (size > 0)
    {
      unsigned int g;
      h = (h << 4) + *x++;
      if ((g = h & 0xf0000000) != 0)
	h = (h ^ (g >> 24)) ^ g;
      size--;
    }

  return h;
}

static int
string_eq (CONST void *st1, CONST void *st2)
{
  if (!st1)
    return st2 ? 0 : 1;
  else if (!st2)
    return 0;
  else
    return !strcmp ( (CONST char *) st1, (CONST char *) st2);
}


/* ### Ever heard of binary search? */
static unsigned int
prime_size (unsigned int size)
{
  int i;
  for (i = 0; i < countof (primes); i++)
    if (size <= primes [i])
      return primes [i];
  return primes [countof (primes) - 1];
}

static void rehash (hentry *harray, c_hashtable ht, unsigned int size);

#define KEYS_DIFFER_P(old, new, testfun) \
  ((testfun)?(((old) == (new))?0:(!(testfun ((old), new)))):((old) != (new)))

CONST void *
gethash (CONST void *key, c_hashtable hash, CONST void **ret_value)
{
  hentry *harray = hash->harray;
  int (*test_function) (CONST void *, CONST void *) = hash->test_function;
  unsigned int hsize = hash->size;
  unsigned int hcode_initial =
    (hash->hash_function)?(hash->hash_function(key)):((unsigned long) key);
  unsigned int hcode = hcode_initial % hsize;
  hentry *e = &harray [hcode];
  CONST void *e_key = e->key;

  if (!key)
    {
      *ret_value = hash->zero_entry;
      return (void *) hash->zero_set;
    }

  if ((e_key)?
      (KEYS_DIFFER_P (e_key, key, test_function)):
      (e->contents == NULL_ENTRY))
    {
      unsigned int h2 = hsize - 2;
      unsigned int incr = 1 + (hcode_initial % h2);
      do
        {
          hcode = hcode + incr;
          if (hcode >= hsize) hcode = hcode - hsize;
          e = &harray [hcode];
          e_key = e->key;
        }
      while ((e_key)?
             (KEYS_DIFFER_P (e_key, key, test_function)):
             (e->contents == NULL_ENTRY));
    }

  *ret_value = e->contents;
  return e->key;
}

void
clrhash (c_hashtable hash)
{
  memset (hash->harray, 0, sizeof (hentry) * hash->size);
  hash->zero_entry = 0;
  hash->zero_set = 0;
  hash->fullness = 0;
}

void
free_hashtable (c_hashtable hash)
{
#ifdef emacs
  if (!NILP (hash->elisp_table))
    return;
#endif
  xfree (hash->harray);
  xfree (hash);
}

c_hashtable
make_hashtable (unsigned int hsize)
{
  c_hashtable res = xnew_and_zero (struct _C_hashtable);
  res->size = prime_size ((13 * hsize) / 10);
  res->harray = xnew_array (hentry, res->size);
#ifdef emacs
  res->elisp_table = Qnil;
#endif
  clrhash (res);
  return res;
}

c_hashtable
make_general_hashtable (unsigned int hsize,
			unsigned long (*hash_function) (CONST void *),
			int (*test_function) (CONST void *, CONST void *))
{
  c_hashtable res = xnew_and_zero (struct _C_hashtable);
  res->size = prime_size ((13 * hsize) / 10);
  res->harray = xnew_array (hentry, res->size);
  res->hash_function = hash_function;
  res->test_function = test_function;
#ifdef emacs
  res->elisp_table = Qnil;
#endif
  clrhash (res);
  return res;
}

c_hashtable
make_strings_hashtable (unsigned int hsize)
{
  return make_general_hashtable (hsize, string_hash, string_eq);
}

#ifdef emacs
unsigned int
compute_harray_size (unsigned int hsize)
{
  return prime_size ((13 * hsize) / 10);
}
#endif

void
copy_hash (c_hashtable dest, c_hashtable src)
{
#ifdef emacs
  /* if these are not the same, then we are losing here */
  if ((NILP (dest->elisp_table)) != (NILP (src->elisp_table)))
    {
      error ("Incompatible hashtable types to copy_hash.");
      return;
    }
#endif

  if (dest->size != src->size)
    {
#ifdef emacs
      if (!NILP (dest->elisp_table))
        elisp_hvector_free (dest->harray, dest->elisp_table);
      else
#endif
        xfree (dest->harray);

      dest->size = src->size;
#ifdef emacs
      if (!NILP (dest->elisp_table))
        dest->harray = (hentry *)
	  elisp_hvector_malloc (sizeof (hentry) * dest->size,
				dest->elisp_table);
      else
#endif
        dest->harray = xnew_array (hentry, dest->size);
    }
  dest->fullness = src->fullness;
  dest->zero_entry = src->zero_entry;
  dest->zero_set = src->zero_set;
  dest->hash_function = src->hash_function;
  dest->test_function = src->test_function;
  memcpy (dest->harray, src->harray, sizeof (hentry) * dest->size);
}

static void
grow_hashtable (c_hashtable hash, unsigned int new_size)
{
  unsigned int old_hsize = hash->size;
  hentry *old_harray = hash->harray;
  unsigned int new_hsize = prime_size (new_size);
  hentry *new_harray;

#ifdef emacs
  /* We test for Qzero to facilitate free-hook.c.  That module creates
     a hashtable very very early, at which point Qnil has not yet
     been set and is thus all zeroes.  Qzero is "automatically"
     initialized at startup because its correct value is also all
     zeroes. */
  if (!EQ (hash->elisp_table, Qnull_pointer) &&
      !NILP (hash->elisp_table) &&
      !ZEROP (hash->elisp_table))
    new_harray = (hentry *) elisp_hvector_malloc (sizeof (hentry) * new_hsize,
						  hash->elisp_table);
  else
#endif
    new_harray = (hentry *) xmalloc (sizeof (hentry) * new_hsize);

  hash->size = new_hsize;
  hash->harray = new_harray;

  /* do the rehash on the "grown" table */
  {
    long old_zero_set = hash->zero_set;
    void *old_zero_entry = hash->zero_entry;
    clrhash (hash);
    hash->zero_set = old_zero_set;
    hash->zero_entry = old_zero_entry;
    rehash (old_harray, hash, old_hsize);
  }

#ifdef emacs
  if (!EQ (hash->elisp_table, Qnull_pointer) &&
      !NILP (hash->elisp_table) &&
      !ZEROP (hash->elisp_table))
    elisp_hvector_free (old_harray, hash->elisp_table);
  else
#endif
    xfree (old_harray);
}

void
expand_hashtable (c_hashtable hash, unsigned int needed_size)
{
  size_t hsize = hash->size;
  size_t comfortable_size = (13 * needed_size) / 10;
  if (hsize < comfortable_size)
    grow_hashtable (hash, comfortable_size + 1);
}

void
puthash (CONST void *key, void *cont, c_hashtable hash)
{
  unsigned int hsize = hash->size;
  int (*test_function) (CONST void *, CONST void *) = hash->test_function;
  unsigned int fullness = hash->fullness;
  hentry *harray;
  CONST void *e_key;
  hentry *e;
  unsigned int hcode_initial =
    (hash->hash_function)?(hash->hash_function(key)):((unsigned long) key);
  unsigned int hcode;
  unsigned int incr = 0;
  unsigned int h2;
  CONST void *oldcontents;

  if (!key)
    {
      hash->zero_entry = cont;
      hash->zero_set = 1;
      return;
    }

  if (hsize < (1 + ((13 * fullness) / 10)))
    {
      grow_hashtable (hash, hsize + 1);
      hsize = hash->size;
      fullness = hash->fullness;
    }

  harray= hash->harray;
  h2 = hsize - 2;

  hcode = hcode_initial % hsize;

  e_key = harray [hcode].key;
  if (e_key && (KEYS_DIFFER_P (e_key, key, test_function)))
    {
      h2 = hsize - 2;
      incr = 1 + (hcode_initial % h2);
      do
        {
          hcode = hcode + incr;
          if (hcode >= hsize) hcode = hcode - hsize;
          e_key = harray [hcode].key;
        }
      while (e_key && (KEYS_DIFFER_P (e_key, key, test_function)));
    }
  oldcontents = harray [hcode].contents;
  harray [hcode].key = key;
  harray [hcode].contents = cont;
  /* if the entry that we used was a deleted entry,
     check for a non deleted entry of the same key,
     then delete it */
  if (!e_key && (oldcontents == NULL_ENTRY))
    {
      if (!incr) incr = 1 + ((unsigned long) key % h2);

      do
        {
          hcode = hcode + incr;
          if (hcode >= hsize) hcode = hcode - hsize;
          e = &harray [hcode];
          e_key = e->key;
        }
      while ((e_key)?
             (KEYS_DIFFER_P (e_key, key, test_function)):
             (e->contents == NULL_ENTRY));

      if (e_key)
        {
          e->key = 0;
          e->contents = NULL_ENTRY;
        }
    }

  /* only increment the fullness when we used up a new hentry */
  if (!e_key || (KEYS_DIFFER_P (e_key, key, test_function)))
    hash->fullness++;
}

static void
rehash (hentry *harray, c_hashtable hash, unsigned int size)
{
  hentry *limit = harray + size;
  hentry *e;
  for (e = harray; e < limit; e++)
    {
      if (e->key)
	puthash (e->key, e->contents, hash);
    }
}

void
remhash (CONST void *key, c_hashtable hash)
{
  hentry *harray = hash->harray;
  int (*test_function) (CONST void*, CONST void*) = hash->test_function;
  unsigned int hsize = hash->size;
  unsigned int hcode_initial =
    (hash->hash_function)?(hash->hash_function(key)):((unsigned long) key);
  unsigned int hcode = hcode_initial % hsize;
  hentry *e = &harray [hcode];
  CONST void *e_key = e->key;

  if (!key)
    {
      hash->zero_entry = 0;
      hash->zero_set = 0;
      return;
    }

  if ((e_key)?
      (KEYS_DIFFER_P (e_key, key, test_function)):
      (e->contents == NULL_ENTRY))
    {
      unsigned int h2 = hsize - 2;
      unsigned int incr = 1 + (hcode_initial % h2);
      do
        {
          hcode = hcode + incr;
          if (hcode >= hsize) hcode = hcode - hsize;
          e = &harray [hcode];
          e_key = e->key;
        }
      while ((e_key)?
             (KEYS_DIFFER_P (e_key, key, test_function)):
             (e->contents == NULL_ENTRY));
    }
  if (e_key)
    {
      e->key = 0;
      e->contents = NULL_ENTRY;
      /* Note: you can't do fullness-- here, it breaks the world. */
    }
}

void
maphash (maphash_function mf, c_hashtable hash, void *arg)
{
  hentry *e;
  hentry *limit;

  if (hash->zero_set)
    {
      if (((*mf) (0, hash->zero_entry, arg)))
	return;
    }

  for (e = hash->harray, limit = e + hash->size; e < limit; e++)
    {
      if (e->key)
	{
	  if (((*mf) (e->key, e->contents, arg)))
	    return;
	}
    }
}

void
map_remhash (remhash_predicate predicate, c_hashtable hash, void *arg)
{
  hentry *e;
  hentry *limit;

  if (hash->zero_set && ((*predicate) (0, hash->zero_entry, arg)))
    {
      hash->zero_set = 0;
      hash->zero_entry = 0;
    }

  for (e = hash->harray, limit = e + hash->size; e < limit; e++)
    if ((*predicate) (e->key, e->contents, arg))
      {
        e->key = 0;
        e->contents = NULL_ENTRY;
      }
}
