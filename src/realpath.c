/*
 * realpath.c -- canonicalize pathname by removing symlinks
 * Copyright (C) 1993 Rick Sladkey <jrs@world.std.com>
 *

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

#include <config.h>

#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <limits.h>

#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif

#if defined (HAVE_SYS_PARAM_H)
#include <sys/param.h>
#endif

#ifdef WIN32_NATIVE
#include <direct.h>
#endif

#include <sys/stat.h>			/* for S_IFLNK */

#if !defined (HAVE_GETCWD) && defined (HAVE_GETWD)
#undef getcwd
#define getcwd(buffer, len) getwd (buffer)
#endif

#ifndef PATH_MAX
# if defined (_POSIX_PATH_MAX)
#  define PATH_MAX _POSIX_PATH_MAX
# elif defined (MAXPATHLEN)
#  define PATH_MAX MAXPATHLEN
# else
#  define PATH_MAX 1024
# endif
#endif

#define MAX_READLINKS 32

char * xrealpath (const char *path, char resolved_path []);
char *
xrealpath (const char *path, char resolved_path [])
{
  char copy_path[PATH_MAX];
  char *new_path = resolved_path;
  char *max_path;
#ifdef S_IFLNK
  int readlinks = 0;
  char link_path[PATH_MAX];
  int n;
#endif

  /* Make a copy of the source path since we may need to modify it. */
  strcpy (copy_path, path);
  path = copy_path;
  max_path = copy_path + PATH_MAX - 2;
#ifdef WIN32_NATIVE
  /*
  ** In NT we have two different cases:  (1) the path name begins
  ** with a drive letter, e.g., "C:"; and (2) the path name begins
  ** with just a slash, which roots to the current drive. In the
  ** first case we are going to leave things alone, in the second
  ** case we will prepend the drive letter to the given path.
  ** Note: So far in testing, I'm only seeing case #1, even though
  ** I've tried to get the other cases to happen.
  ** August Hill, 31 Aug 1997.
  **
  ** Check for a driver letter...C:/...
  */
  if (*(path + 1) == ':')
    {
      strncpy(new_path, path, 3);
      new_path += 3;
      path += 3;
    }

  /*
  ** No drive letter, but a beginning slash? Prepend the drive
  ** letter...
  */
  else if (*path == '/')
    {
      getcwd (new_path, PATH_MAX - 1);
      new_path += 3;
      path++;
    }

  /*
  ** Just a path name, prepend the current directory
  */
  else
    {
      getcwd (new_path, PATH_MAX - 1);
      new_path += strlen(new_path);
      if (new_path[-1] != '/')
	*new_path++ = '/';
    }

#else
  /* If it's a relative pathname use getcwd for starters. */
  if (*path != '/')
    {
      getcwd (new_path, PATH_MAX - 1);
      new_path += strlen(new_path);
      if (new_path[-1] != '/')
	*new_path++ = '/';
    }
  else
    {
      *new_path++ = '/';
      path++;
    }
#endif
  /* Expand each slash-separated pathname component. */
  while (*path != '\0')
    {
      /* Ignore stray "/". */
      if (*path == '/')
	{
	  path++;
	  continue;
	}

      if (*path == '.')
	{
	  /* Ignore ".". */
	  if (path[1] == '\0' || path[1] == '/')
	    {
	      path++;
	      continue;
	    }

	  /* Handle ".." */
	  if (path[1] == '.' &&
	      (path[2] == '\0' || path[2] == '/'))
	    {
	      path += 2;

	      /* Ignore ".." at root. */
	      if (new_path == resolved_path + 1)
		continue;

	      /* Handle ".." by backing up. */
	      while ((--new_path)[-1] != '/')
		;
	      continue;
	    }
	}

      /* Safely copy the next pathname component. */
      while (*path != '\0' && *path != '/')
	{
	  if (path > max_path)
	    {
	      errno = ENAMETOOLONG;
	      return NULL;
	    }
	  *new_path++ = *path++;
	}

#ifdef S_IFLNK
      /* See if latest pathname component is a symlink. */
      *new_path = '\0';
      n = readlink (resolved_path, link_path, PATH_MAX - 1);

      if (n < 0)
	{
	  /* EINVAL means the file exists but isn't a symlink. */
	  if (errno != EINVAL)
	    return NULL;
	}
      else
	{
	  /* Protect against infinite loops. */
	  if (readlinks++ > MAX_READLINKS)
	    {
	      errno = ELOOP;
	      return NULL;
	    }

	  /* Note: readlink doesn't add the null byte. */
	  link_path[n] = '\0';

	  if (*link_path == '/')
	    /* Start over for an absolute symlink. */
	    new_path = resolved_path;
	  else
	    /* Otherwise back up over this component. */
	    while (*(--new_path) != '/')
	      ;

	  /* Safe sex check. */
	  if (strlen(path) + n >= PATH_MAX)
	    {
	      errno = ENAMETOOLONG;
	      return NULL;
	    }

	  /* Insert symlink contents into path. */
	  strcat(link_path, path);
	  strcpy(copy_path, link_path);
	  path = copy_path;
	}
#endif /* S_IFLNK */
      *new_path++ = '/';
    }

  /* Delete trailing slash but don't whomp a lone slash. */
  if (new_path != resolved_path + 1 && new_path[-1] == '/')
    new_path--;

  /* Make sure it's null terminated. */
  *new_path = '\0';
  return resolved_path;
}
