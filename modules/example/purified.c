#include <config.h>
#include "lisp.h"
#include "emacsfns.h"

DEFUN ("purifiedp", Fpurifiedp, 1, 1, 0, /*
*/
 (obj))
{
	return purified(obj) ? Qt : Qnil;
}

void
syms_of()
{
	DEFSUBR(Fpurifiedp);
}
