/*
 * sys/time.h doesn't exist on NT
 */

#include <time.h>

#ifdef __MINGW32__
#include <winsock.h>
#else
struct timeval 
  {
    long tv_sec;	/* seconds */
    long tv_usec;	/* microseconds */
  };
#endif

struct timezone 
  {
    int	tz_minuteswest;	/* minutes west of Greenwich */
    int	tz_dsttime;	/* type of dst correction */
  };

#ifndef HAVE_X_WINDOWS
/* X11R6 on NT provides the single parameter version of this command */
void gettimeofday (struct timeval *, struct timezone *);
#endif

/* end of sys/time.h */
