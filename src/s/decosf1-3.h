/* Synched up with: Not in FSF. */

#include "decosf1-2.h"
/* XEmacs change: Kim Nyberg <kny@tekla.fi> says this is needed. */
#ifdef emacs
#include <sys/stropts.h>
#endif

/* Supposedly gmalloc and rel_alloc will work now
   (grunwald@foobar.cs.colorado.edu) */
#undef SYSTEM_MALLOC
#undef NO_REMAP

#define _NO_MALLOC_WARNING_

#ifdef NOT_C_CODE

#undef LD_SWITCH_SYSTEM
#define LD_SWITCH_SYSTEM

#undef LD_SWITCH_SHARED
#define LD_SWITCH_SHARED "-shared"
#endif /* NOT_C_CODE */
