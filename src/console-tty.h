/* Define TTY specific console, device, and frame object for XEmacs.
   Copyright (C) 1995 Board of Trustees, University of Illinois.
   Copyright (C) 1996 Ben Wing.

This file is part of XEmacs.

XEmacs is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2, or (at your option) any
later version.

XEmacs is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with XEmacs; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

/* Synched up with: Not in FSF. */

/* Written by Chuck Thompson and Ben Wing. */

/* NOTE: Currently each TTY console can have only one device.
   Therefore, all stuff for both input and output is lumped into
   the console structure.  If it ever becomes meaningful to
   have more than one device on a TTY console, the output stuff
   will have to get separated out. */

#ifndef _XEMACS_CONSOLE_TTY_H_
#define _XEMACS_CONSOLE_TTY_H_

#include "console.h"
#include "syssignal.h" /* Always include before systty.h */
#include "systty.h"

DECLARE_CONSOLE_TYPE (tty);

struct tty_console
{
  int infd, outfd;
#ifdef HAVE_GPM
  int mouse_fd;
#endif
  Lisp_Object instream, outstream;
  Lisp_Object terminal_type;
  Lisp_Object controlling_process;
  char *term_entry_buffer;

  /* Physical location of cursor on this console. */
  int cursor_x;
  int cursor_y;

  /* The real location of the cursor.  The above physical location may
     be ahead of where we really are. */
  int real_cursor_x;
  int real_cursor_y;

  int final_cursor_x;
  int final_cursor_y;

  int height;
  int width;

  /* The count of frame number. */
  int frame_count;

  /* flags indicating presence, absence or value of various features */
  struct
  {
    unsigned int must_write_spaces :1; /* terminal inserts nulls, not
					  spaces to fill whitespace on
					  screen */
    unsigned int insert_mode_motion :1; /* cursor movement commands
					   work while in insert mode */
    unsigned int standout_motion :1;	/* cursor movement is graceful
					   in standout or underline mode */
    unsigned int memory_above_frame :1; /* display retained above screen */
    unsigned int memory_below_frame :1; /* display retained below screen */
    unsigned int meta_key :2;		/* 0 == mask off top bit;
					   1 == top bit is meta;
					   2 == top bit is useful as
					   character info */
    unsigned int flow_control :1;	/* Nonzero means use ^S/^Q as
					   cretinous flow control.  */
    int standout_width;		        /* # of spaces printed when
				           change to standout mode */
    int underline_width;		/* # of spaces printed when
					   change to underline mode */
  } flags;

  /* cursor motion entries - each entry is commented with the terminfo
     and the termcap entry */
  struct
  {
    /* local cursor movement */
    CONST char *up;			/* cuu1, up */
    CONST char *down;			/* cud1, do */
    CONST char *left;			/* cub1, le */
    CONST char *right;			/* cuf1, nd */
    CONST char *home;			/* home, ho */
    CONST char *low_left;		/* ll, ll */
    CONST char *car_return;		/* cr, cr */

    /* parameterized local cursor movement */
    CONST char *multi_up;		/* cuu, UP */
    CONST char *multi_down;		/* cud, DO */
    CONST char *multi_left;		/* cub, LE */
    CONST char *multi_right;		/* cuf, RI */

    /* absolute cursor motion */
    CONST char *abs;			/* cup, cm */
    CONST char *hor_abs;		/* hpa, ch */
    CONST char *ver_abs;		/* vpa, cv */

    /* scrolling */
    CONST char *scroll_forw;		/* ind, sf */
    CONST char *scroll_back;		/* ri, sr */
    CONST char *multi_scroll_forw;	/* indn, SF */
    CONST char *multi_scroll_back;	/* rin, SR */
    CONST char *set_scroll_region;	/* csr, cs */
  } cm;

  /* screen editing entries - each entry is commented with the
     terminfo and the termcap entry */
  struct
  {
    /* adding to the screen */
    CONST char *ins_line;		/* il1, al */
    CONST char *multi_ins_line;		/* il, AL */
    CONST char *repeat;			/* rep, rp */
    CONST char *begin_ins_mode;		/* smir, im */
    CONST char *end_ins_mode;		/* rmir, ei */
    CONST char *ins_char;		/* ich1, ic */
    CONST char *multi_ins_char;		/* ich, IC */
    CONST char *insert_pad;		/* ip, ip */

    /* deleting from the screen */
    CONST char *clr_frame;		/* clear, cl */
    CONST char *clr_from_cursor;	/* ed, cd */
    CONST char *clr_to_eol;		/* el, ce */
    CONST char *del_line;		/* dl1, dl */
    CONST char *multi_del_line;		/* dl, DL */
    CONST char *del_char;		/* dch1, dc */
    CONST char *multi_del_char;		/* dch, DC */
    CONST char *begin_del_mode;		/* smdc, dm */
    CONST char *end_del_mode;		/* rmdc, ed */
    CONST char *erase_at_cursor;	/* ech, ec */
  } se;

  /* screen display entries - each entry is commented with the
     terminfo and termcap entry */
  struct
  {
    CONST char *begin_standout;		/* smso, so */
    CONST char *end_standout;		/* rmso, se */
    CONST char *begin_underline;	/* smul, us */
    CONST char *end_underline;		/* rmul, ue */
    CONST char *begin_alternate;	/* smacs, as */
    CONST char *end_alternate;		/* rmacs, ae */

    CONST char *turn_on_reverse;	/* rev, mr */
    CONST char *turn_on_blinking;	/* blink, mb */
    CONST char *turn_on_bold;		/* bold, md */
    CONST char *turn_on_dim;		/* dim, mh */
    CONST char *turn_off_attributes;	/* sgr0, me */

    CONST char *visual_bell;		/* flash, vb */
    CONST char *audio_bell;		/* bel, bl */

    CONST char *cursor_visible;		/* cvvis, vs */
    CONST char *cursor_normal;		/* cnorm, ve */
    CONST char *init_motion;		/* smcup, ti */
    CONST char *end_motion;		/* rmcup, te */
    CONST char *keypad_on;		/* smkx, ks */
    CONST char *keypad_off;		/* rmkx, ke */

    CONST char *orig_pair;		/* op, op */
  } sd;

  /* costs of various operations */
  struct
  {
    int cm_up;
    int cm_down;
    int cm_left;
    int cm_right;
    int cm_home;
    int cm_low_left;
    int cm_car_return;
    int cm_abs;
    int cm_hor_abs;
    int cm_ver_abs;
  } cost;

  /* The initial tty mode bits */
  struct emacs_tty old_tty;

  /* Is this TTY our controlling terminal? */
  unsigned int controlling_terminal :1;
  unsigned int is_stdio :1;
};

#ifdef HAVE_GPM
#define CONSOLE_TTY_MOUSE_FD(c) (CONSOLE_TTY_DATA (c)->mouse_fd)
#endif
#define CONSOLE_TTY_DATA(c) CONSOLE_TYPE_DATA (c, tty)
#define CONSOLE_TTY_CURSOR_X(c) (CONSOLE_TTY_DATA (c)->cursor_x)
#define CONSOLE_TTY_CURSOR_Y(c) (CONSOLE_TTY_DATA (c)->cursor_y)
#define CONSOLE_TTY_REAL_CURSOR_X(c) (CONSOLE_TTY_DATA (c)->real_cursor_x)
#define CONSOLE_TTY_REAL_CURSOR_Y(c) (CONSOLE_TTY_DATA (c)->real_cursor_y)
#define CONSOLE_TTY_FINAL_CURSOR_X(c) (CONSOLE_TTY_DATA (c)->final_cursor_x)
#define CONSOLE_TTY_FINAL_CURSOR_Y(c) (CONSOLE_TTY_DATA (c)->final_cursor_y)

#define TTY_CM(c) (CONSOLE_TTY_DATA (c)->cm)
#define TTY_SE(c) (CONSOLE_TTY_DATA (c)->se)
#define TTY_SD(c) (CONSOLE_TTY_DATA (c)->sd)
#define TTY_FLAGS(c) (CONSOLE_TTY_DATA (c)->flags)
#define TTY_COST(c) (CONSOLE_TTY_DATA (c)->cost)

#define TTY_INC_CURSOR_X(c, n) do {					\
  int TICX_n = (n);							\
  assert (CONSOLE_TTY_CURSOR_X (c) == CONSOLE_TTY_REAL_CURSOR_X (c));	\
  CONSOLE_TTY_CURSOR_X (c) += TICX_n;					\
  CONSOLE_TTY_REAL_CURSOR_X (c) += TICX_n;				\
} while (0)

#define TTY_INC_CURSOR_Y(c, n) do {		\
  int TICY_n = (n);				\
  CONSOLE_TTY_CURSOR_Y (c) += TICY_n;		\
  CONSOLE_TTY_REAL_CURSOR_Y (c) += TICY_n;	\
} while (0)

struct tty_device
{
#ifdef HAVE_TERMIOS
  speed_t ospeed;		/* Output speed (from sg_ospeed) */
#else
  short ospeed;			/* Output speed (from sg_ospeed) */
#endif
};

#define DEVICE_TTY_DATA(d) DEVICE_TYPE_DATA (d, tty)

/* termcap requires this to be global */
#ifndef HAVE_TERMIOS
extern short ospeed;            /* Output speed (from sg_ospeed) */
#endif

extern FILE *termscript;

EXFUN (Fconsole_tty_controlling_process, 1);

/******************     Prototypes from cm.c     *******************/

/* #### Verify that all of these are still needed. */

void cm_cost_init (struct console *c);
void cmputc (int c);
void cmgoto (struct frame *f, int row, int col);
extern struct console *cmputc_console;
void send_string_to_tty_console (struct console *c, unsigned char *str,
				 int len);


/***************     Prototypes from redisplay-tty.c     ****************/

enum term_init_status
{
  TTY_UNABLE_OPEN_DATABASE,
  TTY_TYPE_UNDEFINED,
  TTY_TYPE_INSUFFICIENT,
  TTY_SIZE_UNSPECIFIED,
  TTY_INIT_SUCCESS
};

int init_tty_for_redisplay (struct device *d, char *terminal_type);
/* #### These should probably be methods. */
void set_tty_modes (struct console *c);
void reset_tty_modes (struct console *c);

/* Used in sysdep.c to properly clear and position the cursor when exiting. */
void tty_redisplay_shutdown (struct console *c);

/* called from console-stream.c */
Lisp_Object tty_semi_canonicalize_console_connection (Lisp_Object connection,
						      Error_behavior errb);
Lisp_Object tty_canonicalize_console_connection (Lisp_Object connection,
						 Error_behavior errb);
Lisp_Object tty_semi_canonicalize_device_connection (Lisp_Object connection,
						     Error_behavior errb);
Lisp_Object tty_canonicalize_device_connection (Lisp_Object connection,
						Error_behavior errb);
struct console * tty_find_console_from_fd (int fd);

#endif /* _XEMACS_CONSOLE_TTY_H_ */
