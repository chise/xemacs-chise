/* Support for Non-ASCII Path Name
   Copyright (C) 1985, 1986, 1992, 1993, 1995 Free Software Foundation, Inc.
   Copyright (C) 1995 Sun Microsystems, Inc.

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

/* Synched up with: Mule 2.3.   Not in FSF. */

/* mcpath.h should be included in config.h */
#include <config.h>
#include "lisp.h"

#include "sysfile.h"
#include "buffer.h"
#include "mule.h"

Lisp_Object Qpathname_coding_system = 0;

static void
mcpath_encode_code (Lisp_Coding_System *cp)
{
  Lisp_Object coding_system;

  coding_system = Fsymbol_value (Qpathname_coding_system);

  mule_encode_code (coding_system, cp);
  CODE_CNTL (cp) |= CC_END;
}

static int
mule_encode_path_1 (unsigned char *src, unsigned int srcsize,
		    unsigned char *dst, unsigned int dstsize)
{
  Lisp_Coding_System code;

  mcpath_encode_code (&code);
  if (CODE_TYPE (&code) > MULE_AUTOCONV)
    {
      unsigned char *buf;

					/* get_conversion_buffer () is not */
					/* re-entrant. */
      buf = (unsigned char *) alloca (MULE_ENCODE_BUF_SIZE (srcsize, &code));
      if (buf)
	{
	  int len;
	  Lisp_Object dummy = Qnil;

	  len = mule_encode (&code, src, buf, srcsize, &dummy);
	  if (!CODE_CHAR (&code) && len <= dstsize)
	    {
	      memcpy (dst, buf, len);
	      return len;
	    }
	}
    }
  return -1;				/* use original */
}

static unsigned char *
mule_decode_path_1 (unsigned char *src, unsigned char *dst,
		    unsigned int dstsize)
{
  Lisp_Coding_System code;

  mcpath_encode_code (&code);
  if (CODE_TYPE (&code) > MULE_AUTOCONV)
    {
      int len;
      unsigned char *buf;

      len = strlen (src) + 1;		/* + 1 for '\0' */

					/* get_conversion_buffer () is not */
					/* re-entrant. */
      buf = (unsigned char *) alloca (MULE_DECODE_BUF_SIZE (len, &code));
      if (buf)
	{
	  CODE_CNTL (&code) |= CC_END;
	  len = mule_decode (&code, src, buf, len);
	  if (!CODE_CHAR (&code) && len <= dstsize)
	    {
	      memcpy (dst, buf, len);	/* len should include '\0' */
	      return dst;
	    }
	}
    }
  return src;
}

static unsigned char *
mule_decode_path (unsigned char *path, unsigned char ext_path[MC_MAXPATHLEN])
{
  return
    (Qpathname_coding_system
     ? mule_decode_path_1 (path, ext_path, MC_MAXPATHLEN)
     : path);				/* in case of before initialization */
}

static unsigned char *
mule_encode_path (unsigned char *path, unsigned char *encode_buffer,
		  unsigned int size)
{
  int len;

  len = mule_encode_path_1 (path, strlen (path), encode_buffer, size);
  if (len > 0)
    path = encode_buffer;
#ifdef MSDOS
  /* convert the MSDOS style path delimiter to the UNIX style.  Note
     that now the code is *internal*, so we can simply compare each
     character with '\\'.  And this operation will alter the contents
     of Lisp Object, PATH. */
  {
    unsigned char *p = path;

    while (*p)
      {
	if (*p == '\\')
	  *p = '/';
	p++;
      }
  }
#endif /* MSDOS */
  return path;
}

#if 0 /* example of how they do it (similar junk deleted) ... */

int
mc_creat (unsigned char *path, int mode)
{
  unsigned char buffer[MC_MAXPATHLEN];
  return creat (mule_decode_path (path, buffer), mode);
}

int
mc_readlink (unsigned char *path, unsigned char *buf, int size)
{
  unsigned char buffer[MC_MAXPATHLEN], buffer2[MAXPATHLEN];
  int nread;

  nread = readlink (mule_decode_path (path, buffer), buffer2, MAXPATHLEN);
  if (nread > 0)
    {
      int len;
      unsigned char *p;

      len = mule_encode_path_1 (buffer2, nread, buffer, sizeof (buffer));
      if (0 <= len && len <= size)
	{
	  memcpy (buf, buffer, len);
	  return len;
	}
    }
  return -1;
}

int
mc_chdir (unsigned char *path)
{
  unsigned char buffer[MC_MAXPATHLEN];

  path = mule_decode_path (path, buffer);

#ifdef MSDOS
  if ((path[0] != 0) && (path[1] == ':'))
    {
      int drive = (tolower (path[0]) - 'a');
      if (getdisk () != drive)
	setdisk (drive);
    }

  /* If path != "/" and path != "a:/" and path ends with slash, remove
     it. */
  {
    int len = strlen (path);

    if (strcmp (path + 1, ":/") && (len > 1) && (path[len - 1] == '/'))
      {
	if (path != buffer)	/* It is not good to modify original path. */
	  {
	    memcpy (buffer, path, len - 1); /* no need to copy last /. */
	    path = buffer;
	  }
	path[len - 1] = 0;
      }
  }
#endif /* MSDOS */

  return chdir (path);
}

#ifdef MSDOS
#ifndef HAVE_GETWD
unsigned char *
mc_getcwd (unsigned char *null, size_t size)
{
  unsigned char buffer[MAXPATHLEN];
  unsigned char *path;

  path = (unsigned char *) getcwd ((char *)buffer, MAXPATHLEN);
  if (path)
    {
      /* here, should be (path == buffer). */
      path = (unsigned char *) xmalloc (MC_MAXPATHLEN);	/* MSDOS */
      if (path)
	{
	  int len;
	  int buffer_length = strlen (buffer) + 1;

	  len = mule_encode_path_1 (buffer, buffer_length, path, MC_MAXPATHLEN);
	  if (len < 0)
	    {
	      /* conversion failed.  use value that is returned from system. */
	      memcpy (path, buffer, buffer_length);
	    }
	}
    }
  return path;
}
#else /* HAVE_GETWD */
unsigned char *
mc_getwd (unsigned char path[])
{
  unsigned char *p;

  p = getwd (path);
  if (p)
    {
      unsigned char buffer[MC_MAXPATHLEN];
      int len;

      len = mule_encode_path_1 (path, strlen (path) + 1, buffer, sizeof buffer);
      if (len > 0)
	{
	  memcpy (path, buffer, len);
	}
    }
  return p;
}
#endif /* HAVE_GETWD */
#endif /* MSDOS */

/* In callproc.c, execvp() is called like this:
 * 	execvp (new_argv[0], new_argv);
 * following implement depends this.
 */
#ifndef NO_MC_EXECVP
void
mc_execvp (unsigned char *path, unsigned char *argv[])
{
  unsigned char buffer[MC_MAXPATHLEN];
  argv[0] = path = mule_decode_path (path, buffer);
  execvp (path, argv);
}
#endif /* !NO_MC_EXECVP */

static DIRENTRY mcpath_directory_entry;
DIRENTRY *
mc_readdir (DIR *d)
{
  SYSTEM_DIRENTRY *sp;
  DIRENTRY *dp = &mcpath_directory_entry;

  sp = readdir (d);
  if (!sp) return 0;

#ifndef MSDOS
  dp->d_ino = sp->d_ino;
#endif /* MSDOS */
  {				/* copy d_name with conversion. */
    int len;

    len = mule_encode_path_1 (sp->d_name, NAMLEN (sp),
			      dp->d_name, sizeof (dp->d_name) - 1);
    if (len < 0)
      {
	len = NAMLEN (sp);
#ifdef MCPATH_ASSERT
	assert (len < sizeof (dp->d_name));
#endif
	memcpy (dp->d_name, sp->d_name, len);
      }
    dp->d_name[len] = 0;
  }
  return dp;
}

#endif /* 0 */

