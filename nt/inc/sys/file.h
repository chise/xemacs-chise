/*
 * sys\file.h doesn't exist on NT - only needed for these constants
 */

#define F_OK 0
#ifdef X_OK
#undef X_OK
#endif
#define X_OK 1
#define W_OK 2
#define R_OK 4
