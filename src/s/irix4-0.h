/* Synched up with: FSF 19.31. */

#include "irix3-3.h"

#define USG5_3
#define IRIX4

#undef NEED_SIOCTL

/* use K&R C */
/* XEmacs change -- use ANSI, not K&R */
#ifndef __GNUC__
#define C_SWITCH_SYSTEM "-xansi"
#endif

/* SGI has all the fancy wait stuff, but we can't include sys/wait.h
   because it defines BIG_ENDIAN and LITTLE_ENDIAN (ugh!.)  Instead
   we'll just define WNOHANG right here.
   (An implicit decl is good enough for wait3.)  */
/* [XEmacs: Now that we don't use BIG_ENDIAN/LITTLE_ENDIAN, it's safe
   to include wait.h.  Should something change here?] */

#define WNOHANG		0x1

/* No need to use sprintf to get the tty name--we get that from _getpty.  */
#undef PTY_TTY_NAME_SPRINTF
#define PTY_TTY_NAME_SPRINTF
/* No need to get the pty name at all.  */
#define PTY_NAME_SPRINTF
/* We need only try once to open a pty.  */
#define PTY_ITERATION
/* Here is how to do it.  */
/* It is necessary to prevent SIGCHLD signals within _getpty.
   So we block them. */
#define PTY_OPEN						\
{								\
  char *name;							\
  struct stat stb;						\
  EMACS_BLOCK_SIGCHLD;						\
  name = _getpty (&fd, O_RDWR | O_NDELAY, 0600, 0);		\
  EMACS_UNBLOCK_SIGCHLD;					\
  if (name == 0)						\
    return -1;							\
  if (fd < 0)							\
    return -1;							\
  if (fstat (fd, &stb) < 0)					\
    return -1;							\
  strcpy (pty_name, name);					\
}

/* jpff@maths.bath.ac.uk reports `struct exception' is not defined
   on this system, so inhibit use of matherr.  */
#define NO_MATHERR
