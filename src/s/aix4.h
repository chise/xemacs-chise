#define AIX4

#include "aix3-2-5.h"

/* AIX 4 does not have HFT any more.  */
#undef AIXHFT

#ifndef NOT_C_CODE
#define _XFUNCS_H_ 1

/* AIX is happier when bzero and strcasecmp are declared */
#include "strings.h"

/* Forward declarations for xlc warning suppressions */
struct ether_addr;
struct sockaddr_dl;

#ifdef __xlC__			/* "eXceLlent C compiler" ?! */
#if __xlC__ >= 1200
/* IBM's C compiler miscompiles bytecount_to_charcount at high levels
   of optimization.  From IBM's docs:

   -qstrict turns off the following optimizations:

   Performing code motion and scheduling on computations such as loads
   and floating-point computations that may trigger an exception. */
#pragma option_override (bytecount_to_charcount, "opt(strict,yes)")
#endif /* recent IBM C compiler */
#endif /* IBM's C compiler */

#endif /* C code */

/* getaddrinfo is broken in AIX 4.3 as per IY04165.
   At this time (2/21/2000), there's no PTF available.
   -- Mike Sperber <mike@xemacs.org> */

#undef HAVE_GETADDRINFO
