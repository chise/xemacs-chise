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

/* Authorship:

   JWZ: long ago.
 */

/* Sun's standard and GCC's header files leave out prototypes for
   all sorts of functions. */

#ifndef INCLUDED_broken_sun_h_
#define INCLUDED_broken_sun_h_

#ifdef __GNUC__
#include <stdlib.h>
#include <stddef.h>

/*********************** stdlib functions *********************/

/* void *	memchr (CONST void *, int, size_t); */

/* int	memcmp (CONST void *, CONST void *, size_t); */
/* void *	memcpy (void *, CONST void *, size_t); */
/* void *	memmove (void *, CONST void *, size_t);*/
/* void *	memset (void *, int, int); */
/* char *	strcat (char *, CONST char *); */
/* char *	strchr (CONST char *, int); */
/* int	strcmp (CONST char *, CONST char *); */
int	strcasecmp (char *, char *);

/* Yes, they even left these functions out! */
int      tolower (int);
int      toupper (int);

/*********************** stdio functions *********************/

#include <stdio.h> /* else can't declare FILE */

/* FILE	*fopen (CONST char *, CONST char *); */
/* FILE	*freopen (CONST char *, CONST char *, FILE *); */
FILE	*tmpfile (void);
int	fclose (FILE *);
char	*fgets (char *, int, FILE *);
int      fgetc (FILE *);
int      fflush (FILE *);
int      fprintf (FILE *, CONST char *, ...);
int      fputc (char, FILE *);
int      fputs (CONST char *, FILE *);
size_t   fread (void *, size_t, size_t, FILE *);
int      fscanf (FILE *, CONST char *, ...);
int	fgetpos (FILE *, long *);
int      fseek (FILE *, long, int);
int	fsetpos (FILE *, CONST long *);
long     ftell (FILE *);
size_t   fwrite (CONST void *, size_t, size_t, FILE *);
char	*gets (char *);
int	pclose (FILE *);
void     perror (CONST char *);
int      printf (CONST char *, ...);
int      puts (CONST char *);
int      remove (CONST char *);
int      rename (CONST char *, CONST char *);
int      rewind (FILE *);
int	scanf (CONST char *, ...);
int	sscanf (CONST char *, CONST char *, ...);
void 	setbuf (FILE *, char *);
int 	setvbuf (FILE *, char *, int, size_t);
int	ungetc (int, FILE *);
int	vprintf (CONST char *, void *);
int	vfprintf (FILE *, CONST char *, void *);
char	*vsprintf (char *, CONST char *, void *);

/*********************** signal functions *********************/

int	sigblock (int);
#ifndef sigmask
int	sigmask (int);
#endif
int	sigsetmask (int);
int	sigpause (int);

/*********************** time functions ***********************/

struct timeval;
struct timezone;

int	utimes (CONST char *, struct timeval *);
void	tzset (void);
time_t	time (time_t *);
int	gettimeofday (struct timeval *, struct timezone *);

/*********************** file-system functions *********************/

struct stat;
#include </usr/include/sys/types.h>

int	fsync (int);
int	lstat (CONST char *, struct stat *);
int	fchmod (int, mode_t);
char	*mktemp (char *);
/* int	creat (CONST char *, mode_t); better no decl than a conflicting one... */
int	symlink (CONST char *, CONST char *);
int	readlink (CONST char *, char *, int);
void	sync (void);
int	select (int, fd_set *, fd_set *, fd_set *, struct timeval *);
char *	getwd (char *);
/* int	lseek (int, long, int); better no decl than a conflicting one... */
int	_filbuf ();
int	_flsbuf ();

/**************** interprocess communication functions ******************/

int	recv (int, char *, int, int);
int	socket (int, int, int);
struct sockaddr;
int	connect (int, struct sockaddr *, int);
int	bind (int, struct sockaddr *, int);
int	listen (int, int);
int	accept (int, struct sockaddr *, int *);
int	gethostname (char *, int);
struct rusage;
int	wait3 (void *, int, struct rusage *);
int	nice (int);
int	killpg (int, int);
int	system (char *);


/*********************** low-level OS functions *********************/

int	ioctl (int, int, ...);
struct nlist;
int	nlist (CONST char *, struct nlist *);
int	munmap (void *, int);
int	brk (void *);
void *	sbrk (int);
struct rlimit;
int	getrlimit (int, struct rlimit *);
int	getpagesize (void);
int	shutdown (int, int);
int	mprotect (void *, int, int);

/*********************** miscellaneous functions *********************/

void	tputs (CONST char *cp, int affcnt, void (*)(int));
long	random (void);
int	srandom (int seed);

#endif /* __GNUC__ */

#endif /* INCLUDED_broken_sun_h_ */
