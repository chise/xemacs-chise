 /* Lisp functions for making directory listings.
   Copyright (C) 1985, 1986, 1992, 1993, 1994 Free Software Foundation, Inc.

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

/* Synched up with: FSF 19.30. */

#include <config.h>
#include "lisp.h"

#include "buffer.h"
#include "commands.h"
#include "elhash.h"
#include "regex.h"
#include "opaque.h"
#include "sysfile.h"
#include "sysdir.h"
#include "systime.h"
#include "syspwd.h"

Lisp_Object Vcompletion_ignored_extensions;
Lisp_Object Qdirectory_files;
Lisp_Object Qfile_name_completion;
Lisp_Object Qfile_name_all_completions;
Lisp_Object Qfile_attributes;

static Lisp_Object
close_directory_unwind (Lisp_Object unwind_obj)
{
  DIR *d = (DIR *)get_opaque_ptr (unwind_obj);
  closedir (d);
  free_opaque_ptr (unwind_obj);
  return Qnil;
}

DEFUN ("directory-files", Fdirectory_files, 1, 5, 0, /*
Return a list of names of files in DIRECTORY.
There are four optional arguments:
If FULL is non-nil, absolute pathnames of the files are returned.
If MATCH is non-nil, only pathnames containing that regexp are returned.
If NOSORT is non-nil, the list is not sorted--its order is unpredictable.
 NOSORT is useful if you plan to sort the result yourself.
If FILES-ONLY is the symbol t, then only the "files" in the directory
 will be returned; subdirectories will be excluded.  If FILES-ONLY is not
 nil and not t, then only the subdirectories will be returned.  Otherwise,
 if FILES-ONLY is nil (the default) then both files and subdirectories will
 be returned.
*/
       (dirname, full, match, nosort, files_only))
{
  /* This function can GC */
  DIR *d;
  Lisp_Object list = Qnil;
  Bytecount dirnamelen;
  Lisp_Object handler;
  struct re_pattern_buffer *bufp = NULL;
  int speccount = specpdl_depth ();
  char *statbuf, *statbuf_tail;

  struct gcpro gcpro1, gcpro2;
  GCPRO2 (dirname, list);

  /* If the file name has special constructs in it,
     call the corresponding file handler.  */
  handler = Ffind_file_name_handler (dirname, Qdirectory_files);
  if (!NILP (handler))
    {
      UNGCPRO;
      if (!NILP (files_only))
	return call6 (handler, Qdirectory_files, dirname, full, match, nosort,
		      files_only);
      else
	return call5 (handler, Qdirectory_files, dirname, full, match,
		      nosort);
    }

  /* #### why do we do Fexpand_file_name after file handlers here,
     but earlier everywhere else? */
  dirname = Fexpand_file_name (dirname, Qnil);
  dirname = Ffile_name_as_directory (dirname);
  dirnamelen = XSTRING_LENGTH (dirname);

  statbuf = (char *)alloca (dirnamelen + MAXNAMLEN + 1);
  memcpy (statbuf, XSTRING_DATA (dirname), dirnamelen);
  statbuf_tail = statbuf + dirnamelen;

  /* XEmacs: this should come after Ffile_name_as_directory() to avoid
     potential regexp cache smashage.  It comes before the opendir()
     because it might signal an error.  */
  if (!NILP (match))
    {
      CHECK_STRING (match);

      /* MATCH might be a flawed regular expression.  Rather than
	 catching and signalling our own errors, we just call
	 compile_pattern to do the work for us.  */
      bufp = compile_pattern (match, 0, 0, 0, ERROR_ME);
    }

  /* Now *bufp is the compiled form of MATCH; don't call anything
     which might compile a new regexp until we're done with the loop!  */

  /* Do this opendir after anything which might signal an error.
     NOTE: the above comment is old; previously, there was no
     unwind-protection in case of error, but now there is.  */
  d = opendir ((char *) XSTRING_DATA (dirname));
  if (!d)
    report_file_error ("Opening directory", list1 (dirname));

  record_unwind_protect (close_directory_unwind, make_opaque_ptr ((void *)d));

  /* Loop reading blocks */
  while (1)
    {
      DIRENTRY *dp = readdir (d);
      int len;

      if (!dp)
	break;
      len = NAMLEN (dp);
      if (DIRENTRY_NONEMPTY (dp)
	  && (NILP (match)
	      || (0 <= re_search (bufp, dp->d_name, len, 0, len, 0))))
	{
	  if (!NILP (files_only))
	    {
	      int dir_p;
	      struct stat st;
	      char *cur_statbuf = statbuf;
	      char *cur_statbuf_tail = statbuf_tail;

	      /* #### I don't think the code under `if' is necessary
		 anymore.  The crashes in this function were reported
		 because MAXNAMLEN was used to remember the *whole*
		 statbuf, instead of using MAXPATHLEN.  This should be
		 tested after 21.0 is released.  */

	      /* We normally use the buffer created by alloca.
		 However, if the file name we get too big, we'll use a
		 malloced buffer, and free it.  It is undefined how
		 stat() will react to this, but we avoid a buffer
		 overrun.  */
	      if (len > MAXNAMLEN)
		{
		  cur_statbuf = (char *)xmalloc (dirnamelen + len + 1);
		  memcpy (cur_statbuf, statbuf, dirnamelen);
		  cur_statbuf_tail = cur_statbuf + dirnamelen;
		}
	      memcpy (cur_statbuf_tail, dp->d_name, len);
	      cur_statbuf_tail[len] = 0;

	      if (stat (cur_statbuf, &st) < 0)
		dir_p = 0;
	      else
		dir_p = ((st.st_mode & S_IFMT) == S_IFDIR);

	      if (cur_statbuf != statbuf)
		xfree (cur_statbuf);

	      if (EQ (files_only, Qt) && dir_p)
		continue;
	      else if (!EQ (files_only, Qt) && !dir_p)
		continue;
	    }

	  {
	    Lisp_Object name =
	      make_string ((Bufbyte *)dp->d_name, len);
	    if (!NILP (full))
	      name = concat2 (dirname, name);

	    list = Fcons (name, list);
	  }
	}
    }
  unbind_to (speccount, Qnil);	/* This will close the dir */

  if (NILP (nosort))
    list = Fsort (Fnreverse (list), Qstring_lessp);

  RETURN_UNGCPRO (list);
}

static Lisp_Object file_name_completion (Lisp_Object file,
                                         Lisp_Object dirname,
                                         int all_flag, int ver_flag);

DEFUN ("file-name-completion", Ffile_name_completion, 2, 2, 0, /*
Complete file name FILE in directory DIR.
Returns the longest string common to all filenames in DIR
that start with FILE.
If there is only one and FILE matches it exactly, returns t.
Returns nil if DIR contains no name starting with FILE.

Filenames which end with any member of `completion-ignored-extensions'
are not considered as possible completions for FILE unless there is no
other possible completion.  `completion-ignored-extensions' is not applied
to the names of directories.
*/
       (file, dirname))
{
  /* This function can GC.  GC checked 1996.04.06. */
  Lisp_Object handler;

  /* If the directory name has special constructs in it,
     call the corresponding file handler.  */
  handler = Ffind_file_name_handler (dirname, Qfile_name_completion);
  if (!NILP (handler))
    return call3 (handler, Qfile_name_completion, file, dirname);

  /* If the file name has special constructs in it,
     call the corresponding file handler.  */
  handler = Ffind_file_name_handler (file, Qfile_name_completion);
  if (!NILP (handler))
    return call3 (handler, Qfile_name_completion, file, dirname);

  return file_name_completion (file, dirname, 0, 0);
}

DEFUN ("file-name-all-completions", Ffile_name_all_completions, 2, 2, 0, /*
Return a list of all completions of file name FILE in directory DIR.
These are all file names in directory DIR which begin with FILE.

Filenames which end with any member of `completion-ignored-extensions'
are not considered as possible completions for FILE unless there is no
other possible completion.  `completion-ignored-extensions' is not applied
to the names of directories.
*/
       (file, dirname))
{
  /* This function can GC. GC checked 1997.06.04. */
  Lisp_Object handler;
  struct gcpro gcpro1;

  GCPRO1 (dirname);
  dirname = Fexpand_file_name (dirname, Qnil);
  /* If the file name has special constructs in it,
     call the corresponding file handler.  */
  handler = Ffind_file_name_handler (dirname, Qfile_name_all_completions);
  UNGCPRO;
  if (!NILP (handler))
    return call3 (handler, Qfile_name_all_completions, file,
		  dirname);

  return file_name_completion (file, dirname, 1, 0);
}

static int
file_name_completion_stat (Lisp_Object dirname, DIRENTRY *dp,
			   struct stat *st_addr)
{
  Bytecount len = NAMLEN (dp);
  Bytecount pos = XSTRING_LENGTH (dirname);
  int value;
  char *fullname = (char *) alloca (len + pos + 2);

  memcpy (fullname, XSTRING_DATA (dirname), pos);
  if (!IS_DIRECTORY_SEP (fullname[pos - 1]))
    fullname[pos++] = DIRECTORY_SEP;

  memcpy (fullname + pos, dp->d_name, len);
  fullname[pos + len] = 0;

#ifdef S_IFLNK
  /* We want to return success if a link points to a nonexistent file,
     but we want to return the status for what the link points to,
     in case it is a directory.  */
  value = lstat (fullname, st_addr);
  if (S_ISLNK (st_addr->st_mode))
    stat (fullname, st_addr);
#else
  value = stat (fullname, st_addr);
#endif
  return value;
}

static Lisp_Object
file_name_completion_unwind (Lisp_Object locative)
{
  DIR *d;
  Lisp_Object obj = XCAR (locative);

  if (!NILP (obj))
    {
      d = (DIR *)get_opaque_ptr (obj);
      closedir (d);
      free_opaque_ptr (obj);
    }
  free_cons (XCONS (locative));
  return Qnil;
}

static Lisp_Object
file_name_completion (Lisp_Object file, Lisp_Object dirname, int all_flag,
		      int ver_flag)
{
  /* This function can GC */
  DIR *d = 0;
  int matchcount = 0;
  Lisp_Object bestmatch = Qnil;
  Charcount bestmatchsize = 0;
  struct stat st;
  int passcount;
  int speccount = specpdl_depth ();
  Charcount file_name_length;
  Lisp_Object locative;
  struct gcpro gcpro1, gcpro2, gcpro3;

  GCPRO3 (file, dirname, bestmatch);

  CHECK_STRING (file);

#ifdef WINDOWSNT
  /* Filename completion on Windows ignores case, since Windows
     filesystems do.  */
  specbind (Qcompletion_ignore_case, Qt);
#endif /* WINDOWSNT */

#ifdef FILE_SYSTEM_CASE
  file = FILE_SYSTEM_CASE (file);
#endif
  dirname = Fexpand_file_name (dirname, Qnil);
  file_name_length = XSTRING_CHAR_LENGTH (file);

  /* With passcount = 0, ignore files that end in an ignored extension.
     If nothing found then try again with passcount = 1, don't ignore them.
     If looking for all completions, start with passcount = 1,
     so always take even the ignored ones.

     ** It would not actually be helpful to the user to ignore any possible
     completions when making a list of them.**  */

  /* We cannot use close_directory_unwind() because we change the
     directory.  The old code used to just avoid signaling errors, and
     call closedir, but it was wrong, because it made sane handling of
     QUIT impossible and, besides, various utility functions like
     regexp_ignore_completion_p can signal errors.  */
  locative = noseeum_cons (Qnil, Qnil);
  record_unwind_protect (file_name_completion_unwind, locative);

  for (passcount = !!all_flag; NILP (bestmatch) && passcount < 2; passcount++)
    {
      d = opendir ((char *) XSTRING_DATA (Fdirectory_file_name (dirname)));
      if (!d)
	report_file_error ("Opening directory", list1 (dirname));
      XCAR (locative) = make_opaque_ptr ((void *)d);

      /* Loop reading blocks */
      while (1)
	{
	  DIRENTRY *dp;
	  Bytecount len;
	  /* scmp() works in characters, not bytes, so we have to compute
	     this value: */
	  Charcount cclen;
          int directoryp;
          int ignored_extension_p = 0;
	  Bufbyte *d_name;

	  dp = readdir (d);
	  if (!dp) break;

	  /* Cast to Bufbyte* is OK, as readdir() Mule-encapsulates.  */
	  d_name = (Bufbyte *) dp->d_name;
	  len = NAMLEN (dp);
	  cclen = bytecount_to_charcount (d_name, len);

	  QUIT;

	  if (! DIRENTRY_NONEMPTY (dp)
	      || cclen < file_name_length
	      || 0 <= scmp (d_name, XSTRING_DATA (file), file_name_length))
	    continue;

          if (file_name_completion_stat (dirname, dp, &st) < 0)
            continue;

          directoryp = ((st.st_mode & S_IFMT) == S_IFDIR);
          if (directoryp)
	    {
#ifndef TRIVIAL_DIRECTORY_ENTRY
#define TRIVIAL_DIRECTORY_ENTRY(n) (!strcmp (n, ".") || !strcmp (n, ".."))
#endif
	      /* "." and ".." are never interesting as completions, but are
		 actually in the way in a directory containing only one file.  */
	      if (!passcount && TRIVIAL_DIRECTORY_ENTRY (dp->d_name))
		continue;
	    }
	  else
            {
	      /* Compare extensions-to-be-ignored against end of this file name */
	      /* if name is not an exact match against specified string.  */
	      if (!passcount && cclen > file_name_length)
		{
		  Lisp_Object tem;
		  /* and exit this for loop if a match is found */
		  EXTERNAL_LIST_LOOP (tem, Vcompletion_ignored_extensions)
		    {
		      Lisp_Object elt = XCAR (tem);
		      Charcount skip;

		      CHECK_STRING (elt);

		      skip = cclen - XSTRING_CHAR_LENGTH (elt);
		      if (skip < 0) continue;

		      if (0 > scmp (charptr_n_addr (d_name, skip),
				    XSTRING_DATA (elt),
				    XSTRING_CHAR_LENGTH (elt)))
			{
			  ignored_extension_p = 1;
			  break;
			}
		    }
		}
	    }

	  /* If an ignored-extensions match was found,
	     don't process this name as a completion.  */
	  if (!passcount && ignored_extension_p)
	    continue;

	  if (!passcount && regexp_ignore_completion_p (d_name, Qnil, 0, cclen))
            continue;

          /* Update computation of how much all possible completions match */
          matchcount++;

          if (all_flag || NILP (bestmatch))
            {
              Lisp_Object name = Qnil;
              struct gcpro ngcpro1;
              NGCPRO1 (name);
              /* This is a possible completion */
              name = make_string (d_name, len);
              if (directoryp) /* Completion is a directory; end it with '/' */
                name = Ffile_name_as_directory (name);
              if (all_flag)
                {
                  bestmatch = Fcons (name, bestmatch);
                }
              else
                {
                  bestmatch = name;
                  bestmatchsize = XSTRING_CHAR_LENGTH (name);
                }
              NUNGCPRO;
            }
          else
            {
              Charcount compare = min (bestmatchsize, cclen);
              Bufbyte *p1 = XSTRING_DATA (bestmatch);
              Bufbyte *p2 = d_name;
              Charcount matchsize = scmp (p1, p2, compare);

              if (matchsize < 0)
                matchsize = compare;
              if (completion_ignore_case)
                {
                  /* If this is an exact match except for case,
                     use it as the best match rather than one that is not
                     an exact match.  This way, we get the case pattern
                     of the actual match.  */
                  if ((matchsize == cclen
                       && matchsize + !!directoryp
                       < XSTRING_CHAR_LENGTH (bestmatch))
                      ||
                      /* If there is no exact match ignoring case,
                         prefer a match that does not change the case
                         of the input.  */
                      (((matchsize == cclen)
                        ==
                        (matchsize + !!directoryp
                         == XSTRING_CHAR_LENGTH (bestmatch)))
                       /* If there is more than one exact match aside from
                          case, and one of them is exact including case,
                          prefer that one.  */
                       && 0 > scmp_1 (p2, XSTRING_DATA (file),
				      file_name_length, 0)
                       && 0 <= scmp_1 (p1, XSTRING_DATA (file),
				       file_name_length, 0)))
                    {
                      bestmatch = make_string (d_name, len);
                      if (directoryp)
                        bestmatch = Ffile_name_as_directory (bestmatch);
                    }
                }

              /* If this dirname all matches,
                 see if implicit following slash does too.  */
              if (directoryp
                  && compare == matchsize
                  && bestmatchsize > matchsize
                  && IS_ANY_SEP (charptr_emchar_n (p1, matchsize)))
                matchsize++;
              bestmatchsize = matchsize;
            }
        }
      closedir (d);
      free_opaque_ptr (XCAR (locative));
      XCAR (locative) = Qnil;
    }

  unbind_to (speccount, Qnil);

  UNGCPRO;

  if (all_flag || NILP (bestmatch))
    return bestmatch;
  if (matchcount == 1 && bestmatchsize == file_name_length)
    return Qt;
  return Fsubstring (bestmatch, Qzero, make_int (bestmatchsize));
}



/* The *pwent() functions do not exist on NT */
#ifndef  WINDOWSNT

static Lisp_Object user_name_completion (Lisp_Object user,
                                         int all_flag,
                                         int *uniq);

DEFUN ("user-name-completion", Fuser_name_completion, 1, 1, 0, /*
Complete user name USER.

Returns the longest string common to all user names that start
with USER.  If there is only one and USER matches it exactly,
returns t.  Returns nil if there is no user name starting with USER.
*/
       (user))
{
  return user_name_completion (user, 0, NULL);
}

DEFUN ("user-name-completion-1", Fuser_name_completion_1, 1, 1, 0, /*
Complete user name USER.

This function is identical to `user-name-completion', except that
the cons of the completion and an indication of whether the
completion was unique is returned.

The car of the returned value is the longest string common to all
user names that start with USER.  If there is only one and USER
matches it exactly, the car is t.  The car is nil if there is no
user name starting with USER.  The cdr of the result is non-nil
if and only if the completion returned in the car was unique.
*/
       (user))
{
  int uniq;
  Lisp_Object completed;

  completed = user_name_completion (user, 0, &uniq);
  return Fcons (completed, uniq ? Qt : Qnil);
}

DEFUN ("user-name-all-completions", Fuser_name_all_completions, 1, 1, 0, /*
Return a list of all completions of user name USER.
These are all user names which begin with USER.
*/
       (user))
{
  return user_name_completion (user, 1, NULL);
}

static Lisp_Object
user_name_completion_unwind (Lisp_Object locative)
{
  Lisp_Object obj1 = XCAR (locative);
  Lisp_Object obj2 = XCDR (locative);
  char **cache;
  int clen, i;


  if (!NILP (obj1) && !NILP (obj2))
    {
      /* clean up if interrupted building cache */
      cache = *(char ***)get_opaque_ptr (obj1);
      clen  = *(int *)get_opaque_ptr (obj2);
      free_opaque_ptr (obj1);
      free_opaque_ptr (obj2);
      for (i = 0; i < clen; i++)
        free (cache[i]);
      free (cache);
    }

  free_cons (XCONS (locative));
  endpwent ();

  return Qnil;
}

static char **user_cache;
static int user_cache_len;
static int user_cache_max;
static long user_cache_time;

#define  USER_CACHE_REBUILD  (24*60*60)  /* 1 day, in seconds */

static Lisp_Object
user_name_completion (Lisp_Object user, int all_flag, int *uniq)
{
  /* This function can GC */
  struct passwd *pw;
  int matchcount = 0;
  Lisp_Object bestmatch = Qnil;
  Charcount bestmatchsize = 0;
  int speccount = specpdl_depth ();
  int i, cmax, clen;
  char **cache;
  Charcount user_name_length;
  Lisp_Object locative;
  EMACS_TIME t;
  struct gcpro gcpro1, gcpro2;

  GCPRO2 (user, bestmatch);

  CHECK_STRING (user);

  user_name_length = XSTRING_CHAR_LENGTH (user);

  /* Cache user name lookups because it tends to be quite slow.
   * Rebuild the cache occasionally to catch changes */
  EMACS_GET_TIME (t);
  if (user_cache  &&
      EMACS_SECS (t) - user_cache_time > USER_CACHE_REBUILD)
    {
      for (i = 0; i < user_cache_len; i++)
        free (user_cache[i]);
      free (user_cache);
      user_cache = NULL;
      user_cache_len = 0;
      user_cache_max = 0;
    }

  if (user_cache == NULL || user_cache_max <= 0)
    {
      cmax  = 200;
      clen  = 0;
      cache = (char **) malloc (cmax*sizeof (char *));

      setpwent ();
      locative = noseeum_cons (Qnil, Qnil);
      XCAR (locative) = make_opaque_ptr ((void *) &cache);
      XCDR (locative) = make_opaque_ptr ((void *) &clen);
      record_unwind_protect (user_name_completion_unwind, locative);
      /* #### may need to slow down interrupts around call to getpwent
       * below.  at least the call to getpwnam in Fuser_full_name
       * is documented as needing it on irix. */
      while ((pw = getpwent ()))
        {
          if (clen >= cmax)
            {
              cmax *= 2;
              cache = (char **) realloc (cache, cmax*sizeof (char *));
            }

          QUIT;

          cache[clen++] = strdup (pw->pw_name);
        }
      free_opaque_ptr (XCAR (locative));
      free_opaque_ptr (XCDR (locative));
      XCAR (locative) = Qnil;
      XCDR (locative) = Qnil;

      unbind_to (speccount, Qnil); /* free locative cons, endpwent() */

      user_cache_max = cmax;
      user_cache_len = clen;
      user_cache = cache;
      user_cache_time = EMACS_SECS (t);
    }

  for (i = 0; i < user_cache_len; i++)
    {
      Bufbyte *d_name = (Bufbyte *) user_cache[i];
      Bytecount len = strlen ((char *) d_name);
      /* scmp() works in chars, not bytes, so we have to compute this: */
      Charcount cclen = bytecount_to_charcount (d_name, len);

      QUIT;

      if (cclen < user_name_length   ||
          0 <= scmp (d_name, XSTRING_DATA (user), user_name_length))
        continue;

      matchcount++;    /* count matching completions */

      if (all_flag || NILP (bestmatch))
        {
          Lisp_Object name = Qnil;
          struct gcpro ngcpro1;
          NGCPRO1 (name);
          /* This is a possible completion */
          name = make_string (d_name, len);
          if (all_flag)
            {
              bestmatch = Fcons (name, bestmatch);
            }
          else
            {
              bestmatch = name;
              bestmatchsize = XSTRING_CHAR_LENGTH (name);
            }
          NUNGCPRO;
        }
      else
        {
          Charcount compare = min (bestmatchsize, cclen);
          Bufbyte *p1 = XSTRING_DATA (bestmatch);
          Bufbyte *p2 = d_name;
          Charcount matchsize = scmp (p1, p2, compare);

          if (matchsize < 0)
            matchsize = compare;
          if (completion_ignore_case)
            {
              /* If this is an exact match except for case,
                 use it as the best match rather than one that is not
                 an exact match.  This way, we get the case pattern
                 of the actual match.  */
              if ((matchsize == cclen
                   && matchsize < XSTRING_CHAR_LENGTH (bestmatch))
                  ||
                  /* If there is no exact match ignoring case,
                     prefer a match that does not change the case
                     of the input.  */
                  (((matchsize == cclen)
                    ==
                    (matchsize == XSTRING_CHAR_LENGTH (bestmatch)))
                   /* If there is more than one exact match aside from
                      case, and one of them is exact including case,
                      prefer that one.  */
                   && 0 > scmp_1 (p2, XSTRING_DATA (user),
                                  user_name_length, 0)
                   && 0 <= scmp_1 (p1, XSTRING_DATA (user),
                                   user_name_length, 0)))
                {
                  bestmatch = make_string (d_name, len);
                }
            }

          bestmatchsize = matchsize;
        }
    }

  UNGCPRO;

  if (uniq)
    *uniq = (matchcount == 1);

  if (all_flag || NILP (bestmatch))
    return bestmatch;
  if (matchcount == 1 && bestmatchsize == user_name_length)
    return Qt;
  return Fsubstring (bestmatch, Qzero, make_int (bestmatchsize));
}
#endif   /* ! defined WINDOWSNT */


Lisp_Object
make_directory_hash_table (CONST char *path)
{
  DIR *d;
  Lisp_Object hash =
    make_lisp_hash_table (100, HASH_TABLE_NON_WEAK, HASH_TABLE_EQUAL);
  if ((d = opendir (path)))
    {
      DIRENTRY *dp;

      while ((dp = readdir (d)))
	{
	  Bytecount len = NAMLEN (dp);
	  if (DIRENTRY_NONEMPTY (dp))
	    /* Cast to Bufbyte* is OK, as readdir() Mule-encapsulates.  */
	    Fputhash (make_string ((Bufbyte *) dp->d_name, len), Qt, hash);
	}
      closedir (d);
    }
  return hash;
}

Lisp_Object
wasteful_word_to_lisp (unsigned int item)
{
  /* Compatibility: in other versions, file-attributes returns a LIST
     of two 16 bit integers... */
  Lisp_Object cons = word_to_lisp (item);
  XCDR (cons) = Fcons (XCDR (cons), Qnil);
  return cons;
}

DEFUN ("file-attributes", Ffile_attributes, 1, 1, 0, /*
Return a list of attributes of file FILENAME.
Value is nil if specified file cannot be opened.
Otherwise, list elements are:
 0. t for directory, string (name linked to) for symbolic link, or nil.
 1. Number of links to file.
 2. File uid.
 3. File gid.
 4. Last access time, as a list of two integers.
  First integer has high-order 16 bits of time, second has low 16 bits.
 5. Last modification time, likewise.
 6. Last status change time, likewise.
 7. Size in bytes. (-1, if number is out of range).
 8. File modes, as a string of ten letters or dashes as in ls -l.
 9. t iff file's gid would change if file were deleted and recreated.
10. inode number.
11. Device number.

If file does not exist, returns nil.
*/
       (filename))
{
  /* This function can GC. GC checked 1997.06.04. */
  Lisp_Object values[12];
  Lisp_Object dirname = Qnil;
  struct stat s;
  char modes[10];
  Lisp_Object handler;
  struct gcpro gcpro1, gcpro2;

  GCPRO2 (filename, dirname);
  filename = Fexpand_file_name (filename, Qnil);

  /* If the file name has special constructs in it,
     call the corresponding file handler.  */
  handler = Ffind_file_name_handler (filename, Qfile_attributes);
  if (!NILP (handler))
    {
      UNGCPRO;
      return call2 (handler, Qfile_attributes, filename);
    }

  if (lstat ((char *) XSTRING_DATA (filename), &s) < 0)
    {
      UNGCPRO;
      return Qnil;
    }

#ifdef BSD4_2
  dirname = Ffile_name_directory (filename);
#endif

#ifdef MSDOS
  {
    char *tmpnam = (char *) XSTRING_DATA (Ffile_name_nondirectory (filename));
    int l = strlen (tmpnam);

    if (l >= 5
	&& S_ISREG (s.st_mode)
	&& (stricmp (&tmpnam[l - 4], ".com") == 0 ||
	    stricmp (&tmpnam[l - 4], ".exe") == 0 ||
	    stricmp (&tmpnam[l - 4], ".bat") == 0))
      {
	s.st_mode |= S_IEXEC;
      }
  }
#endif /* MSDOS */

  switch (s.st_mode & S_IFMT)
    {
    default:
      values[0] = Qnil;
      break;
    case S_IFDIR:
      values[0] = Qt;
      break;
#ifdef S_IFLNK
    case S_IFLNK:
      values[0] = Ffile_symlink_p (filename);
      break;
#endif
    }
  values[1] = make_int (s.st_nlink);
  values[2] = make_int (s.st_uid);
  values[3] = make_int (s.st_gid);
  values[4] = wasteful_word_to_lisp (s.st_atime);
  values[5] = wasteful_word_to_lisp (s.st_mtime);
  values[6] = wasteful_word_to_lisp (s.st_ctime);
  values[7] = make_int ((EMACS_INT) s.st_size);
  /* If the size is out of range, give back -1.  */
  /* #### Fix when Emacs gets bignums! */
  if (XINT (values[7]) != s.st_size)
    values[7] = make_int (-1);
  filemodestring (&s, modes);
  values[8] = make_string ((Bufbyte *) modes, 10);
#if defined (BSD4_2) || defined (BSD4_3)	/* file gid will be dir gid */
  {
    struct stat sdir;

    if (!NILP (dirname) && stat ((char *) XSTRING_DATA (dirname), &sdir) == 0)
      values[9] = (sdir.st_gid != s.st_gid) ? Qt : Qnil;
    else                        /* if we can't tell, assume worst */
      values[9] = Qt;
  }
#else                           /* file gid will be egid */
  values[9] = (s.st_gid != getegid ()) ? Qt : Qnil;
#endif	/* BSD4_2 or BSD4_3 */
  values[10] = make_int (s.st_ino);
  values[11] = make_int (s.st_dev);
  UNGCPRO;
  return Flist (countof (values), values);
}


/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
syms_of_dired (void)
{
  defsymbol (&Qdirectory_files, "directory-files");
  defsymbol (&Qfile_name_completion, "file-name-completion");
  defsymbol (&Qfile_name_all_completions, "file-name-all-completions");
  defsymbol (&Qfile_attributes, "file-attributes");

  DEFSUBR (Fdirectory_files);
  DEFSUBR (Ffile_name_completion);
  DEFSUBR (Ffile_name_all_completions);
#ifndef  WINDOWSNT
  DEFSUBR (Fuser_name_completion);
  DEFSUBR (Fuser_name_completion_1);
  DEFSUBR (Fuser_name_all_completions);
#endif
  DEFSUBR (Ffile_attributes);
}

void
vars_of_dired (void)
{
  DEFVAR_LISP ("completion-ignored-extensions", &Vcompletion_ignored_extensions /*
*Completion ignores filenames ending in any string in this list.
This variable does not affect lists of possible completions,
but does affect the commands that actually do completions.
It is used by the functions `file-name-completion' and
`file-name-all-completions'.
*/ );
  Vcompletion_ignored_extensions = Qnil;

#ifndef  WINDOWSNT
  user_cache = NULL;
  user_cache_len = 0;
  user_cache_max = 0;
#endif
}
