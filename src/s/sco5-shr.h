/* Synched up with: Not in FSF. */

#include "sco5.h"

/* XEmacs change. */
#undef LINKER
#undef C_OPTIMIZE_SWITCH
#undef C_DEBUG_SWITCH
#undef C_SWITCH_SYSTEM
#define C_SWITCH_SYSTEM "-D_NO_STATIC -D_SCO_ELF"

#ifndef __GNUC__
#define LINKER "cc -dy -Xc"
#define C_OPTIMIZE_SWITCH "-O3 -Xc -dy"
#define C_DEBUG_SWITCH "-g -Xc -dy"
#else
#define LINKER "gcc -melf -Xc"
#define C_OPTIMIZE_SWITCH "-O99 -m486 -fomit-frame-pointer -Xc -melf"
#define C_DEBUG_SWITCH "-g -Xc -melf"
#endif

