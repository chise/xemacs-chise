/* The  mswindows event_stream interface.
   Copyright (C) 1991, 1992, 1993, 1994, 1995 Free Software Foundation, Inc.
   Copyright (C) 1995 Sun Microsystems, Inc.
   Copyright (C) 1996 Ben Wing.
   Copyright (C) 1997 Jonathan Harris.

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

/* Authorship:

   Ultimately based on FSF.
   Rewritten by Ben Wing.
   Rewritten for mswindows by Jonathan Harris, November 1997 for 21.0.
   Subprocess and modal loop support by Kirill M. Katsnelson.
 */

#include <config.h>
#include "lisp.h"

#include "console-msw.h"

#ifdef HAVE_SCROLLBARS
# include "scrollbar-msw.h"
#endif

#ifdef HAVE_MENUBARS
# include "menubar-msw.h"
#endif

#ifdef HAVE_DRAGNDROP
# include "dragdrop.h"
#endif

#include "device.h"
#include "events.h"
#include "frame.h"
#include "buffer.h"
#include "faces.h"
#include "lstream.h"
#include "process.h"
#include "redisplay.h"
#include "sysproc.h"
#include "syswait.h"
#include "systime.h"
#include "sysdep.h"
#include "objects-msw.h"

#include "events-mod.h"
#ifdef HAVE_MSG_SELECT
#include "sysfile.h"
#include "console-tty.h"
#elif defined(__CYGWIN32__)
typedef unsigned int SOCKET;
#endif
#include <io.h>
#include <errno.h>

#if defined (__CYGWIN32__) && !defined (CYGWIN_VERSION_DLL_MAJOR)
typedef NMHDR *LPNMHDR;
#endif

#ifdef HAVE_MENUBARS
#define ADJR_MENUFLAG TRUE
#else
#define ADJR_MENUFLAG FALSE
#endif

/* Fake key modifier which is attached to a quit char event.
   Removed upon dequeueing an event */
#define FAKE_MOD_QUIT	0x80

/* Timer ID used for button2 emulation */
#define BUTTON_2_TIMER_ID 1

extern Lisp_Object 
mswindows_get_toolbar_button_text (struct frame* f, int command_id);
extern Lisp_Object
mswindows_handle_toolbar_wm_command (struct frame* f, HWND ctrl, WORD id);
extern Lisp_Object
mswindows_handle_gui_wm_command (struct frame* f, HWND ctrl, WORD id);

static Lisp_Object mswindows_find_frame (HWND hwnd);
static Lisp_Object mswindows_find_console (HWND hwnd);
static Lisp_Object mswindows_key_to_emacs_keysym(int mswindows_key, int mods);
static int mswindows_modifier_state (BYTE* keymap, int has_AltGr);
static void mswindows_set_chord_timer (HWND hwnd);
static int mswindows_button2_near_enough (POINTS p1, POINTS p2);
static int mswindows_current_layout_has_AltGr (void);

static struct event_stream *mswindows_event_stream;

#ifdef HAVE_MSG_SELECT
extern SELECT_TYPE input_wait_mask, non_fake_input_wait_mask;
extern SELECT_TYPE process_only_mask, tty_only_mask;
SELECT_TYPE zero_mask;
extern int signal_event_pipe_initialized;
int windows_fd;
#endif

/*
 * Two separate queues, for efficiency, one (_u_) for user events, and
 * another (_s_) for non-user ones. We always return events out of the
 * first one until it is empty and only then proceed with the second
 * one.
 */
static Lisp_Object mswindows_u_dispatch_event_queue, mswindows_u_dispatch_event_queue_tail;
static Lisp_Object mswindows_s_dispatch_event_queue, mswindows_s_dispatch_event_queue_tail;

/* The number of things we can wait on */
#define MAX_WAITABLE (MAXIMUM_WAIT_OBJECTS - 1)

#ifndef HAVE_MSG_SELECT
/* List of mswindows waitable handles. */
static HANDLE mswindows_waitable_handles[MAX_WAITABLE];

/* Number of wait handles */
static int mswindows_waitable_count=0;
#endif /* HAVE_MSG_SELECT */
/* Brush for painting widgets */
static HBRUSH widget_brush = 0;
static LONG	last_widget_brushed = 0;

/* Count of quit chars currently in the queue */
/* Incremented in WM_[SYS]KEYDOWN handler in the mswindows_wnd_proc()
   Decremented in mswindows_dequeue_dispatch_event() */
int mswindows_quit_chars_count = 0;

/* These are Lisp integers; see DEFVARS in this file for description. */
int mswindows_dynamic_frame_resize;
int mswindows_num_mouse_buttons;
int mswindows_mouse_button_max_skew_x;
int mswindows_mouse_button_max_skew_y;
int mswindows_mouse_button_tolerance;

/* This is the event signaled by the event pump.
   See mswindows_pump_outstanding_events for comments */
static Lisp_Object mswindows_error_caught_in_modal_loop;
static int mswindows_in_modal_loop;

/* Count of wound timers */
static int mswindows_pending_timers_count;

/************************************************************************/
/*                Pipe instream - reads process output                  */
/************************************************************************/

#define PIPE_READ_DELAY 20

#define HANDLE_TO_USID(h) ((USID)(h))

#define NTPIPE_SLURP_STREAM_DATA(stream) \
  LSTREAM_TYPE_DATA (stream, ntpipe_slurp)

/* This structure is allocated by the main thread, and is deallocated
   in the thread upon exit.  There are situations when a thread
   remains blocked for a long time, much longer than the lstream
   exists. For example, "start notepad" command is issued from the
   shell, then the shell is closed by C-c C-d. Although the shell
   process exits, its output pipe will not get closed until the
   notepad process exits also, because it inherits the pipe form the
   shell. In this case, we abandon the thread, and let it live until
   all such processes exit. While struct ntpipe_slurp_stream is
   deallocated in this case, ntpipe_slurp_stream_shared_data are not. */

struct ntpipe_slurp_stream_shared_data
{
  HANDLE hev_thread;	/* Our thread blocks on this, signaled by caller */
			/* This is a manual-reset object. 		 */
  HANDLE hev_caller;	/* Caller blocks on this, and we signal it	 */
			/* This is a manual-reset object. 		 */
  HANDLE hev_unsleep;	/* Pipe read delay is canceled if this is set	 */
			/* This is a manual-reset object. 		 */
  HANDLE hpipe;		/* Pipe read end handle.			 */
  LONG   die_p;		/* Thread must exit ASAP if non-zero		 */
  BOOL   eof_p   : 1;	/* Set when thread saw EOF			 */
  BOOL   error_p : 1;   /* Read error other than EOF/broken pipe	 */
  BOOL	 inuse_p : 1;	/* this structure is in use			 */
  LONG   lock_count;    /* Client count of this struct, 0=safe to free   */
  BYTE   onebyte;	/* One byte buffer read by thread		 */
};

#define MAX_SLURP_STREAMS 32
struct ntpipe_slurp_stream_shared_data 
shared_data_block[MAX_SLURP_STREAMS]={{0}};

struct ntpipe_slurp_stream
{
  LPARAM user_data;	/* Any user data stored in the stream object	 */
  struct ntpipe_slurp_stream_shared_data* thread_data;
};

DEFINE_LSTREAM_IMPLEMENTATION ("ntpipe-input", lstream_ntpipe_slurp,
			       sizeof (struct ntpipe_slurp_stream));

/* This function is thread-safe, and is called from either thread
   context. It serializes freeing shared data structure */
static void
slurper_free_shared_data_maybe (struct ntpipe_slurp_stream_shared_data* s)
{
  if (InterlockedDecrement (&s->lock_count) == 0)
    {
      /* Destroy events */
      CloseHandle (s->hev_thread);
      CloseHandle (s->hev_caller);
      CloseHandle (s->hev_unsleep);
      s->inuse_p = 0;
    }
}

static struct ntpipe_slurp_stream_shared_data*
slurper_allocate_shared_data()
{
  int i=0;
  for (i=0; i<MAX_SLURP_STREAMS; i++)
    {
      if (!shared_data_block[i].inuse_p)
	{
	  shared_data_block[i].inuse_p=1;
	  return &shared_data_block[i];
	}
    }
  return (struct ntpipe_slurp_stream_shared_data*)0;
}

static DWORD WINAPI
slurp_thread (LPVOID vparam)
{
  struct ntpipe_slurp_stream_shared_data *s =
    (struct ntpipe_slurp_stream_shared_data*)vparam;

  for (;;)
    {
      /* Read one byte from the pipe */
      DWORD actually_read;
      if (!ReadFile (s->hpipe, &s->onebyte, 1, &actually_read, NULL))
	{
	  DWORD err = GetLastError ();
	  if (err == ERROR_BROKEN_PIPE || err == ERROR_NO_DATA)
	    s->eof_p = TRUE;
	  else
	    s->error_p = TRUE;
	}
      else if (actually_read == 0)
	s->eof_p = TRUE;

      /* We must terminate on an error or eof */
      if (s->eof_p || s->error_p)
	InterlockedIncrement (&s->die_p);

      /* Before we notify caller, we unsignal our event. */
      ResetEvent (s->hev_thread);

      /* Now we got something to notify caller, either a byte or an
	 error/eof indication. Before we do, allow internal pipe
	 buffer to accumulate little bit more data. 
	 Reader function pulses this event before waiting for
	 a character, to avoid pipe delay, and to get the byte
	 immediately. */
      if (!s->die_p)
	WaitForSingleObject (s->hev_unsleep, PIPE_READ_DELAY);

      /* Either make event loop generate a process event, or
	 inblock reader */
      SetEvent (s->hev_caller);

      /* Cleanup and exit if we're shot off */
      if (s->die_p)
	break;

      /* Block until the client finishes with retrieving the rest of
	 pipe data */
      WaitForSingleObject (s->hev_thread, INFINITE);
    }

  slurper_free_shared_data_maybe (s);

  return 0;
}

static Lisp_Object
make_ntpipe_input_stream (HANDLE hpipe, LPARAM param)
{
  Lisp_Object obj;
  Lstream *lstr = Lstream_new (lstream_ntpipe_slurp, "r");
  struct ntpipe_slurp_stream* s = NTPIPE_SLURP_STREAM_DATA (lstr);
  DWORD thread_id_unused;
  HANDLE hthread;

  /* We deal only with pipes, for we're using PeekNamedPipe api */
  assert (GetFileType (hpipe) == FILE_TYPE_PIPE);

  s->thread_data = slurper_allocate_shared_data();

  /* Create reader thread. This could fail, so do not create events
     until thread is created */
  hthread = CreateThread (NULL, 0, slurp_thread, (LPVOID)s->thread_data,
			  CREATE_SUSPENDED, &thread_id_unused);
  if (hthread == NULL)
    {
      Lstream_delete (lstr);
      s->thread_data->inuse_p=0;
      return Qnil;
    }

  /* Shared data are initially owned by both main and slurper
     threads. */
  s->thread_data->lock_count = 2;
  s->thread_data->die_p = 0;
  s->thread_data->eof_p = FALSE;
  s->thread_data->error_p = FALSE;
  s->thread_data->hpipe = hpipe;
  s->user_data = param;

  /* hev_thread is a manual-reset event, initially signaled */
  s->thread_data->hev_thread = CreateEvent (NULL, TRUE, TRUE, NULL);
  /* hev_caller is a manual-reset event, initially nonsignaled */
  s->thread_data->hev_caller = CreateEvent (NULL, TRUE, FALSE, NULL);
  /* hev_unsleep is a manual-reset event, initially nonsignaled */
  s->thread_data->hev_unsleep = CreateEvent (NULL, TRUE, FALSE, NULL);

  /* Now let it go */
  ResumeThread (hthread);
  CloseHandle (hthread);

  lstr->flags |= LSTREAM_FL_CLOSE_AT_DISKSAVE;
  XSETLSTREAM (obj, lstr);
  return obj;
}

static LPARAM
get_ntpipe_input_stream_param (Lstream *stream)
{
  struct ntpipe_slurp_stream* s = NTPIPE_SLURP_STREAM_DATA(stream);
  return s->user_data;
}

static HANDLE
get_ntpipe_input_stream_waitable (Lstream *stream)
{
  struct ntpipe_slurp_stream* s = NTPIPE_SLURP_STREAM_DATA(stream);
  return s->thread_data->hev_caller;
}

static int 
ntpipe_slurp_reader (Lstream *stream, unsigned char *data, size_t size)
{
  /* This function must be called from the main thread only */
  struct ntpipe_slurp_stream_shared_data* s = 
    NTPIPE_SLURP_STREAM_DATA(stream)->thread_data;

  if (!s->die_p)
    {
      DWORD wait_result;
      /* Disallow pipe read delay for the thread: we need a character
         ASAP */
      SetEvent (s->hev_unsleep);
  
      /* Check if we have a character ready. Give it a short delay,
	 for the thread to awake from pipe delay, just ion case*/
      wait_result = WaitForSingleObject (s->hev_caller, 2);

      /* Revert to the normal sleep behavior. */
      ResetEvent (s->hev_unsleep);

      /* If there's no byte buffered yet, give up */
      if (wait_result == WAIT_TIMEOUT)
	{
	  errno = EAGAIN;
	  return -1;
	}
    }

  /* Reset caller unlock event now, as we've handled the pending
     process output event */
  ResetEvent (s->hev_caller);

  /* It is now safe to do anything with contents of S, except for
     changing s->die_p, which still should be interlocked */

  if (s->eof_p)
    return 0;
  if (s->error_p || s->die_p)
    return -1;

  /* Ok, there were no error neither eof - we've got a byte from the
     pipe */
  *(data++) = s->onebyte;
  --size;

  {
    DWORD bytes_read = 0;
    if (size > 0)
      {
	DWORD bytes_available;

	/* If the api call fails, return at least one byte already
	   read.  ReadFile in thread will return error */
	if (PeekNamedPipe (s->hpipe, NULL, 0, NULL, &bytes_available, NULL))
	  {

	    /* Fetch available bytes. The same consideration applies,
	       so do not check for errors. ReadFile in the thread will
	       fail if the next call fails. */
	    if (bytes_available)
	      ReadFile (s->hpipe, data, min (bytes_available, size),
			&bytes_read, NULL);
	  }
      
	/* Now we can unblock thread, so it attempts to read more */
	SetEvent (s->hev_thread);
	return bytes_read + 1;
      }
  }
  return 0;
}

static int 
ntpipe_slurp_closer (Lstream *stream)
{
  /* This function must be called from the main thread only */
  struct ntpipe_slurp_stream_shared_data* s = 
    NTPIPE_SLURP_STREAM_DATA(stream)->thread_data;

  /* Force thread to stop */
  InterlockedIncrement (&s->die_p);

  /* Set events which could possibly block slurper. Let it finish soon
     or later. */
  SetEvent (s->hev_unsleep);
  SetEvent (s->hev_thread);

  /* Unlock and maybe free shared data */
  slurper_free_shared_data_maybe (s);

  return 0;
}

static void
init_slurp_stream (void)
{
  LSTREAM_HAS_METHOD (ntpipe_slurp, reader);
  LSTREAM_HAS_METHOD (ntpipe_slurp, closer);
}

/************************************************************************/
/*                Pipe outstream - writes process input                 */
/************************************************************************/

#define NTPIPE_SHOVE_STREAM_DATA(stream) \
  LSTREAM_TYPE_DATA (stream, ntpipe_shove)

#define MAX_SHOVE_BUFFER_SIZE 128
     
struct ntpipe_shove_stream
{
  LPARAM user_data;	/* Any user data stored in the stream object	 */
  HANDLE hev_thread;	/* Our thread blocks on this, signaled by caller */
			/* This is an auto-reset object. 		 */
  HANDLE hpipe;		/* Pipe write end handle.			 */
  HANDLE hthread;	/* Reader thread handle.			 */
  char	 buffer[MAX_SHOVE_BUFFER_SIZE];	/* Buffer being written		 */
  DWORD  size;		/* Number of bytes to write			 */
  LONG   die_p;		/* Thread must exit ASAP if non-zero		 */
  LONG   idle_p;	/* Non-zero if thread is waiting for job	 */
  BOOL   error_p : 1;   /* Read error other than EOF/broken pipe	 */
  BOOL   blocking_p : 1;/* Last write attempt would cause blocking	 */
};

DEFINE_LSTREAM_IMPLEMENTATION ("ntpipe-output", lstream_ntpipe_shove,
			       sizeof (struct ntpipe_shove_stream));

#ifndef HAVE_MSG_SELECT
static DWORD WINAPI
shove_thread (LPVOID vparam)
{
  struct ntpipe_shove_stream *s = (struct ntpipe_shove_stream*) vparam;

  for (;;)
    {
      DWORD bytes_written; 

      /* Block on event and wait for a job */
      InterlockedIncrement (&s->idle_p);
      WaitForSingleObject (s->hev_thread, INFINITE);

      if (s->die_p)
	break;

      /* Write passed buffer */
      if (!WriteFile (s->hpipe, s->buffer, s->size, &bytes_written, NULL)
	  || bytes_written != s->size)
	{
	  s->error_p = TRUE;
	  InterlockedIncrement (&s->die_p);
	}

      if (s->die_p)
	break;
    }

  return 0;
}

static Lisp_Object
make_ntpipe_output_stream (HANDLE hpipe, LPARAM param)
{
  Lisp_Object obj;
  Lstream *lstr = Lstream_new (lstream_ntpipe_shove, "w");
  struct ntpipe_shove_stream* s = NTPIPE_SHOVE_STREAM_DATA (lstr);
  DWORD thread_id_unused;

  s->die_p = 0;
  s->error_p = FALSE;
  s->hpipe = hpipe;
  s->user_data = param;

  /* Create reader thread. This could fail, so do not 
     create the event until thread is created */
  s->hthread = CreateThread (NULL, 0, shove_thread, (LPVOID)s,
			     CREATE_SUSPENDED, &thread_id_unused);
  if (s->hthread == NULL)
    {
      Lstream_delete (lstr);
      return Qnil;
    }

  /* hev_thread is an auto-reset event, initially nonsignaled */
  s->hev_thread = CreateEvent (NULL, FALSE, FALSE, NULL);

  /* Now let it go */
  ResumeThread (s->hthread);

  lstr->flags |= LSTREAM_FL_CLOSE_AT_DISKSAVE;
  XSETLSTREAM (obj, lstr);
  return obj;
}

static LPARAM
get_ntpipe_output_stream_param (Lstream *stream)
{
  struct ntpipe_shove_stream* s = NTPIPE_SHOVE_STREAM_DATA(stream);
  return s->user_data;
}
#endif

static int
ntpipe_shove_writer (Lstream *stream, const unsigned char *data, size_t size)
{
  struct ntpipe_shove_stream* s = NTPIPE_SHOVE_STREAM_DATA(stream);

  if (s->error_p)
    return -1;

  s->blocking_p = !s->idle_p;
  if (s->blocking_p)
    return 0;

  if (size>MAX_SHOVE_BUFFER_SIZE)
    return 0;

  memcpy (s->buffer, data, size);
  s->size = size;

  /* Start output */
  InterlockedDecrement (&s->idle_p);
  SetEvent (s->hev_thread);
  return size;
}

static int
ntpipe_shove_was_blocked_p (Lstream *stream)
{
  struct ntpipe_shove_stream* s = NTPIPE_SHOVE_STREAM_DATA(stream);
  return s->blocking_p;
}

static int
ntpipe_shove_closer (Lstream *stream)
{
  struct ntpipe_shove_stream* s = NTPIPE_SHOVE_STREAM_DATA(stream);

  /* Force thread stop */
  InterlockedIncrement (&s->die_p);

  /* Close pipe handle, possibly breaking it */
  CloseHandle (s->hpipe);

  /* Thread will end upon unblocking */
  SetEvent (s->hev_thread);

  /* Wait while thread terminates */
  WaitForSingleObject (s->hthread, INFINITE);
  CloseHandle (s->hthread);

  /* Destroy the event */
  CloseHandle (s->hev_thread);

  return 0;
}

static void
init_shove_stream (void)
{
  LSTREAM_HAS_METHOD (ntpipe_shove, writer);
  LSTREAM_HAS_METHOD (ntpipe_shove, was_blocked_p);
  LSTREAM_HAS_METHOD (ntpipe_shove, closer);
}

/************************************************************************/
/*                         Winsock I/O stream                           */
/************************************************************************/
#if defined (HAVE_SOCKETS) && !defined(HAVE_MSG_SELECT)

#define WINSOCK_READ_BUFFER_SIZE 1024

struct winsock_stream
{
  LPARAM user_data;		/* Any user data stored in the stream object */
  SOCKET s;			/* Socket handle (which is a Win32 handle)   */
  OVERLAPPED ov;		/* Overlapped I/O structure		     */
  void* buffer;			/* Buffer. Allocated for input stream only   */
  unsigned int bufsize;		/* Number of bytes last read		     */
  unsigned int bufpos;		/* Position in buffer for next fetch	     */
  unsigned int error_p :1;	/* I/O Error seen			     */
  unsigned int eof_p :1;	/* EOF Error seen			     */
  unsigned int pending_p :1;	/* There is a pending I/O operation	     */
  unsigned int blocking_p :1;	/* Last write attempt would block	     */
};

#define WINSOCK_STREAM_DATA(stream) LSTREAM_TYPE_DATA (stream, winsock)

DEFINE_LSTREAM_IMPLEMENTATION ("winsock", lstream_winsock,
			       sizeof (struct winsock_stream));

static void
winsock_initiate_read (struct winsock_stream *str)
{
  ResetEvent (str->ov.hEvent);
  str->bufpos = 0;

  if (!ReadFile ((HANDLE)str->s, str->buffer, WINSOCK_READ_BUFFER_SIZE,
		 &str->bufsize, &str->ov))
    {
      if (GetLastError () == ERROR_IO_PENDING)
	str->pending_p = 1;
      else if (GetLastError () == ERROR_HANDLE_EOF)
	str->eof_p = 1;
      else
	str->error_p = 1;
    }
  else if (str->bufsize == 0)
    str->eof_p = 1;
}

static int
winsock_reader (Lstream *stream, unsigned char *data, size_t size)
{
  struct winsock_stream *str = WINSOCK_STREAM_DATA (stream);

  /* If the current operation is not yet complete, there's nothing to
     give back */
  if (str->pending_p)
    {
      if (WaitForSingleObject (str->ov.hEvent, 0) == WAIT_TIMEOUT)
	{
	  errno = EAGAIN;
	  return -1;
	}
      else
	{
	  if (!GetOverlappedResult ((HANDLE)str->s, &str->ov, &str->bufsize, TRUE))
	    {
	      if (GetLastError() == ERROR_HANDLE_EOF)
		str->bufsize = 0;
	      else
		str->error_p = 1;
	    }
	  if (str->bufsize == 0)
	    str->eof_p = 1;
	  str->pending_p = 0;
	}
    }

  if (str->eof_p)
    return 0;
  if (str->error_p)
    return -1;
  
  /* Return as much of buffer as we have */
  size = min (size, (size_t) (str->bufsize - str->bufpos));
  memcpy (data, (void*)((BYTE*)str->buffer + str->bufpos), size);
  str->bufpos += size;

  /* Read more if buffer is exhausted */
  if (str->bufsize == str->bufpos)
    winsock_initiate_read (str);

  return size;
}

static int
winsock_writer (Lstream *stream, CONST unsigned char *data, size_t size)
{
  struct winsock_stream *str = WINSOCK_STREAM_DATA (stream);

  if (str->pending_p)
    {
      if (WaitForSingleObject (str->ov.hEvent, 0) == WAIT_TIMEOUT)
	{
	  str->blocking_p = 1;
	  return -1;
	}
      else
	{
	  DWORD dw_unused;
	  if (!GetOverlappedResult ((HANDLE)str->s, &str->ov, &dw_unused, TRUE))
	    str->error_p = 1;
	  str->pending_p = 0;
	}
    }

  str->blocking_p = 0;

  if (str->error_p)
    return -1;

  if (size == 0)
    return 0;
  
  {
    ResetEvent (str->ov.hEvent);

    /* Docs indicate that 4th parameter to WriteFile can be NULL since this is
     * an overlapped operation. This fails on Win95 with winsock 1.x so we
     * supply a spare address which is ignored by Win95 anyway. Sheesh. */
    if (WriteFile ((HANDLE)str->s, data, size, (LPDWORD)&str->buffer, &str->ov)
	|| GetLastError() == ERROR_IO_PENDING)
      str->pending_p = 1;
    else
      str->error_p = 1;
  }

  return str->error_p ? -1 : size;
}

static int
winsock_closer (Lstream *lstr)
{
  struct winsock_stream *str = WINSOCK_STREAM_DATA (lstr);

  if (lstr->flags & LSTREAM_FL_READ)
    shutdown (str->s, 0);
  else
    shutdown (str->s, 1);

  CloseHandle ((HANDLE)str->s);
  if (str->pending_p)
    WaitForSingleObject (str->ov.hEvent, INFINITE);

  if (lstr->flags & LSTREAM_FL_READ)
    xfree (str->buffer);

  CloseHandle (str->ov.hEvent);
  return 0;
}

static int
winsock_was_blocked_p (Lstream *stream)
{
  struct winsock_stream *str = WINSOCK_STREAM_DATA (stream);
  return str->blocking_p;
}

static Lisp_Object
make_winsock_stream_1 (SOCKET s, LPARAM param, CONST char *mode)
{
  Lisp_Object obj;
  Lstream *lstr = Lstream_new (lstream_winsock, mode);
  struct winsock_stream *str = WINSOCK_STREAM_DATA (lstr);

  str->s = s;
  str->blocking_p = 0;
  str->error_p = 0;
  str->eof_p = 0;
  str->pending_p = 0;
  str->user_data = param;

  xzero (str->ov);
  str->ov.hEvent = CreateEvent (NULL, TRUE, FALSE, NULL);

  if (lstr->flags & LSTREAM_FL_READ)
    {
      str->buffer = xmalloc (WINSOCK_READ_BUFFER_SIZE);
      winsock_initiate_read (str);
    }

  lstr->flags |= LSTREAM_FL_CLOSE_AT_DISKSAVE;
  XSETLSTREAM (obj, lstr);
  return obj;
}

static Lisp_Object
make_winsock_input_stream (SOCKET s, LPARAM param)
{
  return make_winsock_stream_1 (s, param, "r");
}

static Lisp_Object
make_winsock_output_stream (SOCKET s, LPARAM param)
{
  return make_winsock_stream_1 (s, param, "w");
}

static HANDLE
get_winsock_stream_waitable (Lstream *lstr)
{
  struct winsock_stream *str = WINSOCK_STREAM_DATA (lstr);
  return str->ov.hEvent;
}

static LPARAM
get_winsock_stream_param (Lstream *lstr)
{
  struct winsock_stream *str = WINSOCK_STREAM_DATA (lstr);
  return str->user_data;
}

static void
init_winsock_stream (void)
{
  LSTREAM_HAS_METHOD (winsock, reader);
  LSTREAM_HAS_METHOD (winsock, writer);
  LSTREAM_HAS_METHOD (winsock, closer);
  LSTREAM_HAS_METHOD (winsock, was_blocked_p);
}
#endif /* defined (HAVE_SOCKETS) */

/************************************************************************/
/*                     Dispatch queue management                        */
/************************************************************************/

static int
mswindows_user_event_p (struct Lisp_Event* sevt)
{
  return (sevt->event_type == key_press_event
	  || sevt->event_type == button_press_event
	  || sevt->event_type == button_release_event
	  || sevt->event_type == misc_user_event);
}

/* 
 * Add an emacs event to the proper dispatch queue
 */
static void
mswindows_enqueue_dispatch_event (Lisp_Object event)
{
  int user_p = mswindows_user_event_p (XEVENT(event));
  enqueue_event (event,
		 user_p ? &mswindows_u_dispatch_event_queue : 
		 	&mswindows_s_dispatch_event_queue,
		 user_p ? &mswindows_u_dispatch_event_queue_tail :
		 	&mswindows_s_dispatch_event_queue_tail);

  /* Avoid blocking on WaitMessage */
  PostMessage (NULL, XM_BUMPQUEUE, 0, 0);
}

/*
 * Add a misc-user event to the dispatch queue.
 *
 * Stuff it into our own dispatch queue, so we have something
 * to return from next_event callback.
 */
void
mswindows_enqueue_misc_user_event (Lisp_Object channel, Lisp_Object function,
				   Lisp_Object object)
{
  Lisp_Object event = Fmake_event (Qnil, Qnil);
  struct Lisp_Event* e = XEVENT (event);

  e->event_type = misc_user_event;
  e->channel = channel;
  e->event.misc.function = function;
  e->event.misc.object = object;

  mswindows_enqueue_dispatch_event (event);
}

void
mswindows_enqueue_magic_event (HWND hwnd, UINT message)
{
  Lisp_Object emacs_event = Fmake_event (Qnil, Qnil);
  struct Lisp_Event* event = XEVENT (emacs_event);

  event->channel = hwnd ? mswindows_find_frame (hwnd) : Qnil;
  event->timestamp = GetMessageTime();
  event->event_type = magic_event;
  EVENT_MSWINDOWS_MAGIC_TYPE (event) = message;

  mswindows_enqueue_dispatch_event (emacs_event);
}

static void
mswindows_enqueue_process_event (struct Lisp_Process* p)
{
  Lisp_Object emacs_event = Fmake_event (Qnil, Qnil);
  struct Lisp_Event* event = XEVENT (emacs_event);
  Lisp_Object process;
  XSETPROCESS (process, p);

  event->event_type = process_event;
  event->timestamp  = GetTickCount ();
  event->event.process.process = process;

  mswindows_enqueue_dispatch_event (emacs_event);
}

static void
mswindows_enqueue_mouse_button_event (HWND hwnd, UINT message, POINTS where, DWORD when)
{

  /* We always use last message time, because mouse button
     events may get delayed, and XEmacs double click
     recognition will fail */

  Lisp_Object emacs_event = Fmake_event (Qnil, Qnil);
  struct Lisp_Event* event = XEVENT(emacs_event);

  event->channel = mswindows_find_frame(hwnd);
  event->timestamp = when;
  event->event.button.button =
    (message==WM_LBUTTONDOWN || message==WM_LBUTTONUP) ? 1 :
    ((message==WM_RBUTTONDOWN || message==WM_RBUTTONUP) ? 3 : 2);
  event->event.button.x = where.x;
  event->event.button.y = where.y;
  event->event.button.modifiers = mswindows_modifier_state (NULL, 0);
      
  if (message==WM_LBUTTONDOWN || message==WM_MBUTTONDOWN ||
      message==WM_RBUTTONDOWN)
    {
      event->event_type = button_press_event;
      SetCapture (hwnd);
      /* we need this to make sure the main window regains the focus
         from control subwindows */
      if (GetFocus() != hwnd)
	{
	  SetFocus (hwnd);
	  mswindows_enqueue_magic_event (hwnd, WM_SETFOCUS);
	}
    }
  else
    {
      event->event_type = button_release_event;
      ReleaseCapture ();
    }
  
  mswindows_enqueue_dispatch_event (emacs_event);
}

static void
mswindows_enqueue_keypress_event (HWND hwnd, Lisp_Object keysym, int mods)
{
  Lisp_Object emacs_event = Fmake_event (Qnil, Qnil);
  struct Lisp_Event* event = XEVENT(emacs_event);

  event->channel = mswindows_find_console(hwnd);
  event->timestamp = GetMessageTime();
  event->event_type = key_press_event;
  event->event.key.keysym = keysym;
  event->event.key.modifiers = mods;
  mswindows_enqueue_dispatch_event (emacs_event);
}

/*
 * Remove and return the first emacs event on the dispatch queue.
 * Give a preference to user events over non-user ones.
 */
static Lisp_Object
mswindows_dequeue_dispatch_event ()
{
  Lisp_Object event;
  struct Lisp_Event* sevt;

  assert (!NILP(mswindows_u_dispatch_event_queue) ||
	  !NILP(mswindows_s_dispatch_event_queue));

  event = dequeue_event (
		 NILP(mswindows_u_dispatch_event_queue) ? 
			 &mswindows_s_dispatch_event_queue : 
			 &mswindows_u_dispatch_event_queue,
		 NILP(mswindows_u_dispatch_event_queue) ? 
			 &mswindows_s_dispatch_event_queue_tail :
			 &mswindows_u_dispatch_event_queue_tail);

  sevt = XEVENT(event);
  if (sevt->event_type == key_press_event
      && (sevt->event.key.modifiers & FAKE_MOD_QUIT))
    {
      sevt->event.key.modifiers &= ~FAKE_MOD_QUIT;
      --mswindows_quit_chars_count;
    }

  return event;
}

/*
 * Remove and return the first emacs event on the dispatch queue that matches
 * the supplied event.
 * Timeout event matches if interval_id is equal to that of the given event.
 * Keypress event matches if logical AND between modifiers bitmask of the
 * event in the queue and that of the given event is non-zero.
 * For all other event types, this function aborts.
 */

Lisp_Object
mswindows_cancel_dispatch_event (struct Lisp_Event *match)
{
  Lisp_Object event;
  Lisp_Object previous_event = Qnil;
  int user_p = mswindows_user_event_p (match);
  Lisp_Object* head = user_p ? &mswindows_u_dispatch_event_queue : 
    			       &mswindows_s_dispatch_event_queue;
  Lisp_Object* tail = user_p ? &mswindows_u_dispatch_event_queue_tail : 
    			       &mswindows_s_dispatch_event_queue_tail;

  assert (match->event_type == timeout_event
	  || match->event_type == key_press_event);

  EVENT_CHAIN_LOOP (event, *head)
    {
      struct Lisp_Event *e = XEVENT (event);
      if ((e->event_type == match->event_type) &&
	  ((e->event_type == timeout_event) ?
	   (e->event.timeout.interval_id == match->event.timeout.interval_id) :
	   /* Must be key_press_event */
	   ((e->event.key.modifiers & match->event.key.modifiers) != 0)))
	{
	  if (NILP (previous_event))
	    dequeue_event (head, tail);
	  else
	    {
	      XSET_EVENT_NEXT (previous_event, XEVENT_NEXT (event));
	      if (EQ (*tail, event))
		*tail = previous_event;
	    }
	  
	  return event;
	}
      previous_event = event;
    }
  return Qnil;
}

#ifndef HAVE_MSG_SELECT
/************************************************************************/
/*                     Waitable handles manipulation                    */
/************************************************************************/
static int
find_waitable_handle (HANDLE h)
{
  int i;
  for (i = 0; i < mswindows_waitable_count; ++i)
    if (mswindows_waitable_handles[i] == h)
      return i;

  return -1;
}

static BOOL
add_waitable_handle (HANDLE h)
{
  assert (find_waitable_handle (h) < 0);
  if (mswindows_waitable_count == MAX_WAITABLE)
    return FALSE;

  mswindows_waitable_handles [mswindows_waitable_count++] = h;
  return TRUE;
}

static void
remove_waitable_handle (HANDLE h)
{
  int ix = find_waitable_handle (h);
  if (ix < 0)
    return;

  mswindows_waitable_handles [ix] = 
    mswindows_waitable_handles [--mswindows_waitable_count];
}
#endif /* HAVE_MSG_SELECT */


/************************************************************************/
/*                             Event pump                               */
/************************************************************************/

static Lisp_Object
mswindows_modal_loop_error_handler (Lisp_Object cons_sig_data,
				    Lisp_Object u_n_u_s_e_d)
{
  mswindows_error_caught_in_modal_loop = cons_sig_data;
  return Qunbound;
}

Lisp_Object
mswindows_protect_modal_loop (Lisp_Object (*bfun) (Lisp_Object barg),
			      Lisp_Object barg)
{
  Lisp_Object tmp;

  ++mswindows_in_modal_loop; 
  tmp = condition_case_1 (Qt,
			  bfun, barg,
			  mswindows_modal_loop_error_handler, Qnil);
  --mswindows_in_modal_loop;

  return tmp;
}

void
mswindows_unmodalize_signal_maybe (void)
{
  if (!NILP (mswindows_error_caught_in_modal_loop))
    {
      /* Got an error while messages were pumped while
	 in window procedure - have to resignal */
      Lisp_Object sym = XCAR (mswindows_error_caught_in_modal_loop);
      Lisp_Object data = XCDR (mswindows_error_caught_in_modal_loop);
      mswindows_error_caught_in_modal_loop = Qnil;
      Fsignal (sym, data);
    }
}

/*
 * This is an unsafe part of event pump, guarded by 
 * condition_case. See mswindows_pump_outstanding_events
 */
static Lisp_Object
mswindows_unsafe_pump_events (Lisp_Object u_n_u_s_e_d)
{
  /* This function can call lisp */
  Lisp_Object event = Fmake_event (Qnil, Qnil);
  struct gcpro gcpro1;
  int do_redisplay = 0;
  GCPRO1 (event);

  while (detect_input_pending ())
    {
      Fnext_event (event, Qnil);
      Fdispatch_event (event);
      do_redisplay = 1;
    }

  if (do_redisplay)
    redisplay ();

  Fdeallocate_event (event);
  UNGCPRO;
  
  /* Qt becomes return value of mswindows_pump_outstanding_events
     once we get here */
  return Qt;
}

/*
 * This function pumps emacs events, while available, by using
 * next_message/dispatch_message loop. Errors are trapped around
 * the loop so the function always returns.
 *
 * Windows message queue is not looked into during the call,
 * neither are waitable handles checked. The function pumps
 * thus only dispatch events already queued, as well as those
 * resulted in dispatching thereof. This is done by setting
 * module local variable mswindows_in_modal_loop to nonzero.
 *
 * Return value is Qt if no errors was trapped, or Qunbound if
 * there was an error.
 *
 * In case of error, a cons representing the error, in the
 * form (SIGNAL . DATA), is stored in the module local variable
 * mswindows_error_caught_in_modal_loop. This error is signaled
 * again when DispatchMessage returns. Thus, Windows internal
 * modal loops are protected against throws, which are proven
 * to corrupt internal Windows structures.
 *
 * In case of success, mswindows_error_caught_in_modal_loop is
 * assigned Qnil.
 *
 * If the value of mswindows_error_caught_in_modal_loop is not
 * nil already upon entry, the function just returns non-nil.
 * This situation means that a new event has been queued while
 * in cancel mode. The event will be dequeued on the next regular
 * call of next-event; the pump is off since error is caught.
 * The caller must *unconditionally* cancel modal loop if the
 * value returned by this function is nil. Otherwise, everything
 * will become frozen until the modal loop exits under normal
 * condition (scrollbar drag is released, menu closed etc.)
 */
Lisp_Object
mswindows_pump_outstanding_events (void)
{
  /* This function can call lisp */

  Lisp_Object result = Qt;
  struct gcpro gcpro1;
  GCPRO1 (result);
  
  if (NILP(mswindows_error_caught_in_modal_loop))
      result = mswindows_protect_modal_loop (mswindows_unsafe_pump_events, Qnil);
  UNGCPRO;
  return result;
}

static void 
mswindows_drain_windows_queue ()
{
  MSG msg;
  while (PeekMessage (&msg, NULL, 0, 0, PM_REMOVE))
    {
      /* we have to translate messages that are not sent to the main
         window. this is so that key presses work ok in things like
         edit fields. however, we *musn't* translate message for the
         main window as this is handled in the wnd proc. */
      if ( GetWindowLong (msg.hwnd, GWL_STYLE) & WS_CHILD )
	{
	  TranslateMessage (&msg);
	}
      DispatchMessage (&msg);
      mswindows_unmodalize_signal_maybe ();
    }
}

/* 
 * This is a special flavor of the mswindows_need_event function,
 * used while in event pump. Actually, there is only kind of events
 * allowed while in event pump: a timer.  An attempt to fetch any
 * other event leads to a deadlock, as there's no source of user input
 * ('cause event pump mirrors windows modal loop, which is a sole
 * owner of thread message queue).
 *
 * To detect this, we use a counter of active timers, and allow
 * fetching WM_TIMER messages. Instead of trying to fetch a WM_TIMER
 * which will never come when there are no pending timers, which leads
 * to deadlock, we simply signal an error.
 */
static void
mswindows_need_event_in_modal_loop (int badly_p)
{
  MSG msg;

  /* Check if already have one */
  if (!NILP (mswindows_u_dispatch_event_queue)
      || !NILP (mswindows_s_dispatch_event_queue))
    return;

  /* No event is ok */
  if (!badly_p)
    return;

  /* We do not check the _u_ queue, because timers go to _s_ */
  while (NILP (mswindows_s_dispatch_event_queue))
    {
      /* We'll deadlock if go waiting */
      if (mswindows_pending_timers_count == 0)
	error ("Deadlock due to an attempt to call next-event in a wrong context");
      
      /* Fetch and dispatch any pending timers */
      GetMessage (&msg, NULL, WM_TIMER, WM_TIMER);
      DispatchMessage (&msg);
    }
}

/*
 * This drains the event queue and fills up two internal queues until
 * an event of a type specified by USER_P is retrieved.
 *
 *
 * Used by emacs_mswindows_event_pending_p and emacs_mswindows_next_event
 */
static void
mswindows_need_event (int badly_p)
{
  int active;

  if (mswindows_in_modal_loop)
    {
      mswindows_need_event_in_modal_loop (badly_p);
      return;
    }

  /* Have to drain Windows message queue first, otherwise, we may miss
     quit char when called from quit_p */
  mswindows_drain_windows_queue ();

  while (NILP (mswindows_u_dispatch_event_queue)
	 && NILP (mswindows_s_dispatch_event_queue))
    {
#ifdef HAVE_MSG_SELECT
      int i;
      SELECT_TYPE temp_mask = input_wait_mask;
      EMACS_TIME sometime;
      EMACS_SELECT_TIME select_time_to_block, *pointer_to_this;
      
      if (badly_p)
 	pointer_to_this = 0;
      else
	{
	  EMACS_SET_SECS_USECS (sometime, 0, 0);
	  EMACS_TIME_TO_SELECT_TIME (sometime, select_time_to_block);
	  pointer_to_this = &select_time_to_block;
	}

      active = select (MAXDESC, &temp_mask, 0, 0, pointer_to_this);
      
      if (active == 0)
	{
	  assert (!badly_p);
	  return;		/* timeout */
	}
      else if (active > 0)
	{
	  if (FD_ISSET (windows_fd, &temp_mask))
	    {
	      mswindows_drain_windows_queue ();
	    }
#ifdef HAVE_TTY	  
	  /* Look for a TTY event */
	  for (i = 0; i < MAXDESC-1; i++)
	    {
	      /* To avoid race conditions (among other things, an infinite
		 loop when called from Fdiscard_input()), we must return
		 user events ahead of process events. */
	      if (FD_ISSET (i, &temp_mask) && FD_ISSET (i, &tty_only_mask))
		{
		  struct console *c = tty_find_console_from_fd (i);
		  Lisp_Object emacs_event = Fmake_event (Qnil, Qnil);
		  struct Lisp_Event* event = XEVENT (emacs_event);
		  
		  assert (c);
		  if (read_event_from_tty_or_stream_desc (event, c, i))
		    {
		      mswindows_enqueue_dispatch_event (emacs_event);
		      return;
		    }
		}
	    }
#endif
	  /* Look for a process event */
	  for (i = 0; i < MAXDESC-1; i++)
	    {
	      if (FD_ISSET (i, &temp_mask))
		{
		  if (FD_ISSET (i, &process_only_mask))
		    {
		      struct Lisp_Process *p =
			get_process_from_usid (FD_TO_USID(i));
		      
		      mswindows_enqueue_process_event (p);
		    }
		  else
		    {
		      /* We might get here when a fake event came
                         through a signal. Return a dummy event, so
                         that a cycle of the command loop will
                         occur. */
		      drain_signal_event_pipe ();
		      mswindows_enqueue_magic_event (NULL, XM_BUMPQUEUE);
		    }
		}
	    }
	}
      else if (active==-1)
	{
	  if (errno != EINTR)
	    {
	      /* something bad happened */
	      assert(0);
	    }
	}
      else
	{
	  assert(0);
	}
#else
      /* Now try getting a message or process event */
    active = MsgWaitForMultipleObjects (mswindows_waitable_count,
					mswindows_waitable_handles,
					FALSE, badly_p ? INFINITE : 0,
					QS_ALLINPUT);

    /* This will assert if handle being waited for becomes abandoned.
       Not the case currently tho */
    assert ((!badly_p && active == WAIT_TIMEOUT) ||
	    (active >= WAIT_OBJECT_0 &&
	     active <= WAIT_OBJECT_0 + mswindows_waitable_count));
    
    if (active == WAIT_TIMEOUT)
      {
	/* No luck trying - just return what we've already got */
	return;
      }
    else if (active == WAIT_OBJECT_0 + mswindows_waitable_count)
      {
	/* Got your message, thanks */
	mswindows_drain_windows_queue ();
      }
    else
      {
	int ix = active - WAIT_OBJECT_0;
	/* First, try to find which process' output has signaled */
	struct Lisp_Process *p = 
	  get_process_from_usid (HANDLE_TO_USID (mswindows_waitable_handles[ix]));
	if (p != NULL)
	  {
	    /* Found a signaled process input handle */
	    mswindows_enqueue_process_event (p);
	  }
	else
	  {
	    /* None. This means that the process handle itself has signaled.
	       Remove the handle from the wait vector, and make status_notify
	       note the exited process */
	    mswindows_waitable_handles [ix] =
	      mswindows_waitable_handles [--mswindows_waitable_count];
	    kick_status_notify ();
	    /* Have to return something: there may be no accompanying
	       process event */
	    mswindows_enqueue_magic_event (NULL, XM_BUMPQUEUE);
	  }
      }
#endif
  } /* while */
}

/************************************************************************/
/*                           Event generators                           */
/************************************************************************/

/* 
 * Callback procedure for synchronous timer messages
 */
static void CALLBACK
mswindows_wm_timer_callback (HWND hwnd, UINT umsg, UINT id_timer, DWORD dwtime)
{
  Lisp_Object emacs_event = Fmake_event (Qnil, Qnil);
  struct Lisp_Event *event = XEVENT (emacs_event);

  if (KillTimer (NULL, id_timer))
    --mswindows_pending_timers_count;

  event->channel = Qnil;
  event->timestamp = dwtime;
  event->event_type = timeout_event;
  event->event.timeout.interval_id = id_timer;
  event->event.timeout.function = Qnil;
  event->event.timeout.object = Qnil;

  mswindows_enqueue_dispatch_event (emacs_event);
}

/* 
 * Callback procedure for dde messages
 *
 * We execute a dde Open("file") by simulating a file drop, so dde support
 * depends on dnd support.
 */
#ifdef HAVE_DRAGNDROP
HDDEDATA CALLBACK
mswindows_dde_callback (UINT uType, UINT uFmt, HCONV hconv,
			HSZ hszTopic, HSZ hszItem, HDDEDATA hdata,
			DWORD dwData1, DWORD dwData2)
{ 
  switch (uType)
    { 
    case XTYP_CONNECT:
      if (!DdeCmpStringHandles (hszTopic, mswindows_dde_topic_system))
	return (HDDEDATA)TRUE;
      return (HDDEDATA)FALSE;

    case XTYP_WILDCONNECT:
      {
	/* We only support one {service,topic} pair */
	HSZPAIR pairs[2] = {
	  { mswindows_dde_service, mswindows_dde_topic_system }, { 0, 0 } };

	if (!(hszItem  || DdeCmpStringHandles (hszItem, mswindows_dde_service)) &&
	    !(hszTopic || DdeCmpStringHandles (hszTopic, mswindows_dde_topic_system)));
	  return (DdeCreateDataHandle (mswindows_dde_mlid, (LPBYTE)pairs,
				       sizeof (pairs), 0L, 0, uFmt, 0));
      }
      return (HDDEDATA)NULL; 

    case XTYP_EXECUTE:
      if (!DdeCmpStringHandles (hszTopic, mswindows_dde_topic_system))
	{
	  DWORD len = DdeGetData (hdata, NULL, 0, 0);
	  char *cmd = alloca (len+1);
	  char *end;
	  char *filename;
	  struct gcpro gcpro1, gcpro2;
          Lisp_Object l_dndlist = Qnil;
	  Lisp_Object emacs_event = Fmake_event (Qnil, Qnil);
	  Lisp_Object frmcons, devcons, concons;
	  struct Lisp_Event *event = XEVENT (emacs_event);

	  DdeGetData (hdata, cmd, len, 0);
	  cmd[len] = '\0';
	  DdeFreeDataHandle (hdata);

	  /* Check syntax & that it's an [Open("foo")] command, which we
	   * treat like a file drop */
	  /* #### Ought to be generalised and accept some other commands */
	  if (*cmd == '[')
	    cmd++;
	  if (strnicmp (cmd, MSWINDOWS_DDE_ITEM_OPEN,
			strlen (MSWINDOWS_DDE_ITEM_OPEN)))
	    return DDE_FNOTPROCESSED;
	  cmd += strlen (MSWINDOWS_DDE_ITEM_OPEN);
	  while (*cmd==' ')
	    cmd++;
	  if (*cmd!='(' || *(cmd+1)!='\"')
	    return DDE_FNOTPROCESSED;
	  end = (cmd+=2);
	  while (*end && *end!='\"')
	    end++;
	  if (!*end)
	    return DDE_FNOTPROCESSED;
	  *end = '\0';
	  if (*(++end)!=')')
	    return DDE_FNOTPROCESSED;
	  if (*(++end)==']')
	    end++;
	  if (*end)
	    return DDE_FNOTPROCESSED;

#ifdef __CYGWIN32__
	  filename = alloca (cygwin32_win32_to_posix_path_list_buf_size (cmd) + 5);
	  strcpy (filename, "file:");
	  cygwin32_win32_to_posix_path_list (cmd, filename+5);
#else
	  dostounix_filename (cmd);
	  filename = alloca (strlen (cmd)+6);
	  strcpy (filename, "file:");
	  strcat (filename, cmd);
#endif
	  GCPRO2 (emacs_event, l_dndlist);
	  l_dndlist = make_string (filename, strlen (filename));

	  /* Find a mswindows frame */
	  event->channel = Qnil;
	  FRAME_LOOP_NO_BREAK (frmcons, devcons, concons)
	    {
	      Lisp_Object frame = XCAR (frmcons);
	      if (FRAME_TYPE_P (XFRAME (frame), mswindows))
		event->channel = frame;
	    };
	  assert (!NILP (event->channel));

	  event->timestamp = GetTickCount();
	  event->event_type = misc_user_event;
	  event->event.misc.button = 1;
	  event->event.misc.modifiers = 0;
	  event->event.misc.x = -1;
	  event->event.misc.y = -1;
	  event->event.misc.function = Qdragdrop_drop_dispatch;
	  event->event.misc.object = Fcons (Qdragdrop_URL,
					    Fcons (l_dndlist, Qnil));
	  mswindows_enqueue_dispatch_event (emacs_event);
	  UNGCPRO;
	  return (HDDEDATA) DDE_FACK;
	}
      DdeFreeDataHandle (hdata); 
      return (HDDEDATA) DDE_FNOTPROCESSED;

    default: 
      return (HDDEDATA) NULL; 
    } 
}
#endif

/*
 * The windows procedure for the window class XEMACS_CLASS
 */
LRESULT WINAPI
mswindows_wnd_proc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
  /* Note: Remember to initialize emacs_event and event before use.
     This code calls code that can GC. You must GCPRO before calling such code. */
  Lisp_Object emacs_event = Qnil;
  Lisp_Object fobj = Qnil;

  struct Lisp_Event *event;
  struct frame *frame;
  struct mswindows_frame* msframe;

  switch (message)
  {
  case WM_ERASEBKGND:
    /* Erase background only during non-dynamic sizing */
    msframe  = FRAME_MSWINDOWS_DATA (XFRAME (mswindows_find_frame (hwnd)));
    if (msframe->sizing && !mswindows_dynamic_frame_resize)
      goto defproc;
    return 1;

  case WM_CLOSE:
    fobj = mswindows_find_frame (hwnd);
    mswindows_enqueue_misc_user_event (fobj, Qeval, list3 (Qdelete_frame, fobj, Qt));
    break;

  case WM_KEYUP:
  case WM_SYSKEYUP:
    /* See Win95 comment under WM_KEYDOWN */
    {
      BYTE keymap[256];

      if (wParam == VK_CONTROL)
        {
	  GetKeyboardState (keymap);
	  keymap [(lParam & 0x1000000) ? VK_RCONTROL : VK_LCONTROL] &= ~0x80;
	  SetKeyboardState (keymap);
	}
      else if (wParam == VK_MENU)
	{
	  GetKeyboardState (keymap);
	  keymap [(lParam & 0x1000000) ? VK_RMENU : VK_LMENU] &= ~0x80;
	  SetKeyboardState (keymap);
	}
    };
    goto defproc;

  case WM_KEYDOWN:
  case WM_SYSKEYDOWN:
    /* In some locales the right-hand Alt key is labelled AltGr. This key
     * should produce alternative charcaters when combined with another key.
     * eg on a German keyboard pressing AltGr+q should produce '@'.
     * AltGr generates exactly the same keystrokes as LCtrl+RAlt. But if
     * TranslateMessage() is called with *any* combination of Ctrl+Alt down,
     * it translates as if AltGr were down.
     * We get round this by removing all modifiers from the keymap before
     * calling TranslateMessage() unless AltGr is *really* down. */
    {
      BYTE keymap[256];
      int has_AltGr = mswindows_current_layout_has_AltGr ();
      int mods;
      Lisp_Object keysym;

      GetKeyboardState (keymap);
      mods = mswindows_modifier_state (keymap, has_AltGr);

      /* Handle those keys for which TranslateMessage won't generate a WM_CHAR */
      if (!NILP (keysym = mswindows_key_to_emacs_keysym(wParam, mods)))
	mswindows_enqueue_keypress_event (hwnd, keysym, mods);
      else
	{
	  int quit_ch = CONSOLE_QUIT_CHAR (XCONSOLE (mswindows_find_console (hwnd)));
	  BYTE keymap_orig[256];
	  POINT pnt = { LOWORD (GetMessagePos()), HIWORD (GetMessagePos()) };
	  MSG msg;
	  
	  msg.hwnd = hwnd;
	  msg.message = message;
	  msg.wParam = wParam;
	  msg.lParam = lParam;
	  msg.time = GetMessageTime();
	  msg.pt = pnt;

	  /* GetKeyboardState() does not work as documented on Win95. We have
	   * to loosely track Left and Right modifiers on behalf of the OS,
	   * without screwing up Windows NT which tracks them properly. */
	  if (wParam == VK_CONTROL)
	    keymap [(lParam & 0x1000000) ? VK_RCONTROL : VK_LCONTROL] |= 0x80;
	  else if (wParam == VK_MENU)
	    keymap [(lParam & 0x1000000) ? VK_RMENU : VK_LMENU] |= 0x80;

	  memcpy (keymap_orig, keymap, 256);

	  /* Remove shift modifier from an ascii character */
	  mods &= ~MOD_SHIFT;

	  /* Clear control and alt modifiers unless AltGr is pressed */
	  keymap [VK_RCONTROL] = 0;
	  keymap [VK_LMENU] = 0;
	  if (!has_AltGr || !(keymap [VK_LCONTROL] & 0x80) || !(keymap [VK_RMENU] & 0x80))
	    {
	      keymap [VK_LCONTROL] = 0;
	      keymap [VK_CONTROL] = 0;
	      keymap [VK_RMENU] = 0;
	      keymap [VK_MENU] = 0;
	    }
	  SetKeyboardState (keymap);

	  /* Maybe generate some WM_[SYS]CHARs in the queue */
	  TranslateMessage (&msg);

	  while (PeekMessage (&msg, hwnd, WM_CHAR, WM_CHAR, PM_REMOVE)
		 || PeekMessage (&msg, hwnd, WM_SYSCHAR, WM_SYSCHAR, PM_REMOVE))
	    {
	      int mods1 = mods;
	      WPARAM ch = msg.wParam;

	      /* If a quit char with no modifiers other than control and
		 shift, then mark it with a fake modifier, which is removed
		 upon dequeueing the event */
	      /* #### This might also not withstand localization, if
		 quit character is not a latin-1 symbol */
	      if (((quit_ch < ' ' && (mods & MOD_CONTROL) && quit_ch + 'a' - 1 == ch)
		   || (quit_ch >= ' ' && !(mods & MOD_CONTROL) && quit_ch == ch))
		  && ((mods  & ~(MOD_CONTROL | MOD_SHIFT)) == 0))
		{
		  mods1 |= FAKE_MOD_QUIT;
		  ++mswindows_quit_chars_count;
		}

	      mswindows_enqueue_keypress_event (hwnd, make_char(ch), mods1);
	    } /* while */
	  SetKeyboardState (keymap_orig);
	} /* else */
    }
    /* F10 causes menu activation by default. We do not want this */
    if (wParam != VK_F10)
      goto defproc;
    break;

  case WM_MBUTTONDOWN:
  case WM_MBUTTONUP:
    /* Real middle mouse button has nothing to do with emulated one:
       if one wants to exercise fingers playing chords on the mouse,
       he is allowed to do that! */
    mswindows_enqueue_mouse_button_event (hwnd, message,
					  MAKEPOINTS (lParam), GetMessageTime());
    break;
    
  case WM_LBUTTONUP:
    msframe  = FRAME_MSWINDOWS_DATA (XFRAME (mswindows_find_frame (hwnd)));
    msframe->last_click_time =  GetMessageTime();

    KillTimer (hwnd, BUTTON_2_TIMER_ID);
    msframe->button2_need_lbutton = 0;
    if (msframe->ignore_next_lbutton_up)
      {
	msframe->ignore_next_lbutton_up = 0;
      }
    else if (msframe->button2_is_down)
      {
	msframe->button2_is_down = 0;
	msframe->ignore_next_rbutton_up = 1;
	mswindows_enqueue_mouse_button_event (hwnd, WM_MBUTTONUP,
					      MAKEPOINTS (lParam), GetMessageTime());
      }
    else
      {
	if (msframe->button2_need_rbutton)
	  {
	    msframe->button2_need_rbutton = 0;
	    mswindows_enqueue_mouse_button_event (hwnd, WM_LBUTTONDOWN,
						  MAKEPOINTS (lParam), GetMessageTime());
	  }
	mswindows_enqueue_mouse_button_event (hwnd, WM_LBUTTONUP,
					      MAKEPOINTS (lParam), GetMessageTime());
      }
    break;

  case WM_RBUTTONUP:
    msframe  = FRAME_MSWINDOWS_DATA (XFRAME (mswindows_find_frame (hwnd)));
    msframe->last_click_time =  GetMessageTime();

    KillTimer (hwnd, BUTTON_2_TIMER_ID);
    msframe->button2_need_rbutton = 0;
    if (msframe->ignore_next_rbutton_up)
      {
	msframe->ignore_next_rbutton_up = 0;
      }
    else if (msframe->button2_is_down)
      {
	msframe->button2_is_down = 0;
	msframe->ignore_next_lbutton_up = 1;
	mswindows_enqueue_mouse_button_event (hwnd, WM_MBUTTONUP,
					      MAKEPOINTS (lParam), GetMessageTime());
      }
    else
      {
	if (msframe->button2_need_lbutton)
	  {
	    msframe->button2_need_lbutton = 0;
	    mswindows_enqueue_mouse_button_event (hwnd, WM_RBUTTONDOWN,
						  MAKEPOINTS (lParam), GetMessageTime());
	  }
	mswindows_enqueue_mouse_button_event (hwnd, WM_RBUTTONUP,
					      MAKEPOINTS (lParam), GetMessageTime());
      }
    break;

  case WM_LBUTTONDOWN:
    msframe  = FRAME_MSWINDOWS_DATA (XFRAME (mswindows_find_frame (hwnd)));

    if (msframe->button2_need_lbutton)
      {
	KillTimer (hwnd, BUTTON_2_TIMER_ID);
	msframe->button2_need_lbutton = 0;
	msframe->button2_need_rbutton = 0;
	if (mswindows_button2_near_enough (msframe->last_click_point, MAKEPOINTS (lParam)))
	  {
	    mswindows_enqueue_mouse_button_event (hwnd, WM_MBUTTONDOWN,
						  MAKEPOINTS (lParam), GetMessageTime());
	    msframe->button2_is_down = 1;
	  }
	else
	  {
	    mswindows_enqueue_mouse_button_event (hwnd, WM_RBUTTONDOWN,
			msframe->last_click_point, msframe->last_click_time);
	    mswindows_enqueue_mouse_button_event (hwnd, WM_LBUTTONDOWN,
						  MAKEPOINTS (lParam), GetMessageTime());
	  }
      }
    else
      {
	mswindows_set_chord_timer (hwnd);
	msframe->button2_need_rbutton = 1;
	msframe->last_click_point = MAKEPOINTS (lParam);
      }
    msframe->last_click_time =  GetMessageTime();
    break;

  case WM_RBUTTONDOWN:
    msframe  = FRAME_MSWINDOWS_DATA (XFRAME (mswindows_find_frame (hwnd)));

    if (msframe->button2_need_rbutton)
      {
	KillTimer (hwnd, BUTTON_2_TIMER_ID);
	msframe->button2_need_lbutton = 0;
	msframe->button2_need_rbutton = 0;
	if (mswindows_button2_near_enough (msframe->last_click_point, MAKEPOINTS (lParam)))
	  {
	    mswindows_enqueue_mouse_button_event (hwnd, WM_MBUTTONDOWN,
						  MAKEPOINTS (lParam), GetMessageTime());
	    msframe->button2_is_down = 1;
	  }
	else
	  {
	    mswindows_enqueue_mouse_button_event (hwnd, WM_LBUTTONDOWN,
				msframe->last_click_point, msframe->last_click_time);
	    mswindows_enqueue_mouse_button_event (hwnd, WM_RBUTTONDOWN,
						  MAKEPOINTS (lParam), GetMessageTime());
	  }
      }
    else
      {
	mswindows_set_chord_timer (hwnd);
	msframe->button2_need_lbutton = 1;
	msframe->last_click_point = MAKEPOINTS (lParam);
      }
    msframe->last_click_time =  GetMessageTime();
    break;
	
  case WM_TIMER:
    if (wParam == BUTTON_2_TIMER_ID)
      {
	msframe  = FRAME_MSWINDOWS_DATA (XFRAME (mswindows_find_frame (hwnd)));
	KillTimer (hwnd, BUTTON_2_TIMER_ID);

	if (msframe->button2_need_lbutton)
	  {
	    msframe->button2_need_lbutton = 0;
	    mswindows_enqueue_mouse_button_event (hwnd, WM_RBUTTONDOWN,
				msframe->last_click_point, msframe->last_click_time);
	  }
	else if (msframe->button2_need_rbutton)
	  {
	    msframe->button2_need_rbutton = 0;
	    mswindows_enqueue_mouse_button_event (hwnd, WM_LBUTTONDOWN,
				msframe->last_click_point, msframe->last_click_time);
	  }
      }
    else
      assert ("Spurious timer fired" == 0);
    break;

  case WM_MOUSEMOVE:
    /* Optimization: don't report mouse movement while size is changing */
    msframe  = FRAME_MSWINDOWS_DATA (XFRAME (mswindows_find_frame (hwnd)));
    if (!msframe->sizing)
    {
      /* When waiting for the second mouse button to finish
	 button2 emulation, and have moved too far, just pretend
	 as if timer has expired. This improves drag-select feedback */
      if ((msframe->button2_need_lbutton || msframe->button2_need_rbutton)
	  && !mswindows_button2_near_enough (msframe->last_click_point,
					     MAKEPOINTS (lParam)))
	{
	  KillTimer (hwnd, BUTTON_2_TIMER_ID);
	  SendMessage (hwnd, WM_TIMER, BUTTON_2_TIMER_ID, 0);
	}

      emacs_event = Fmake_event (Qnil, Qnil);
      event = XEVENT(emacs_event);

      event->channel = mswindows_find_frame(hwnd);
      event->timestamp = GetMessageTime();
      event->event_type = pointer_motion_event;
      event->event.motion.x = MAKEPOINTS(lParam).x;
      event->event.motion.y = MAKEPOINTS(lParam).y;
      event->event.motion.modifiers = mswindows_modifier_state (NULL, 0);
      
      mswindows_enqueue_dispatch_event (emacs_event);
    }
    break;

  case WM_CANCELMODE:
    ReleaseCapture ();
    /* Queue a `cancel-mode-internal' misc user event, so mouse
       selection would be canceled if any */
    mswindows_enqueue_misc_user_event (mswindows_find_frame (hwnd),
				       Qcancel_mode_internal, Qnil);
    break;

  case WM_NOTIFY:
    {
      LPNMHDR nmhdr = (LPNMHDR)lParam;

      if (nmhdr->code ==  TTN_NEEDTEXT)
	{
#ifdef HAVE_TOOLBARS
	  LPTOOLTIPTEXT tttext = (LPTOOLTIPTEXT)lParam;
	  Lisp_Object btext;

	  /* find out which toolbar */
	  frame = XFRAME (mswindows_find_frame (hwnd));
	  btext = mswindows_get_toolbar_button_text ( frame, 
						      nmhdr->idFrom );
	  
	  tttext->lpszText = NULL;
	  tttext->hinst = NULL;

	  if (!NILP(btext))
	    {
	      /* I think this is safe since the text will only go away
                 when the toolbar does...*/
	      GET_C_STRING_EXT_DATA_ALLOCA (btext, FORMAT_OS, 
					    tttext->lpszText);
	    }
#endif
	}
      /* handle tree view callbacks */
      else if (nmhdr->code == TVN_SELCHANGED)
	{
	  NM_TREEVIEW* ptree = (NM_TREEVIEW*)lParam;
	  frame = XFRAME (mswindows_find_frame (hwnd));
	  mswindows_handle_gui_wm_command (frame, 0, ptree->itemNew.lParam);
	}
      /* handle tab control callbacks */
      else if (nmhdr->code == TCN_SELCHANGE)
	{
	  TC_ITEM item;
	  int index = SendMessage (nmhdr->hwndFrom, TCM_GETCURSEL, 0, 0);
	  frame = XFRAME (mswindows_find_frame (hwnd));
	  SendMessage (nmhdr->hwndFrom, TCM_GETITEM, (WPARAM)index,
		       (LPARAM)&item);
	  
	  mswindows_handle_gui_wm_command (frame, 0, item.lParam);
	}
    }
    break;
    
  case WM_PAINT:
    {
      PAINTSTRUCT paintStruct;
      
      frame = XFRAME (mswindows_find_frame (hwnd));

      BeginPaint (hwnd, &paintStruct);
      mswindows_redraw_exposed_area (frame,
			paintStruct.rcPaint.left, paintStruct.rcPaint.top,
			paintStruct.rcPaint.right, paintStruct.rcPaint.bottom);
      EndPaint (hwnd, &paintStruct);
    }
    break;

  case WM_SIZE:
    /* We only care about this message if our size has really changed */
    if (wParam==SIZE_RESTORED || wParam==SIZE_MAXIMIZED || wParam==SIZE_MINIMIZED)
    {
      RECT rect;
      int columns, rows;

      fobj = mswindows_find_frame (hwnd);
      frame = XFRAME (fobj);
      msframe  = FRAME_MSWINDOWS_DATA (frame);

      /* We cannot handle frame map and unmap hooks right in
	 this routine, because these may throw. We queue
	 magic events to run these hooks instead - kkm */

      if (wParam==SIZE_MINIMIZED)
	{
	  /* Iconified */
	  FRAME_VISIBLE_P (frame) = 0;
	  mswindows_enqueue_magic_event (hwnd, XM_UNMAPFRAME);
	}
      else
	{
	  GetClientRect(hwnd, &rect);
	  FRAME_PIXWIDTH(frame) = rect.right;
	  FRAME_PIXHEIGHT(frame) = rect.bottom;

	  pixel_to_real_char_size (frame, rect.right, rect.bottom,
				   &FRAME_MSWINDOWS_CHARWIDTH (frame),
				   &FRAME_MSWINDOWS_CHARHEIGHT (frame));

	  pixel_to_char_size (frame, rect.right, rect.bottom, &columns, &rows);
	  change_frame_size (frame, rows, columns, 1);

	  /* If we are inside frame creation, we have to apply geometric
	     properties now. */
	  if (FRAME_MSWINDOWS_TARGET_RECT (frame))
	    {
	      /* Yes, we have to size again */
	      mswindows_size_frame_internal ( frame, 
					      FRAME_MSWINDOWS_TARGET_RECT 
					      (frame));
	      /* Reset so we do not get here again. The SetWindowPos call in
	       * mswindows_size_frame_internal can cause recursion here. */
	      if (FRAME_MSWINDOWS_TARGET_RECT (frame))
		{
		  xfree (FRAME_MSWINDOWS_TARGET_RECT (frame));
		  FRAME_MSWINDOWS_TARGET_RECT (frame) = 0;
		}
	    }
	  else
	    {
	      if (!msframe->sizing && !FRAME_VISIBLE_P (frame))
		mswindows_enqueue_magic_event (hwnd, XM_MAPFRAME);
	      FRAME_VISIBLE_P (frame) = 1;
	      
	      if (!msframe->sizing || mswindows_dynamic_frame_resize)
		redisplay ();
	    }
	}
    }
    break;

  /* Misc magic events which only require that the frame be identified */
  case WM_SETFOCUS:
  case WM_KILLFOCUS:
    mswindows_enqueue_magic_event (hwnd, message);
    break;

  case WM_WINDOWPOSCHANGING:
    {
      WINDOWPOS *wp = (LPWINDOWPOS) lParam;
      WINDOWPLACEMENT wpl = { sizeof(WINDOWPLACEMENT) };
      GetWindowPlacement(hwnd, &wpl);

      /* Only interested if size is changing and we're not being iconified */
      if (wpl.showCmd != SW_SHOWMINIMIZED
	  && wpl.showCmd != SW_SHOWMAXIMIZED
	  && !(wp->flags & SWP_NOSIZE))
      {
	RECT ncsize = { 0, 0, 0, 0 };
	int pixwidth, pixheight;
 	AdjustWindowRectEx (&ncsize, GetWindowLong (hwnd, GWL_STYLE),
 			    GetMenu(hwnd) != NULL,
			    GetWindowLong (hwnd, GWL_EXSTYLE));

	round_size_to_real_char (XFRAME (mswindows_find_frame (hwnd)),
				 wp->cx - (ncsize.right - ncsize.left),
				 wp->cy - (ncsize.bottom - ncsize.top),
				 &pixwidth, &pixheight);

	/* Convert client sizes to window sizes */
	pixwidth += (ncsize.right - ncsize.left);
	pixheight += (ncsize.bottom - ncsize.top);

	if (wpl.showCmd != SW_SHOWMAXIMIZED)
	  {
	    /* Adjust so that the bottom or right doesn't move if it's
	     * the top or left that's being changed */
	    RECT rect;
	    GetWindowRect (hwnd, &rect);

	    if (rect.left != wp->x)
	      wp->x += wp->cx - pixwidth;
	    if (rect.top != wp->y)
	      wp->y += wp->cy - pixheight;
	  }

	wp->cx = pixwidth;
	wp->cy = pixheight;
      }
      /* DefWindowProc sends useful WM_GETMINMAXINFO message, and adjusts
	 window position if the user tries to track window too small */
    }
    goto defproc;

  case WM_ENTERSIZEMOVE:
    msframe  = FRAME_MSWINDOWS_DATA (XFRAME (mswindows_find_frame (hwnd)));
    msframe->sizing = 1;
    return 0;

  case WM_EXITSIZEMOVE:
    msframe  = FRAME_MSWINDOWS_DATA (XFRAME (mswindows_find_frame (hwnd)));
    msframe->sizing = 0;
    /* Queue noop event */
    mswindows_enqueue_magic_event (NULL, XM_BUMPQUEUE);
    return 0;

#ifdef HAVE_SCROLLBARS
  case WM_VSCROLL:
  case WM_HSCROLL:
    {
      /* Direction of scroll is determined by scrollbar instance. */
      int code = (int) LOWORD(wParam);
      int pos = (short int) HIWORD(wParam);
      HWND hwndScrollBar = (HWND) lParam;
      struct gcpro gcpro1, gcpro2;

      mswindows_handle_scrollbar_event (hwndScrollBar, code,  pos);
      GCPRO2 (emacs_event, fobj);
      if (UNBOUNDP(mswindows_pump_outstanding_events()))	/* Can GC */
	{
	  /* Error during event pumping - cancel scroll */
	  SendMessage (hwndScrollBar, WM_CANCELMODE, 0, 0);
	}
      UNGCPRO;
      break;     
    }
#endif

#ifdef HAVE_MENUBARS
  case WM_INITMENU:
    if (UNBOUNDP (mswindows_handle_wm_initmenu (
			(HMENU) wParam,
			XFRAME (mswindows_find_frame (hwnd)))))
      SendMessage (hwnd, WM_CANCELMODE, 0, 0);
    break;

  case WM_INITMENUPOPUP:
    if (!HIWORD(lParam))
      {
	if (UNBOUNDP (mswindows_handle_wm_initmenupopup (
			(HMENU) wParam,
			 XFRAME (mswindows_find_frame (hwnd)))))
	  SendMessage (hwnd, WM_CANCELMODE, 0, 0);
      }
    break;

#endif /* HAVE_MENUBARS */

  case WM_COMMAND:
    {
      WORD id = LOWORD (wParam);
      WORD nid = HIWORD (wParam);
      HWND cid = (HWND)lParam;
      frame = XFRAME (mswindows_find_frame (hwnd));

#ifdef HAVE_TOOLBARS
      if (!NILP (mswindows_handle_toolbar_wm_command (frame, cid, id)))
	break;
#endif
      /* widgets in a buffer only eval a callback for suitable events.*/
      switch (nid)
	{
	case BN_CLICKED:
	case EN_CHANGE:
	case CBN_EDITCHANGE:
	case CBN_SELCHANGE:
	  if (!NILP (mswindows_handle_gui_wm_command (frame, cid, id)))
	    return 0;
	}
      /* menubars always must come last since the hashtables do not
         always exist*/
#ifdef HAVE_MENUBARS
      if (!NILP (mswindows_handle_wm_command (frame, id)))
	break;
#endif

      return DefWindowProc (hwnd, message, wParam, lParam);
      /* Bite me - a spurious command. This used to not be able to
         happen but with the introduction of widgets its now
         possible. */
    }
  break;

  case WM_CTLCOLORBTN:
  case WM_CTLCOLORLISTBOX:
  case WM_CTLCOLOREDIT:
  case WM_CTLCOLORSTATIC:
  case WM_CTLCOLORSCROLLBAR:
    {
      /* if we get an opportunity to paint a widget then do so if
         there is an appropriate face */
      HWND crtlwnd = (HWND)lParam;
      LONG ii = GetWindowLong (crtlwnd, GWL_USERDATA);
      if (ii)
	{
	  Lisp_Object image_instance;
	  VOID_TO_LISP (image_instance, ii);
	  if (IMAGE_INSTANCEP (image_instance)
	      && 
	      IMAGE_INSTANCE_TYPE_P (image_instance, IMAGE_WIDGET)
	      &&
	      !NILP (XIMAGE_INSTANCE_WIDGET_FACE (image_instance)))
	    {
	      /* set colors for the buttons */
	      HDC hdc = (HDC)wParam;
	      if (last_widget_brushed != ii)
		{
		  if (widget_brush)
		    DeleteObject (widget_brush);
		  widget_brush = CreateSolidBrush 
		    (COLOR_INSTANCE_MSWINDOWS_COLOR 
		     (XCOLOR_INSTANCE 
		      (FACE_BACKGROUND 
		       (XIMAGE_INSTANCE_WIDGET_FACE (image_instance),
			XIMAGE_INSTANCE_SUBWINDOW_FRAME (image_instance)))));
		}
	      last_widget_brushed = ii;
	      SetTextColor
		(hdc,
		 COLOR_INSTANCE_MSWINDOWS_COLOR 
		 (XCOLOR_INSTANCE 
		  (FACE_FOREGROUND 
		   (XIMAGE_INSTANCE_WIDGET_FACE (image_instance),
		    XIMAGE_INSTANCE_SUBWINDOW_FRAME (image_instance)))));
	      SetBkMode (hdc, OPAQUE);
	      SetBkColor
		(hdc,
		 COLOR_INSTANCE_MSWINDOWS_COLOR 
		 (XCOLOR_INSTANCE 
		  (FACE_BACKGROUND 
		   (XIMAGE_INSTANCE_WIDGET_FACE (image_instance),
		    XIMAGE_INSTANCE_SUBWINDOW_FRAME (image_instance)))));
	      return (LRESULT)widget_brush;
	    }
	}
    }
    goto defproc;

#ifdef HAVE_DRAGNDROP
  case WM_DROPFILES:	/* implementation ripped-off from event-Xt.c */
    {
      UINT filecount, i, len;
      POINT point;
      char* filename;
#ifdef __CYGWIN32__
      char* fname;
#endif
      Lisp_Object l_dndlist = Qnil, l_item = Qnil;
      struct gcpro gcpro1, gcpro2, gcpro3;

      emacs_event = Fmake_event (Qnil, Qnil);
      event = XEVENT(emacs_event);

      GCPRO3 (emacs_event, l_dndlist, l_item);

      if (!DragQueryPoint ((HANDLE) wParam, &point))
	point.x = point.y = -1;		/* outside client area */

      event->event_type = misc_user_event;
      event->channel = mswindows_find_frame(hwnd);
      event->timestamp = GetMessageTime();
      event->event.misc.button = 1;		/* #### Should try harder */
      event->event.misc.modifiers = mswindows_modifier_state (NULL, 0);
      event->event.misc.x = point.x;
      event->event.misc.y = point.y;
      event->event.misc.function = Qdragdrop_drop_dispatch;

      filecount = DragQueryFile ((HANDLE) wParam, 0xffffffff, NULL, 0);
      for (i=0; i<filecount; i++)
	{
	  len = DragQueryFile ((HANDLE) wParam, i, NULL, 0);
	  /* The URLs that we make here aren't correct according to section
	   * 3.10 of rfc1738 because they're missing the //<host>/ part and
	   * because they may contain reserved characters. But that's OK. */
#ifdef __CYGWIN32__
	  fname = (char *)xmalloc (len+1);
	  DragQueryFile ((HANDLE) wParam, i, fname, len+1);
	  filename = xmalloc (cygwin32_win32_to_posix_path_list_buf_size (fname) + 5);
	  strcpy (filename, "file:");
	  cygwin32_win32_to_posix_path_list (fname, filename+5);
	  xfree (fname);
#else
	  filename = (char *)xmalloc (len+6);
	  strcpy (filename, "file:");
	  DragQueryFile ((HANDLE) wParam, i, filename+5, len+1);
	  dostounix_filename (filename+5);
#endif
	  l_item = make_string (filename, strlen (filename));
	  l_dndlist = Fcons (l_item, l_dndlist);
	  xfree (filename);
	}
      DragFinish ((HANDLE) wParam);

      event->event.misc.object = Fcons (Qdragdrop_URL, l_dndlist);
      mswindows_enqueue_dispatch_event (emacs_event);
      UNGCPRO;
    }
  break;
#endif

  defproc:
  default:
    return DefWindowProc (hwnd, message, wParam, lParam);
  }
  return (0);
}


/************************************************************************/
/*      keyboard, mouse & other helpers for the windows procedure       */
/************************************************************************/
static void
mswindows_set_chord_timer (HWND hwnd)
{
  int interval;

  /* We get one third half system double click threshold */
  if (mswindows_mouse_button_tolerance <= 0)
    interval = GetDoubleClickTime () / 3;
  else
    interval = mswindows_mouse_button_tolerance;

  SetTimer (hwnd, BUTTON_2_TIMER_ID, interval, 0);
}

static int
mswindows_button2_near_enough (POINTS p1, POINTS p2)
{
  int dx, dy;
  if (mswindows_mouse_button_max_skew_x <= 0)
    dx = GetSystemMetrics (SM_CXDOUBLECLK) / 2;
  else
    dx = mswindows_mouse_button_max_skew_x;

  if (mswindows_mouse_button_max_skew_y <= 0)
    dy = GetSystemMetrics (SM_CYDOUBLECLK) / 2;
  else
    dy = mswindows_mouse_button_max_skew_y;

  return abs (p1.x - p2.x) < dx && abs (p1.y- p2.y)< dy;
}

static int
mswindows_current_layout_has_AltGr (void)
{
  /* This simple caching mechanism saves 10% of CPU
     time when a key typed at autorepeat rate of 30 cps! */
  static HKL last_hkl = 0;
  static int last_hkl_has_AltGr;

  HKL current_hkl = GetKeyboardLayout (0);
  if (current_hkl != last_hkl)
    {
      TCHAR c;
      last_hkl_has_AltGr = 0;
      /* In this loop, we query whether a character requires
	 AltGr to be down to generate it. If at least such one
	 found, this means that the layout does regard AltGr */
      for (c = ' '; c <= 0xFFU && c != 0 && !last_hkl_has_AltGr; ++c)
	if (HIBYTE (VkKeyScan (c)) == 6)
	  last_hkl_has_AltGr = 1;
      last_hkl = current_hkl;
    }
  return last_hkl_has_AltGr;
}


/* Returns the state of the modifier keys in the format expected by the
 * Lisp_Event key_data, button_data and motion_data modifiers member */
int mswindows_modifier_state (BYTE* keymap, int has_AltGr)
{
  int mods = 0;

  if (keymap == NULL)
    {
      keymap = (BYTE*) alloca(256);
      GetKeyboardState (keymap);
      has_AltGr = mswindows_current_layout_has_AltGr ();
    }

  if (has_AltGr && (keymap [VK_LCONTROL] & 0x80) && (keymap [VK_RMENU] & 0x80))
    {
      mods |= (keymap [VK_LMENU] & 0x80) ? MOD_META : 0;
      mods |= (keymap [VK_RCONTROL] & 0x80) ? MOD_CONTROL : 0;
    }
  else
    {
      mods |= (keymap [VK_MENU] & 0x80) ? MOD_META : 0;
      mods |= (keymap [VK_CONTROL] & 0x80) ? MOD_CONTROL : 0;
    }

  mods |= (keymap [VK_SHIFT] & 0x80) ? MOD_SHIFT : 0;

  return mods;
}

/*
 * Translate a mswindows virtual key to a keysym.
 * Only returns non-Qnil for keys that don't generate WM_CHAR messages
 * or whose ASCII codes (like space) xemacs doesn't like.
 * Virtual key values are defined in winresrc.h
 * XXX I'm not sure that KEYSYM("name") is the best thing to use here.
 */
Lisp_Object mswindows_key_to_emacs_keysym(int mswindows_key, int mods)
{
  switch (mswindows_key)
  {
  /* First the predefined ones */
  case VK_BACK:		return QKbackspace;
  case VK_TAB:		return QKtab;
  case '\n':		return QKlinefeed;  /* No VK_LINEFEED in winresrc.h */
  case VK_RETURN:	return QKreturn;
  case VK_ESCAPE:	return QKescape;
  case VK_SPACE:	return QKspace;
  case VK_DELETE:	return QKdelete;

  /* The rest */
  case VK_CLEAR:	return KEYSYM ("clear");  /* Should do ^L ? */
  case VK_PRIOR:	return KEYSYM ("prior");
  case VK_NEXT:		return KEYSYM ("next");
  case VK_END:		return KEYSYM ("end");
  case VK_HOME:		return KEYSYM ("home");
  case VK_LEFT:		return KEYSYM ("left");
  case VK_UP:		return KEYSYM ("up");
  case VK_RIGHT:	return KEYSYM ("right");
  case VK_DOWN:		return KEYSYM ("down");
  case VK_SELECT:	return KEYSYM ("select");
  case VK_PRINT:	return KEYSYM ("print");
  case VK_EXECUTE:	return KEYSYM ("execute");
  case VK_SNAPSHOT:	return KEYSYM ("print");
  case VK_INSERT:	return KEYSYM ("insert");
  case VK_HELP:		return KEYSYM ("help");
#if 0	/* XXX What are these supposed to do? */
  case VK_LWIN		return KEYSYM ("");
  case VK_RWIN		return KEYSYM ("");
#endif
  case VK_APPS:		return KEYSYM ("menu");
  case VK_F1:		return KEYSYM ("f1");
  case VK_F2:		return KEYSYM ("f2");
  case VK_F3:		return KEYSYM ("f3");
  case VK_F4:		return KEYSYM ("f4");
  case VK_F5:		return KEYSYM ("f5");
  case VK_F6:		return KEYSYM ("f6");
  case VK_F7:		return KEYSYM ("f7");
  case VK_F8:		return KEYSYM ("f8");
  case VK_F9:		return KEYSYM ("f9");
  case VK_F10:		return KEYSYM ("f10");
  case VK_F11:		return KEYSYM ("f11");
  case VK_F12:		return KEYSYM ("f12");
  case VK_F13:		return KEYSYM ("f13");
  case VK_F14:		return KEYSYM ("f14");
  case VK_F15:		return KEYSYM ("f15");
  case VK_F16:		return KEYSYM ("f16");
  case VK_F17:		return KEYSYM ("f17");
  case VK_F18:		return KEYSYM ("f18");
  case VK_F19:		return KEYSYM ("f19");
  case VK_F20:		return KEYSYM ("f20");
  case VK_F21:		return KEYSYM ("f21");
  case VK_F22:		return KEYSYM ("f22");
  case VK_F23:		return KEYSYM ("f23");
  case VK_F24:		return KEYSYM ("f24");
  }
  return Qnil;
}

/*
 * Find the console that matches the supplied mswindows window handle
 */
Lisp_Object
mswindows_find_console (HWND hwnd)
{
  /* We only support one console */
  return XCAR (Vconsole_list);
}

/*
 * Find the frame that matches the supplied mswindows window handle
 */
static Lisp_Object
mswindows_find_frame (HWND hwnd)
{
  LONG l = GetWindowLong (hwnd, XWL_FRAMEOBJ);
  Lisp_Object f;
  if (l == 0)
    {
      /* We are in progress of frame creation. Return the frame
	 being created, as it still not remembered in the window
	 extra storage. */
      assert (!NILP (Vmswindows_frame_being_created));
      return Vmswindows_frame_being_created;
    }
  VOID_TO_LISP (f, l);
  return f;
}


/************************************************************************/
/*                            methods                                   */
/************************************************************************/

static int
emacs_mswindows_add_timeout (EMACS_TIME thyme)
{
  int milliseconds;
  EMACS_TIME current_time;
  EMACS_GET_TIME (current_time);
  EMACS_SUB_TIME (thyme, thyme, current_time);
  milliseconds = EMACS_SECS (thyme) * 1000 +
    (EMACS_USECS (thyme) + 500) / 1000;
  if (milliseconds < 1)
    milliseconds = 1;
  ++mswindows_pending_timers_count;
  return SetTimer (NULL, 0, milliseconds,
		   (TIMERPROC) mswindows_wm_timer_callback);
}

static void
emacs_mswindows_remove_timeout (int id)
{
  struct Lisp_Event match_against;
  Lisp_Object emacs_event;

  if (KillTimer (NULL, id))
    --mswindows_pending_timers_count;

  /* If there is a dispatch event generated by this
     timeout in the queue, we have to remove it too. */
  match_against.event_type = timeout_event;
  match_against.event.timeout.interval_id = id;
  emacs_event = mswindows_cancel_dispatch_event (&match_against);
  if (!NILP (emacs_event))
    Fdeallocate_event(emacs_event);
}

/* If `user_p' is false, then return whether there are any win32, timeout,
 * or subprocess events pending (that is, whether
 * emacs_mswindows_next_event() would return immediately without blocking).
 *
 * if `user_p' is true, then return whether there are any *user generated*
 * events available (that is, whether there are keyboard or mouse-click
 * events ready to be read).  This also implies that
 * emacs_mswindows_next_event() would not block.
 */
static int
emacs_mswindows_event_pending_p (int user_p)
{
  mswindows_need_event (0);
  return (!NILP (mswindows_u_dispatch_event_queue)
	  || (!user_p && !NILP (mswindows_s_dispatch_event_queue)));
}

/*
 * Return the next event
 */
static void
emacs_mswindows_next_event (struct Lisp_Event *emacs_event)
{
  Lisp_Object event, event2;

  mswindows_need_event (1);

  event = mswindows_dequeue_dispatch_event ();
  XSETEVENT (event2, emacs_event);
  Fcopy_event (event, event2);
  Fdeallocate_event (event);
}

/*
 * Handle a magic event off the dispatch queue.
 */
static void
emacs_mswindows_handle_magic_event (struct Lisp_Event *emacs_event)
{
  switch (EVENT_MSWINDOWS_MAGIC_TYPE(emacs_event))
    {
    case XM_BUMPQUEUE:
      break;
    
    case WM_SETFOCUS:
    case WM_KILLFOCUS:
      {
	Lisp_Object frame = EVENT_CHANNEL (emacs_event);
	struct frame *f = XFRAME (frame);
	int in_p = (EVENT_MSWINDOWS_MAGIC_TYPE(emacs_event) == WM_SETFOCUS);
	Lisp_Object conser;

	/* struct gcpro gcpro1; */

	/* Clear sticky modifiers here (if we had any) */

	conser = Fcons (frame, Fcons (FRAME_DEVICE (f), in_p ? Qt : Qnil));
	/* GCPRO1 (conser); XXX Not necessary? */
	emacs_handle_focus_change_preliminary (conser);
	/* Under X the stuff up to here is done in the X event handler.
	   I Don't know why */
	emacs_handle_focus_change_final (conser);
	/* UNGCPRO; */

      }
      break;

    case XM_MAPFRAME:
    case XM_UNMAPFRAME:
      {
	Lisp_Object frame = EVENT_CHANNEL (emacs_event);
	va_run_hook_with_args (EVENT_MSWINDOWS_MAGIC_TYPE(emacs_event) 
			       == XM_MAPFRAME ?
			       Qmap_frame_hook : Qunmap_frame_hook, 
			       1, frame);
      }
      break;
			    
      /* #### What about Enter & Leave */
#if 0
      va_run_hook_with_args (in_p ? Qmouse_enter_frame_hook :
			     Qmouse_leave_frame_hook, 1, frame);
#endif

    default:
      assert(0);
    }
}

#ifndef HAVE_MSG_SELECT
static HANDLE
get_process_input_waitable (struct Lisp_Process *process)
{
  Lisp_Object instr, outstr, p;
  XSETPROCESS (p, process);
  get_process_streams (process, &instr, &outstr);
  assert (!NILP (instr));
#if defined (HAVE_SOCKETS) && !defined(HAVE_MSG_SELECT)
  return (network_connection_p (p)
	  ? get_winsock_stream_waitable (XLSTREAM (instr))
	  : get_ntpipe_input_stream_waitable (XLSTREAM (instr)));
#else
    return get_ntpipe_input_stream_waitable (XLSTREAM (instr));
#endif
}

static void
emacs_mswindows_select_process (struct Lisp_Process *process)
{
  HANDLE hev = get_process_input_waitable (process);

  if (!add_waitable_handle (hev))
    error ("Too many active processes");

#ifdef HAVE_WIN32_PROCESSES
  {
    Lisp_Object p;
    XSETPROCESS (p, process);
    if (!network_connection_p (p))
      {
	HANDLE hprocess = get_nt_process_handle (process);
	if (!add_waitable_handle (hprocess))
	  {
	    remove_waitable_handle (hev);
	    error ("Too many active processes");
	  }
      }
  }
#endif
}

static void
emacs_mswindows_unselect_process (struct Lisp_Process *process)
{
  /* Process handle is removed in the event loop as soon
     as it is signaled, so don't bother here about it */
  HANDLE hev = get_process_input_waitable (process);
  remove_waitable_handle (hev);
}
#endif /* HAVE_MSG_SELECT */

static void
emacs_mswindows_select_console (struct console *con)
{
#ifdef HAVE_MSG_SELECT
  if (CONSOLE_MSWINDOWS_P (con))
    return; /* mswindows consoles are automatically selected */

  event_stream_unixoid_select_console (con);
#endif
}

static void
emacs_mswindows_unselect_console (struct console *con)
{
#ifdef HAVE_MSG_SELECT
  if (CONSOLE_MSWINDOWS_P (con))
    return; /* mswindows consoles are automatically selected */

  event_stream_unixoid_unselect_console (con);
#endif
}

static void
emacs_mswindows_quit_p (void)
{
  MSG msg;

  /* Quit cannot happen in modal loop: all program
     input is dedicated to Windows. */
  if (mswindows_in_modal_loop)
    return;

  /* Drain windows queue. This sets up number of quit characters in the queue
   * (and also processes wm focus change, move, resize, etc messages).
   * We don't want to process WM_PAINT messages because this function can be
   * called from almost anywhere and the windows' states may be changing. */
  while (PeekMessage (&msg, NULL, 0, WM_PAINT-1, PM_REMOVE) ||
	 PeekMessage (&msg, NULL, WM_PAINT+1, WM_USER-1, PM_REMOVE))
      DispatchMessage (&msg);

  if (mswindows_quit_chars_count > 0)
    {
      /* Yes there's a hidden one... Throw it away */
      struct Lisp_Event match_against;
      Lisp_Object emacs_event;

      match_against.event_type = key_press_event;
      match_against.event.key.modifiers = FAKE_MOD_QUIT;

      emacs_event = mswindows_cancel_dispatch_event (&match_against);
      assert (!NILP (emacs_event));

      Vquit_flag = (XEVENT(emacs_event)->event.key.modifiers & MOD_SHIFT
		    ? Qcritical : Qt);

      Fdeallocate_event(emacs_event);
      --mswindows_quit_chars_count;
    }
}

USID
emacs_mswindows_create_stream_pair (void* inhandle, void* outhandle,
				    Lisp_Object* instream,
				    Lisp_Object* outstream,
				    int flags)
{
  /* Handles for streams */
  HANDLE hin, hout;
  /* fds. These just stored along with the streams, and are closed in
     delete stream pair method, because we need to handle fake unices
     here. */
  int fdi, fdo;

  /* Decode inhandle and outhandle. Their meaning depends on
     the process implementation being used. */
#if defined (HAVE_WIN32_PROCESSES)
  /* We're passed in Windows handles. That's what we like most... */
  hin = (HANDLE) inhandle;
  hout = (HANDLE) outhandle;
  fdi = fdo = -1;
#elif defined (HAVE_UNIX_PROCESSES)
  /* We are passed UNIX fds. This must be Cygwin.
     Fetch os handles */
  hin = inhandle >= 0 ? (HANDLE)get_osfhandle ((int)inhandle) : INVALID_HANDLE_VALUE;
  hout = outhandle >= 0 ? (HANDLE)get_osfhandle ((int)outhandle) : INVALID_HANDLE_VALUE;
  fdi=(int)inhandle;
  fdo=(int)outhandle;
#else
#error "So, WHICH kind of processes do you want?"
#endif

  *instream = (hin == INVALID_HANDLE_VALUE
	       ? Qnil
#if defined (HAVE_SOCKETS) && !defined (HAVE_MSG_SELECT)
	       : flags & STREAM_NETWORK_CONNECTION
	       ? make_winsock_input_stream ((SOCKET)hin, fdi)
#endif
	       : make_ntpipe_input_stream (hin, fdi));

#ifdef HAVE_WIN32_PROCESSES
  *outstream = (hout == INVALID_HANDLE_VALUE
		? Qnil
#if defined (HAVE_SOCKETS) && !defined (HAVE_MSG_SELECT)
		: flags & STREAM_NETWORK_CONNECTION
		? make_winsock_output_stream ((SOCKET)hout, fdo)
#endif
		: make_ntpipe_output_stream (hout, fdo));
#elif defined (HAVE_UNIX_PROCESSES)
  *outstream = (fdo >= 0
		? make_filedesc_output_stream (fdo, 0, -1, LSTR_BLOCKED_OK)
		: Qnil);

#if defined(HAVE_UNIX_PROCESSES) && defined(HAVE_PTYS)
  /* FLAGS is process->pty_flag for UNIX_PROCESSES */
  if ((flags & STREAM_PTY_FLUSHING) && fdo >= 0)
    {
      Bufbyte eof_char = get_eof_char (fdo);
      int pty_max_bytes = get_pty_max_bytes (fdo);
      filedesc_stream_set_pty_flushing (XLSTREAM(*outstream), pty_max_bytes, eof_char);
    }
#endif
#endif

  return (NILP (*instream)
	  ? USID_ERROR
#if defined(HAVE_SOCKETS) && !defined(HAVE_MSG_SELECT)
	  : flags & STREAM_NETWORK_CONNECTION
	  ? HANDLE_TO_USID (get_winsock_stream_waitable (XLSTREAM (*instream)))
#endif
	  : HANDLE_TO_USID (get_ntpipe_input_stream_waitable (XLSTREAM (*instream))));
}

USID
emacs_mswindows_delete_stream_pair (Lisp_Object instream,
					 Lisp_Object outstream)
{
  /* Oh nothing special here for Win32 at all */
#if defined (HAVE_UNIX_PROCESSES)
  int in = (NILP(instream)
	    ? -1
#if defined(HAVE_SOCKETS) && !defined(HAVE_MSG_SELECT)
	    : LSTREAM_TYPE_P (XLSTREAM (instream), winsock)
	    ? get_winsock_stream_param (XLSTREAM (instream))
#endif
	    : get_ntpipe_input_stream_param (XLSTREAM (instream)));
  int out = (NILP(outstream) ? -1
	     : filedesc_stream_fd (XLSTREAM (outstream)));

  if (in >= 0)
    close (in);
  if (out != in && out >= 0)
    close (out);
#endif

  return (NILP (instream)
	  ? USID_DONTHASH
#if defined(HAVE_SOCKETS) && !defined(HAVE_MSG_SELECT)
	  : LSTREAM_TYPE_P (XLSTREAM (instream), winsock)
	  ? HANDLE_TO_USID (get_winsock_stream_waitable (XLSTREAM (instream)))
#endif
	  : HANDLE_TO_USID (get_ntpipe_input_stream_waitable (XLSTREAM (instream))));
}

#ifndef HAVE_X_WINDOWS
/* This is called from GC when a process object is about to be freed.
   If we've still got pointers to it in this file, we're gonna lose hard.
 */
void
debug_process_finalization (struct Lisp_Process *p)
{
#if 0 /* #### */
  Lisp_Object instr, outstr;

  get_process_streams (p, &instr, &outstr);
  /* if it still has fds, then it hasn't been killed yet. */
  assert (NILP(instr));
  assert (NILP(outstr));

  /* #### More checks here */
#endif
}
#endif

/************************************************************************/
/*                            initialization                            */
/************************************************************************/
 
void
vars_of_event_mswindows (void)
{
  mswindows_u_dispatch_event_queue = Qnil;
  staticpro (&mswindows_u_dispatch_event_queue);
  mswindows_u_dispatch_event_queue_tail = Qnil;

  mswindows_s_dispatch_event_queue = Qnil;
  staticpro (&mswindows_s_dispatch_event_queue);
  mswindows_s_dispatch_event_queue_tail = Qnil;

  mswindows_error_caught_in_modal_loop = Qnil;
  staticpro (&mswindows_error_caught_in_modal_loop);
  mswindows_in_modal_loop = 0;
  mswindows_pending_timers_count = 0;

  mswindows_event_stream = xnew (struct event_stream);

  mswindows_event_stream->event_pending_p 	= emacs_mswindows_event_pending_p;
  mswindows_event_stream->next_event_cb		= emacs_mswindows_next_event;
  mswindows_event_stream->handle_magic_event_cb = emacs_mswindows_handle_magic_event;
  mswindows_event_stream->add_timeout_cb 	= emacs_mswindows_add_timeout;
  mswindows_event_stream->remove_timeout_cb 	= emacs_mswindows_remove_timeout;
  mswindows_event_stream->quit_p_cb		= emacs_mswindows_quit_p;
  mswindows_event_stream->select_console_cb 	= emacs_mswindows_select_console;
  mswindows_event_stream->unselect_console_cb	= emacs_mswindows_unselect_console;
#ifdef HAVE_MSG_SELECT
  mswindows_event_stream->select_process_cb 	= 
    (void (*)(struct Lisp_Process*))event_stream_unixoid_select_process;
  mswindows_event_stream->unselect_process_cb	= 
    (void (*)(struct Lisp_Process*))event_stream_unixoid_unselect_process;
  mswindows_event_stream->create_stream_pair_cb = event_stream_unixoid_create_stream_pair;
  mswindows_event_stream->delete_stream_pair_cb = event_stream_unixoid_delete_stream_pair;
#else
  mswindows_event_stream->select_process_cb 	= emacs_mswindows_select_process;
  mswindows_event_stream->unselect_process_cb	= emacs_mswindows_unselect_process;
  mswindows_event_stream->create_stream_pair_cb = emacs_mswindows_create_stream_pair;
  mswindows_event_stream->delete_stream_pair_cb = emacs_mswindows_delete_stream_pair;
#endif

  DEFVAR_BOOL ("mswindows-dynamic-frame-resize", &mswindows_dynamic_frame_resize /*
*Controls redrawing frame contents during mouse-drag or keyboard resize
operation. When non-nil, the frame is redrawn while being resized. When
nil, frame is not redrawn, and exposed areas are filled with default
MDI application background color. Note that this option only has effect
if "Show window contents while dragging" is on in system Display/Plus!
settings.
Default is t on fast machines, nil on slow.
*/ );

/* The description copied verbatim from nt-emacs. (C) Geoff Voelker */
  DEFVAR_INT ("mswindows-mouse-button-tolerance", &mswindows_mouse_button_tolerance /*
*Analogue of double click interval for faking middle mouse events.
The value is the minimum time in milliseconds that must elapse between
left/right button down events before they are considered distinct events.
If both mouse buttons are depressed within this interval, a middle mouse
button down event is generated instead.
If negative or zero, currently set system default is used instead.
*/ );

/* The description copied verbatim from nt-emacs. (C) Geoff Voelker */
  DEFVAR_INT ("mswindows-num-mouse-buttons", &mswindows_num_mouse_buttons /*
Number of physical mouse buttons.
*/ );

  DEFVAR_INT ("mswindows-mouse-button-max-skew-x", &mswindows_mouse_button_max_skew_x /*
*Maximum horizontal distance in pixels between points in which left and
right button clicks occurred for them to be translated into single
middle button event. Clicks must occur in time not longer than defined
by the variable `mswindows-mouse-button-tolerance'.
If negative or zero, currently set system default is used instead.
*/ );

  DEFVAR_INT ("mswindows-mouse-button-max-skew-y", &mswindows_mouse_button_max_skew_y /*
*Maximum vertical distance in pixels between points in which left and
right button clicks occurred for them to be translated into single
middle button event. Clicks must occur in time not longer than defined
by the variable `mswindows-mouse-button-tolerance'.
If negative or zero, currently set system default is used instead.
*/ );

  mswindows_mouse_button_max_skew_x = 0;
  mswindows_mouse_button_max_skew_y = 0;
  mswindows_mouse_button_tolerance = 0;
}

void
syms_of_event_mswindows (void)
{
}

void
lstream_type_create_mswindows_selectable (void)
{
  init_slurp_stream ();
  init_shove_stream ();
#if defined (HAVE_SOCKETS) && !defined(HAVE_MSG_SELECT)
  init_winsock_stream ();
#endif
}

void
init_event_mswindows_late (void)
{
#ifdef HAVE_MSG_SELECT
  windows_fd = open("/dev/windows", O_RDONLY | O_NONBLOCK, 0);
  assert (windows_fd>=0);
  FD_SET (windows_fd, &input_wait_mask);
  FD_ZERO(&zero_mask);
#endif

  event_stream = mswindows_event_stream;

  mswindows_dynamic_frame_resize = !GetSystemMetrics (SM_SLOWMACHINE);
  mswindows_num_mouse_buttons = GetSystemMetrics (SM_CMOUSEBUTTONS);
}
