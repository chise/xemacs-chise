#ifndef _HAVE_GPM
#define _HAVE_GPM

int handle_gpm_read (struct Lisp_Event *event, struct console *con, int fd);
void connect_to_gpm (struct console *con);

#endif
