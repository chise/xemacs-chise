/* Copyright (C) 1985, 1986, 1987, 1992, 1993, 1994
   Free Software Foundation, Inc.

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
#include <paths.h>

#include "sysfile.h"
#include "sysdir.h"
#include "syspwd.h"
#include "syssignal.h" /* for kill */

#ifndef CLASH_DETECTION
#error  CLASH_DETECTION is not defined??
#endif

/* FSFmacs uses char *lock_dir and char *superlock_file instead of
   the Lisp variables we use. */

/* The name of the directory in which we keep lock files, with a '/'
   appended.  */
Lisp_Object Vlock_directory;

#if 0 /* FSFmacs */
/* Look in startup.el */
/* The name of the file in the lock directory which is used to
   arbitrate access to the entire directory.  */
#define SUPERLOCK_NAME "!!!SuperLock!!!"
#endif

/* The name of the superlock file.  This is SUPERLOCK_NAME appended to
   Vlock_directory.  */
Lisp_Object Vsuperlock_file, Vconfigure_superlock_file;

Lisp_Object Qask_user_about_supersession_threat;
Lisp_Object Qask_user_about_lock;

static void lock_superlock (CONST char *lfname);
static int lock_file_1 (CONST char *lfname, int mode);
static int lock_if_free (CONST char *lfname);
static int current_lock_owner (CONST char *);
static int current_lock_owner_1 (CONST char *);

/* Set LOCK to the name of the lock file for the filename FILE.
   char *LOCK; Lisp_Object FILE;

   MAKE_LOCK_NAME assumes you have already verified that Vlock_directory
   is a string. */

#ifndef HAVE_LONG_FILE_NAMES

#define MAKE_LOCK_NAME(lock, file)					\
  (lock = (char *) alloca (14 + XSTRING_LENGTH (Vlock_directory) + 1),	\
   fill_in_lock_short_file_name (lock, (file)))

static void
fill_in_lock_short_file_name (REGISTER char *lockfile, REGISTER Lisp_Object fn)
{
  REGISTER union
    {
      unsigned int  word [2];
      unsigned char byte [8];
    } crc;
  REGISTER unsigned char *p, new;

  CHECK_STRING (Vlock_directory);

  /* 7-bytes cyclic code for burst correction on byte-by-byte basis.
     the used polynomial is D^7 + D^6 + D^3 +1. pot@cnuce.cnr.it */

  crc.word[0] = crc.word[1] = 0;

  for (p = XSTRING_DATA (fn); new = *p++; )
    {
      new += crc.byte[6];
      crc.byte[6] = crc.byte[5] + new;
      crc.byte[5] = crc.byte[4];
      crc.byte[4] = crc.byte[3];
      crc.byte[3] = crc.byte[2] + new;
      crc.byte[2] = crc.byte[1];
      crc.byte[1] = crc.byte[0];
      crc.byte[0] = new;
    }

  {
    int need_slash = 0;

    /* in case lock-directory doesn't end in / */
    if (XSTRING_BYTE (Vlock_directory,
		     XSTRING_LENGTH (Vlock_directory) - 1) != '/')
      need_slash = 1;

    sprintf (lockfile, "%s%s%.2x%.2x%.2x%.2x%.2x%.2x%.2x",
	     (char *) XSTRING_DATA (Vlock_directory),
	     need_slash ? "/" : "",
	     crc.byte[0], crc.byte[1], crc.byte[2], crc.byte[3],
	     crc.byte[4], crc.byte[5], crc.byte[6]);
  }
}

#else /* defined HAVE_LONG_FILE_NAMES */

/* +2 for terminating null and possible extra slash */
#define MAKE_LOCK_NAME(lock, file)					\
  (lock = (char *) alloca (XSTRING_LENGTH (file) +			\
			   XSTRING_LENGTH (Vlock_directory) + 2),	\
   fill_in_lock_file_name (lock, (file)))

static void
fill_in_lock_file_name (REGISTER char *lockfile, REGISTER Lisp_Object fn)
     /* fn must be a Lisp_String! */
{
  REGISTER char *p;

  CHECK_STRING (Vlock_directory);

  strcpy (lockfile, (char *) XSTRING_DATA (Vlock_directory));

  p = lockfile + strlen (lockfile);

  if (p == lockfile /* lock-directory is empty?? */
      || *(p - 1) != '/')  /* in case lock-directory doesn't end in / */
    {
      *p = '/';
      p++;
    }

  strcpy (p, (char *) XSTRING_DATA (fn));

  for (; *p; p++)
    {
      if (*p == '/')
	*p = '!';
    }
}
#endif /* !defined HAVE_LONG_FILE_NAMES */

static Lisp_Object
lock_file_owner_name (CONST char *lfname)
{
  struct stat s;
  struct passwd *the_pw = 0;

  if (lstat (lfname, &s) == 0)
    the_pw = getpwuid (s.st_uid);
  return (the_pw == 0 ? Qnil : build_string (the_pw->pw_name));
}


/* lock_file locks file fn,
   meaning it serves notice on the world that you intend to edit that file.
   This should be done only when about to modify a file-visiting
   buffer previously unmodified.
   Do not (normally) call lock_buffer for a buffer already modified,
   as either the file is already locked, or the user has already
   decided to go ahead without locking.

   When lock_buffer returns, either the lock is locked for us,
   or the user has said to go ahead without locking.

   If the file is locked by someone else, lock_buffer calls
   ask-user-about-lock (a Lisp function) with two arguments,
   the file name and the name of the user who did the locking.
   This function can signal an error, or return t meaning
   take away the lock, or return nil meaning ignore the lock.  */

/* The lock file name is the file name with "/" replaced by "!"
   and put in the Emacs lock directory.  */
/* (ie., /ka/king/junk.tex -> /!/!ka!king!junk.tex). */

/* If HAVE_LONG_FILE_NAMES is not defined, the lock file name is the hex
   representation of a 14-bytes CRC generated from the file name
   and put in the Emacs lock directory (not very nice, but it works).
   (ie., /ka/king/junk.tex -> /!/12a82c62f1c6da). */

void
lock_file (Lisp_Object fn)
{
  /* This function can GC. */
  /* dmoore - and can destroy current_buffer and all sorts of other
     mean nasty things with pointy teeth.  If you call this make sure
     you protect things right. */

  REGISTER Lisp_Object attack, orig_fn;
  REGISTER char *lfname;
  struct gcpro gcpro1, gcpro2;
  Lisp_Object subject_buf = Qnil;

  if (NILP (Vlock_directory) || NILP (Vsuperlock_file))
    return;
  CHECK_STRING (fn);
  CHECK_STRING (Vlock_directory);

  GCPRO2 (fn, subject_buf);
  orig_fn = fn;
  fn = Fexpand_file_name (fn, Qnil);

  /* Create the name of the lock-file for file fn */
  MAKE_LOCK_NAME (lfname, fn);

  /* See if this file is visited and has changed on disk since it was
     visited.  */
  subject_buf = Fget_file_buffer (fn);
  if (!NILP (subject_buf)
      && NILP (Fverify_visited_file_modtime (subject_buf))
      && !NILP (Ffile_exists_p (fn)))
    call1_in_buffer (XBUFFER (subject_buf),
		     Qask_user_about_supersession_threat, fn);

  /* Try to lock the lock. */
  if (lock_if_free (lfname) <= 0)
    /* Return now if we have locked it, or if lock dir does not exist */
    goto done;

  /* Else consider breaking the lock */
  attack = call2_in_buffer (BUFFERP (subject_buf) ? XBUFFER (subject_buf) :
			    current_buffer, Qask_user_about_lock, fn,
			    lock_file_owner_name (lfname));
  if (!NILP (attack))
    /* User says take the lock */
    {
      CHECK_STRING (Vsuperlock_file);
      lock_superlock (lfname);
      lock_file_1 (lfname, O_WRONLY);
      unlink ((char *) XSTRING_DATA (Vsuperlock_file));
      goto done;
    }
  /* User says ignore the lock */
 done:
  UNGCPRO;
}


/* Lock the lock file named LFNAME.
   If MODE is O_WRONLY, we do so even if it is already locked.
   If MODE is O_WRONLY | O_EXCL | O_CREAT, we do so only if it is free.
   Return 1 if successful, 0 if not.  */

static int
lock_file_1 (CONST char *lfname, int mode)
{
  REGISTER int fd;
  char buf[20];

  if ((fd = open (lfname, mode, 0666)) >= 0)
    {
#if defined(WINDOWSNT)
      chmod(lfname, _S_IREAD|_S_IWRITE);
#elif defined(USG)
      chmod (lfname, 0666);
#else
      fchmod (fd, 0666);
#endif
      sprintf (buf, "%ld ", (long) getpid ());
      write (fd, buf, strlen (buf));
      close (fd);
      return 1;
    }
  else
    return 0;
}

/* Lock the lock named LFNAME if possible.
   Return 0 in that case.
   Return positive if lock is really locked by someone else.
   Return -1 if cannot lock for any other reason.  */

static int
lock_if_free (CONST char *lfname)
{
  REGISTER int clasher;

  while (lock_file_1 (lfname, O_WRONLY | O_EXCL | O_CREAT) == 0)
    {
      if (errno != EEXIST)
	return -1;
      clasher = current_lock_owner (lfname);
      if (clasher != 0)
	if (clasher != getpid ())
	  return (clasher);
	else return (0);
      /* Try again to lock it */
    }
  return 0;
}

/* Return the pid of the process that claims to own the lock file LFNAME,
   or 0 if nobody does or the lock is obsolete,
   or -1 if something is wrong with the locking mechanism.  */

static int
current_lock_owner (CONST char *lfname)
{
  int owner = current_lock_owner_1 (lfname);
  if (owner == 0 && errno == ENOENT)
    return (0);
  /* Is it locked by a process that exists?  */
  if (owner != 0 && (kill (owner, 0) >= 0 || errno == EPERM))
    return (owner);
  if (unlink (lfname) < 0)
    return (-1);
  return (0);
}

static int
current_lock_owner_1 (CONST char *lfname)
{
  REGISTER int fd;
  char buf[20];
  int tem;

  fd = open (lfname, O_RDONLY, 0666);
  if (fd < 0)
    return 0;
  tem = read (fd, buf, sizeof buf);
  close (fd);
  return (tem <= 0 ? 0 : atoi (buf));
}


void
unlock_file (Lisp_Object fn)
{
  /* This function can GC. */
  /* dmoore - and can destroy current_buffer and all sorts of other
     mean nasty things with pointy teeth.  If you call this make sure
     you protect things right. */

  REGISTER char *lfname;
  if (NILP (Vlock_directory) || NILP (Vsuperlock_file)) return;
  CHECK_STRING (fn);
  CHECK_STRING (Vlock_directory);
  CHECK_STRING (Vsuperlock_file);

  fn = Fexpand_file_name (fn, Qnil);

  MAKE_LOCK_NAME (lfname, fn);

  lock_superlock (lfname);

  if (current_lock_owner_1 (lfname) == getpid ())
    unlink (lfname);

  unlink ((char *) XSTRING_DATA (Vsuperlock_file));
}

static void
lock_superlock (CONST char *lfname)
{
  REGISTER int i, fd;
  DIR *lockdir;

  for (i = -20; i < 0 &&
       (fd = open ((char *) XSTRING_DATA (Vsuperlock_file),
		   O_WRONLY | O_EXCL | O_CREAT, 0666)) < 0;
       i++)
    {
      if (errno != EEXIST)
	return;

      /* This seems to be necessary to prevent Emacs from hanging when the
	 competing process has already deleted the superlock, but it's still
	 in the NFS cache.  So we force NFS to synchronize the cache.  */
      lockdir = opendir ((char *) XSTRING_DATA (Vlock_directory));
      if (lockdir)
	closedir (lockdir);

      emacs_sleep (1);
    }
  if (fd >= 0)
    {
#if defined(WINDOWSNT)
      chmod(lfname, _S_IREAD|_S_IWRITE);
#elif defined(USG)
      chmod ((char *) XSTRING_DATA (Vsuperlock_file), 0666);
#else
      fchmod (fd, 0666);
#endif
      write (fd, lfname, strlen (lfname));
      close (fd);
    }
}

void
unlock_all_files (void)
{
  /* This function can GC. */

  Lisp_Object tail;
  REGISTER struct buffer *b;
  struct gcpro gcpro1;

  GCPRO1 (tail);
  for (tail = Vbuffer_alist; GC_CONSP (tail);
       tail = XCDR (tail))
    {
      b = XBUFFER (XCDR (XCAR (tail)));
      if (STRINGP (b->file_truename) &&
	  BUF_SAVE_MODIFF (b) < BUF_MODIFF (b))
	unlock_file (b->file_truename);
    }
  UNGCPRO;
}


DEFUN ("lock-buffer", Flock_buffer, 0, 1, 0, /*
Lock FILE, if current buffer is modified.
FILE defaults to current buffer's visited file,
or else nothing is done if current buffer isn't visiting a file.
*/
       (fn))
{
  /* This function can GC */
  /* dmoore - and can destroy current_buffer and all sorts of other
     mean nasty things with pointy teeth.  If you call this make sure
     you protect things right. */

  if (NILP (fn))
    fn = current_buffer->file_truename;
  CHECK_STRING (fn);
  if (BUF_SAVE_MODIFF (current_buffer) < BUF_MODIFF (current_buffer)
      && !NILP (fn))
    lock_file (fn);
  return Qnil;
}

DEFUN ("unlock-buffer", Funlock_buffer, 0, 0, 0, /*
Unlock the file visited in the current buffer,
if it should normally be locked.
*/
       ())
{
  /* This function can GC */
  /* dmoore - and can destroy current_buffer and all sorts of other
     mean nasty things with pointy teeth.  If you call this make sure
     you protect things right. */

  if (BUF_SAVE_MODIFF (current_buffer) < BUF_MODIFF (current_buffer)
      && STRINGP (current_buffer->file_truename))
    unlock_file (current_buffer->file_truename);
  return Qnil;
}


/* Unlock the file visited in buffer BUFFER.  */

void
unlock_buffer (struct buffer *buffer)
{
  /* This function can GC */
  /* dmoore - and can destroy current_buffer and all sorts of other
     mean nasty things with pointy teeth.  If you call this make sure
     you protect things right. */
  if (BUF_SAVE_MODIFF (buffer) < BUF_MODIFF (buffer)
      && STRINGP (buffer->file_truename))
    unlock_file (buffer->file_truename);
}

DEFUN ("file-locked-p", Ffile_locked_p, 0, 1, 0, /*
Return nil if the FILENAME is not locked,
t if it is locked by you, else a string of the name of the locker.
*/
       (fn))
{
  /* This function can GC */
  REGISTER char *lfname;
  int owner;

  if (NILP (Vlock_directory) || NILP (Vsuperlock_file))
    return Qnil;
  CHECK_STRING (Vlock_directory);

  fn = Fexpand_file_name (fn, Qnil);

  MAKE_LOCK_NAME (lfname, fn);

  owner = current_lock_owner (lfname);
  if (owner <= 0)
    return Qnil;
  else if (owner == getpid ())
    return Qt;

  return lock_file_owner_name (lfname);
}

void
syms_of_filelock (void)
{
  /* This function can GC */
  DEFSUBR (Funlock_buffer);
  DEFSUBR (Flock_buffer);
  DEFSUBR (Ffile_locked_p);

  defsymbol (&Qask_user_about_supersession_threat,
             "ask-user-about-supersession-threat");
  defsymbol (&Qask_user_about_lock, "ask-user-about-lock");
}

void
vars_of_filelock (void)
{
  DEFVAR_LISP ("lock-directory", &Vlock_directory /*
Don't change this
*/ );
  Vlock_directory = Qnil;
  DEFVAR_LISP ("superlock-file", &Vsuperlock_file /*
Don't change this
*/ );
  Vsuperlock_file = Qnil;
}

void
complex_vars_of_filelock (void)
{
  DEFVAR_LISP ("configure-superlock-file", &Vconfigure_superlock_file /*
For internal use by the build procedure only.
configure's idea of what SUPERLOCK-FILE will be.
*/ );
#ifdef PATH_SUPERLOCK
  Vconfigure_superlock_file = build_string (PATH_SUPERLOCK);
#else
  Vconfigure_superlock_file = Qnil;
#endif
  /* All the rest done dynamically by startup.el */
}
