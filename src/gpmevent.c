/* William Perry 1997 */

#include <config.h>
#include "lisp.h"
#include "console.h"
#include "console-tty.h"
#include "device.h"
#include "events.h"
#include "events-mod.h"
#include "sysdep.h"

#ifdef HAVE_GPM
#include "gpmevent.h"
#include <gpm.h>

#if (!defined(__linux__))	/* possible under xterm */
#define KG_SHIFT	0
#define KG_CTRL		2
#define KG_ALT		3
#else
#include <linux/keyboard.h>
#endif

int
handle_gpm_read (struct Lisp_Event *event, struct console *con, int fd)
{
  Gpm_Event ev;
  int modifiers = 0;
  int type = -1;
  int button = 1;

  if (!Gpm_GetEvent(&ev))
    return 0;

  event->timestamp = 0;
  event->channel   = CONSOLE_SELECTED_FRAME (con);

  /* Whow, wouldn't named defines be NICE!?!?! */
  modifiers = 0;

  if (ev.modifiers & 1)   modifiers |= MOD_SHIFT;
  if (ev.modifiers & 2)   modifiers |= MOD_META;
  if (ev.modifiers & 4)   modifiers |= MOD_CONTROL;
  if (ev.modifiers & 8)   modifiers |= MOD_META;

  if (ev.type & GPM_DOWN)
    type = GPM_DOWN;
  else if (ev.type & GPM_UP)
    type = GPM_UP;
  else if (ev.type & GPM_MOVE) {
    type = GPM_MOVE;
    GPM_DRAWPOINTER(&ev);
  }

  if (ev.buttons & GPM_B_LEFT)
    button = 1;
  else if (ev.buttons & GPM_B_MIDDLE)
    button = 2;
  else if (ev.buttons & GPM_B_RIGHT)
    button = 3;

  switch (type) {
  case GPM_DOWN:
  case GPM_UP:
    event->event_type =
      type == GPM_DOWN ? button_press_event : button_release_event;
    event->event.button.x         = ev.x;
    event->event.button.y         = ev.y;
    event->event.button.button    = button;
    event->event.button.modifiers = modifiers;
    break;
  case GPM_MOVE:
    event->event_type             = pointer_motion_event;
    event->event.motion.x         = ev.x;
    event->event.motion.y         = ev.y;
    event->event.motion.modifiers = modifiers;
  default:
    return 0;
  }
  return 1;
}

void
connect_to_gpm (struct console *con)
{
  /* Only do this if we are running after dumping and really interactive */
  if (!noninteractive && initialized) {
    /* We really only want to do this on a TTY */
    CONSOLE_TTY_MOUSE_FD (con) = -1;
    if (EQ (CONSOLE_TYPE (con), Qtty)) {
      Gpm_Connect conn;
      int rval;

      conn.eventMask = GPM_DOWN|GPM_UP|GPM_MOVE;
      conn.defaultMask = GPM_MOVE;
      conn.minMod = 0;
      conn.maxMod = ((1<<KG_SHIFT)|(1<<KG_ALT)|(1<<KG_CTRL));

      rval = Gpm_Open (&conn, 0);
      switch (rval) {
      case -1: /* General failure */
	break;
      case -2: /* We are running under an XTerm */
	Gpm_Close();
	break;
      default:
	set_descriptor_non_blocking (gpm_fd);
	CONSOLE_TTY_MOUSE_FD (con) = gpm_fd;
      }
    }
  }
}

#endif
