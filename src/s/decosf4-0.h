/* Synched up with: Not in FSF. */

#include "decosf3-2.h"

#ifndef NOT_C_CODE
#include "/usr/include/sys/lc_core.h"
#include "/usr/include/reg_types.h"
#endif /* C code */

#define re_compile_pattern sys_re_compile_pattern
#define re_search sys_re_search
#define re_search_2 sys_re_search_2
#define re_match_2 sys_re_match_2
#define re_max_failures sys_re_max_failures
#define re_set_syntax sys_re_set_syntax
#define re_set_registers sys_re_set_registers
#define re_compile_fastmap sys_re_compile_fastmap
#define re_match sys_re_match
#define regcomp sys_regcomp
#define regexec sys_regexec
#define regerror sys_regerror
#define regfree sys_regfree
#define regex_t sys_regex_t
#define regoff_t sys_regoff_t
#define regmatch_t sys_regmatch_t

/* A perfectly ordinary link wins again - martin 
#undef C_SWITCH_SYSTEM
#undef LIBS_SYSTEM
#undef LIBS_DEBUG
#define ORDINARY_LINK */

/*#define SYSTEM_MALLOC*/

#if 0 /* martin */
/* Some V4.0* versions before V4.0B don't detect rename properly. */
#ifndef HAVE_RENAME
#define HAVE_RENAME
#endif

#define LIBS_DEBUG
#endif /* 0 */
