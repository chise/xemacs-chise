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

#define COMFORTABLE_SIZE(size) (21 * (size) / 16)

/* Knuth volume 3, hash functions */
#define WORD_HASH_4(word) (0x9c406b55 * (word))
#define WORD_HASH_8(word) (0x9c406b549c406b55 * (word))

static CONST hash_size_t
primes [] =
{
  13,
  29, 37, 47, 59, 71, 89, 107, 131, 163, 197, 239, 293, 353, 431, 521, 631,
  761, 919, 1103, 1327, 1597, 1931, 2333, 2801, 3371, 4049, 4861, 5839, 7013,
  8419, 10103, 12143, 14591, 17519, 21023, 25229, 30293, 36353, 43627, 52361,
  62851, 75431, 90523, 108631, 130363, 156437, 187751, 225307, 270371, 324449,
  389357, 467237, 560689, 672827, 807403, 968897, 1162687, 1395263, 1674319,
  2009191, 2411033, 2893249
};

#if 0
static CONST hash_size_t
primes [] =
{
 29, 41, 59, 79, 107, 149, 197, 263, 347, 457, 599, 787, 1031, 1361,
 1777, 2333, 3037, 3967, 5167, 6719, 8737, 11369, 14783, 19219, 24989,
 32491, 42257, 54941, 71429, 92861, 120721, 156941, 204047, 265271,
 344857, 448321, 582821, 757693, 985003, 1280519, 1664681, 2164111,
 2813353, 3657361, 4754591, 6180989, 8035301, 10445899, 13579681,
 17653589, 22949669, 29834603, 38784989, 50420551, 65546729, 85210757,
 110774011, 144006217, 187208107, 243370577, 316381771, 411296309,
 534685237, 695090819, 903618083, 1174703521, 1527114613, 1985248999,
 2580823717, 3355070839, 4361592119
};
#endif

unsigned long
memory_hash (CONST void *xv, size_t size)
{
  unsigned int h = 0;
  unsigned CONST char *x = (unsigned CONST char *) xv;

  if (!x) return 0;

  while (size--)
    {
      unsigned int g;
      h = (h << 4) + *x++;
      if ((g = h & 0xf0000000) != 0)
	h = (h ^ (g >> 24)) ^ g;
    }

  return h;
}

/* We've heard of binary search. */
static hash_size_t
prime_size (hash_size_t size)
{
  int low, high;
  for (low = 0, high = countof (primes) - 1; high - low > 1;)
    {
      /* Loop Invariant: size < primes [high] */
      int mid = (low + high) / 2;
      if (primes [mid] < size)
	low = mid;
      else
	high = mid;
    }
  return primes [high];
}

static void rehash (hentry *harray, struct hash_table *ht, hash_size_t size);

#define KEYS_DIFFER_P(old, new, testfun) \
  (((old) != (new)) && (!(testfun) || !(testfun) ((old),(new))))

CONST void *
gethash (CONST void *key, struct hash_table *hash_table, CONST void **ret_value)
{
  hentry *harray = hash_table->harray;
  hash_table_test_function test_function = hash_table->test_function;
  hash_size_t size = hash_table->size;
  unsigned int hcode_initial =
    hash_table->hash_function ?
    hash_table->hash_function (key) :
    (unsigned long) key;
  unsigned int hcode = hcode_initial % size;
  hentry *e = &harray [hcode];
  CONST void *e_key = e->key;

  if (!key)
    {
      *ret_value = hash_table->zero_entry;
      return (void *) hash_table->zero_set;
    }

  if (e_key ?
      KEYS_DIFFER_P (e_key, key, test_function) :
      e->contents == NULL_ENTRY)
    {
      size_t h2 = size - 2;
      unsigned int incr = 1 + (hcode_initial % h2);
      do
        {
          hcode += incr; if (hcode >= size) hcode -= size;
          e = &harray [hcode];
          e_key = e->key;
        }
      while (e_key ?
             KEYS_DIFFER_P (e_key, key, test_function) :
             e->contents == NULL_ENTRY);
    }

  *ret_value = e->contents;
  return e->key;
}

void
clrhash (struct hash_table *hash_table)
{
  memset (hash_table->harray, 0, sizeof (hentry) * hash_table->size);
  hash_table->zero_entry = 0;
  hash_table->zero_set   = 0;
  hash_table->fullness   = 0;
}

void
free_hash_table (struct hash_table *hash_table)
{
  xfree (hash_table->harray);
  xfree (hash_table);
}

struct hash_table*
make_hash_table (hash_size_t size)
{
  struct hash_table *hash_table = xnew_and_zero (struct hash_table);
  hash_table->size = prime_size (COMFORTABLE_SIZE (size));
  hash_table->harray = xnew_array (hentry, hash_table->size);
  clrhash (hash_table);
  return hash_table;
}

struct hash_table *
make_general_hash_table (hash_size_t size,
			hash_table_hash_function hash_function,
			hash_table_test_function test_function)
{
  struct hash_table* hash_table = make_hash_table (size);
  hash_table->hash_function = hash_function;
  hash_table->test_function = test_function;
  return hash_table;
}

#if 0 /* unused strings code */
struct hash_table *
make_strings_hash_table (hash_size_t size)
{
  return make_general_hash_table (size, string_hash, string_eq);
}

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

static int
string_eq (CONST void *s1, CONST void *s2)
{
  return s1 && s2 ? !strcmp ((CONST char *) s1, (CONST char *) s2) : s1 == s2;
}
#endif /* unused strings code */

void
copy_hash (struct hash_table *dest, struct hash_table *src)
{
  if (dest->size != src->size)
    {
      xfree (dest->harray);

      dest->size = src->size;
      dest->harray = xnew_array (hentry, dest->size);
    }
  dest->fullness      = src->fullness;
  dest->zero_entry    = src->zero_entry;
  dest->zero_set      = src->zero_set;
  dest->hash_function = src->hash_function;
  dest->test_function = src->test_function;
  memcpy (dest->harray, src->harray, sizeof (hentry) * dest->size);
}

static void
grow_hash_table (struct hash_table *hash_table, hash_size_t new_size)
{
  hash_size_t old_size   = hash_table->size;
  hentry     *old_harray = hash_table->harray;
  hentry     *new_harray;

  new_size = prime_size (new_size);

  new_harray = xnew_array (hentry, new_size);

  hash_table->size   = new_size;
  hash_table->harray = new_harray;

  /* do the rehash on the "grown" table */
  {
    long old_zero_set    = hash_table->zero_set;
    void *old_zero_entry = hash_table->zero_entry;
    clrhash (hash_table);
    hash_table->zero_set   = old_zero_set;
    hash_table->zero_entry = old_zero_entry;
    rehash (old_harray, hash_table, old_size);
  }

  xfree (old_harray);
}

void
expand_hash_table (struct hash_table *hash_table, hash_size_t needed_size)
{
  hash_size_t size = hash_table->size;
  hash_size_t comfortable_size = COMFORTABLE_SIZE (needed_size);
  if (size < comfortable_size)
    grow_hash_table (hash_table, comfortable_size + 1);
}

void
puthash (CONST void *key, void *contents, struct hash_table *hash_table)
{
  hash_table_test_function test_function = hash_table->test_function;
  hash_size_t size     = hash_table->size;
  hash_size_t fullness = hash_table->fullness;
  hentry *harray;
  CONST void *e_key;
  hentry *e;
  unsigned int hcode_initial =
    hash_table->hash_function ?
    hash_table->hash_function (key) :
    (unsigned long) key;
  unsigned int hcode;
  unsigned int incr = 0;
  size_t h2;
  CONST void *oldcontents;

  if (!key)
    {
      hash_table->zero_entry = contents;
      hash_table->zero_set = 1;
      return;
    }

  if (size < (1 + COMFORTABLE_SIZE (fullness)))
    {
      grow_hash_table (hash_table, size + 1);
      size = hash_table->size;
      fullness = hash_table->fullness;
    }

  harray= hash_table->harray;
  h2 = size - 2;

  hcode = hcode_initial % size;

  e_key = harray [hcode].key;
  if (e_key && KEYS_DIFFER_P (e_key, key, test_function))
    {
      h2 = size - 2;
      incr = 1 + (hcode_initial % h2);
      do
        {
          hcode += incr;
          if (hcode >= size) hcode -= size;
          e_key = harray [hcode].key;
        }
      while (e_key && KEYS_DIFFER_P (e_key, key, test_function));
    }
  oldcontents = harray [hcode].contents;
  harray [hcode].key = key;
  harray [hcode].contents = contents;
  /* If the entry that we used was a deleted entry,
     check for a non deleted entry of the same key,
     then delete it. */
  if (!e_key && oldcontents == NULL_ENTRY)
    {
      if (!incr) incr = 1 + ((unsigned long) key % h2);

      do
        {
          hcode += incr; if (hcode >= size) hcode -= size;
          e = &harray [hcode];
          e_key = e->key;
        }
      while (e_key ?
             KEYS_DIFFER_P (e_key, key, test_function):
             e->contents == NULL_ENTRY);

      if (e_key)
        {
          e->key = 0;
          e->contents = NULL_ENTRY;
        }
    }

  /* only increment the fullness when we used up a new hentry */
  if (!e_key || KEYS_DIFFER_P (e_key, key, test_function))
    hash_table->fullness++;
}

static void
rehash (hentry *harray, struct hash_table *hash_table, hash_size_t size)
{
  hentry *limit = harray + size;
  hentry *e;
  for (e = harray; e < limit; e++)
    {
      if (e->key)
	puthash (e->key, e->contents, hash_table);
    }
}

void
remhash (CONST void *key, struct hash_table *hash_table)
{
  hentry *harray = hash_table->harray;
  hash_table_test_function test_function = hash_table->test_function;
  hash_size_t size = hash_table->size;
  unsigned int hcode_initial =
    (hash_table->hash_function) ?
    (hash_table->hash_function (key)) :
    ((unsigned long) key);
  unsigned int hcode = hcode_initial % size;
  hentry *e = &harray [hcode];
  CONST void *e_key = e->key;

  if (!key)
    {
      hash_table->zero_entry = 0;
      hash_table->zero_set = 0;
      return;
    }

  if (e_key ?
      KEYS_DIFFER_P (e_key, key, test_function) :
      e->contents == NULL_ENTRY)
    {
      size_t h2 = size - 2;
      unsigned int incr = 1 + (hcode_initial % h2);
      do
        {
          hcode += incr; if (hcode >= size) hcode -= size;
          e = &harray [hcode];
          e_key = e->key;
        }
      while (e_key?
             KEYS_DIFFER_P (e_key, key, test_function):
             e->contents == NULL_ENTRY);
    }
  if (e_key)
    {
      e->key = 0;
      e->contents = NULL_ENTRY;
      /* Note: you can't do fullness-- here, it breaks the world. */
    }
}

void
maphash (maphash_function mf, struct hash_table *hash_table, void *arg)
{
  hentry *e;
  hentry *limit;

  if (hash_table->zero_set)
    {
      if (mf (0, hash_table->zero_entry, arg))
	return;
    }

  for (e = hash_table->harray, limit = e + hash_table->size; e < limit; e++)
    {
      if (e->key && mf (e->key, e->contents, arg))
	return;
    }
}

void
map_remhash (remhash_predicate predicate, struct hash_table *hash_table, void *arg)
{
  hentry *e;
  hentry *limit;

  if (hash_table->zero_set && predicate (0, hash_table->zero_entry, arg))
    {
      hash_table->zero_set = 0;
      hash_table->zero_entry = 0;
    }

  for (e = hash_table->harray, limit = e + hash_table->size; e < limit; e++)
    if (predicate (e->key, e->contents, arg))
      {
        e->key = 0;
        e->contents = NULL_ENTRY;
      }
}
