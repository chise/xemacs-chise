#define AIX4

#include "aix3-2-5.h"

/* AIX 4 does not have HFT any more.  */
#undef AIXHFT

#ifndef NOT_C_CODE
#define _XFUNCS_H_ 1
/* Forward declarations for xlc warning suppressions */
struct ether_addr;
struct sockaddr_dl;
#endif
