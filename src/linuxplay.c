/* linuxplay.c - play a sound file on the speaker
 **
 ** Copyright (C) 1995,96 by Markus Gutschke (gutschk@math.uni-muenster.de)
 ** This is version 1.3 of linuxplay.c
 **
 ** Parts of this code were inspired by sunplay.c, which is copyright 1989 by
 ** Jef Poskanzer and 1991,92 by Jamie Zawinski; c.f. sunplay.c for further
 ** information.
 **
 ** Permission to use, copy, modify, and distribute this software and its
 ** documentation for any purpose and without fee is hereby granted, provided
 ** that the above copyright notice appear in all copies and that both that
 ** copyright notice and this permission notice appear in supporting
 ** documentation.  This software is provided "as is" without express or
 ** implied warranty.
 **
 ** Changelog:
 **  1.0  --  first release; supports SunAudio, Wave and RAW file formats
 **           detects (and rejects) VOC file format
 **           tested with PC-Speaker driver only
 **  1.1  --  fixed bug with playback of stereo Wave files
 **           fixed VOC file detection
 **           fixed mono/8bit conversion
 **           cleaned up mixer programming (c.f. VoxWare-SDK)
 **           tested with PC-Speaker driver and with PAS16 soundcard
 **  1.2  --  first (incompatible) attempt at fixing reliable signal handling
 **  1.3  --  changed signal handling to use reliable signals; this is done
 **           by including "syssignal.h"; it fixes nasty program crashes
 **           when using native sound in TTY mode.
 **           added support for DEC audio file format (this is basically the
 **           same as Sun audio, but uses little endian format, instead).
 **           strip the header from Sun audio and DEC audio files in order to
 **           prevent noise at beginning of samples (thanks to Thomas Pundt
 **           <pundtt@math.uni-muenster.de> for pointing out this bug and
 **           providing information on the file format).
 **           added a few more conversion routines.
 **           made the code even more tolerant to the limits imposed by some
 **           soundcards and try to accept soundfiles even if they are not
 **           fully conformant to the standard.
 **  1.4  --  increased header size to 256; I hope there is no sample software
 **           that requires this much.
 **           added code for converting from signed to unsigned format as
 **           some soundcards cannot handle signed 8bit data.
 */

/* Synched up with: Not in FSF. */

#define HEADERSZ  256   /* has to be at least as big as the biggest header   */
#define SNDBUFSZ  2048  /* has to be at least as big as HEADERSZ             */

/* XEmacs beta testers say:  undef this by default. */
#undef NOVOLUMECTRLFORMULAW /* Changing the volume for uLaw-encoded
			       samples sounds very poor; possibly,
			       this is true only for the PC-Snd
			       driver, so undefine this symbol at your
			       discretion */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <errno.h>
#include <fcntl.h>
#include SOUNDCARD_H_PATH /* Path computed by configure */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/file.h>
#include <sys/ioctl.h>
#include <sys/signal.h>
#include <unistd.h>

#ifdef LINUXPLAYSTANDALONE
#define perror(str) fprintf(stderr,"audio: %s %s\n",str,strerror(errno));
#define warn(str)   fprintf(stderr,"audio: %s\n",str);
#else
#include "lisp.h"
#include "syssignal.h"
#include "sysfile.h"
#define perror(str) message("audio: %s, %s ",str,strerror(errno))
#define warn(str)   message("audio: %s ",GETTEXT(str))
#endif

#ifdef __GNUC__
#define UNUSED(x) ((void)(x))
#else
#define UNUSED(x)
#define __inline__
#endif

static  void (*sighup_handler)(int);
static  void (*sigint_handler)(int);

/* Maintain global variable for keeping parser state information; this struct
   is set to zero before the first invocation of the parser. The use of a
   global variable prevents multiple concurrent executions of this code, but
   this does not happen anyways... */
enum wvState
{ wvMain,
  wvSubchunk,
  wvOutOfBlock,
  wvSkipChunk,
  wvSoundChunk,
  wvFatal,
  wvFatalNotify
};

static union {
  struct {
    int           align;
    enum wvState state;
    size_t        left;
    unsigned char leftover[HEADERSZ];
    signed long   chunklength;
  } wave;
  struct {
    int           align;
    int           isdata;
    int           skipping;
    size_t        left;
    unsigned char leftover[HEADERSZ];
  } audio;
} parsestate;

/* Use a global buffer as scratch-pad for possible conversions of the
   sampling format */
static unsigned char linuxplay_sndbuf[SNDBUFSZ];

static int           mix_fd;
static int           audio_vol;
static int           audio_fd;
static char	     *audio_dev = "/dev/dsp";

typedef enum {fmtIllegal,fmtRaw,fmtVoc,fmtWave,fmtSunAudio} fmtType;

/* Intercept SIGINT and SIGHUP in order to close the audio and mixer
   devices before terminating sound output; this requires reliable
   signals as provided by "syssignal.h" */
static void sighandler(int sig)
{
  if (mix_fd > 0) {
    if (audio_vol >= 0) {
      ioctl(mix_fd,SOUND_MIXER_WRITE_PCM,&audio_vol);
      audio_vol = -1; }
    if (mix_fd != audio_fd)
      close(mix_fd);
    mix_fd = -1; }
  if (audio_fd > 0) {
    ioctl(audio_fd,SNDCTL_DSP_SYNC,NULL);
    ioctl(audio_fd,SNDCTL_DSP_RESET,NULL);
    close(audio_fd);
    audio_fd = -1; }
  if (sig == SIGHUP && sighup_handler)      sighup_handler(sig);
  else if (sig == SIGINT && sigint_handler) sigint_handler(sig);
  else exit(1);
}

/* There is no special treatment required for parsing raw data files; we
   assume that these files contain data in 8bit unsigned format that
   has been sampled at 8kHz; there is no extra header */
static size_t parseraw(void **data,size_t *sz,void **outbuf)
{
  int rc = *sz;

  *outbuf = *data;
  *sz = 0;
  return(rc);
}

/* Currently we cannot cope with files in VOC format; if you really need
   to play these files, they should be converted by using SOX */
static size_t parsevoc(void **data,size_t *sz,void **outbuf)
{
  UNUSED(data);
  UNUSED(sz);
  UNUSED(outbuf);
  return(0);
}

/* We need to perform some look-ahead in order to parse files in WAVE format;
   this might require re-partioning of the data segments if headers cross the
   boundaries between two read operations. This is done in a two-step way:
   first we request a certain amount of bytes... */
static __inline__ int waverequire(void **data,size_t *sz,size_t rq)
{
  int rc = 1;

  if (rq > HEADERSZ) {
    warn("Header size exceeded while parsing WAVE file");
    parsestate.wave.state = wvFatal;
    *sz = 0;
    return(0); }
  if ((rq -= parsestate.wave.left) <= 0)
    return(rc);
  if (rq > *sz) {rq = *sz; rc = 0;}
  memcpy(parsestate.wave.leftover+parsestate.wave.left,
	 *data,rq);
  parsestate.wave.left      += rq;
  (*(unsigned char **)data) += rq;
  *sz                       -= rq;
  return(rc);
}

/* ...and next we remove this many bytes from the buffer */
static __inline__ void waveremove(size_t rq)
{
  if (parsestate.wave.left <= rq)
    parsestate.wave.left = 0;
  else {
    parsestate.wave.left -= rq;
    memmove(parsestate.wave.leftover,
	    parsestate.wave.leftover+rq,
	    parsestate.wave.left); }
  return;
}

/* Sound files in WAVE format can contain an arbitrary amount of tagged
   chunks; this requires quite some effort for parsing the data */
static size_t parsewave(void **data,size_t *sz,void **outbuf)
{
  for (;;)
    switch (parsestate.wave.state) {
    case wvMain:
      if (!waverequire(data,sz,20))
	return(0);
      /* Keep compatibility with Linux 68k, etc. by not relying on byte-sex  */
      parsestate.wave.chunklength = parsestate.wave.leftover[16] +
	256*(parsestate.wave.leftover[17] +
	     256*(parsestate.wave.leftover[18] +
		  256*parsestate.wave.leftover[19]));
      waveremove(20);
      parsestate.wave.state = wvSubchunk;
      break;
    case wvSubchunk:
      if (!waverequire(data,sz,parsestate.wave.chunklength))
	return(0);
      parsestate.wave.align = parsestate.wave.chunklength < 14 ? 1
	: parsestate.wave.leftover[12];
      if (parsestate.wave.align != 1 &&
	  parsestate.wave.align != 2 &&
	  parsestate.wave.align != 4) {
	warn("Illegal datawidth detected while parsing WAVE file");
	parsestate.wave.state = wvFatal; }
      else
	parsestate.wave.state = wvOutOfBlock;
      waveremove(parsestate.wave.chunklength);
      break;
    case wvOutOfBlock:
      if (!waverequire(data,sz,8))
	return(0);
      /* Keep compatibility with Linux 68k, etc. by not relying on byte-sex  */
      parsestate.wave.chunklength = parsestate.wave.leftover[4] +
	256*(parsestate.wave.leftover[5] +
	     256*(parsestate.wave.leftover[6] +
		  256*(parsestate.wave.leftover[7] & 0x7F)));
      if (memcmp(parsestate.wave.leftover,"data",4))
	parsestate.wave.state = wvSkipChunk;
      else
	parsestate.wave.state = wvSoundChunk;
      waveremove(8);
      break;
    case wvSkipChunk:
      if (parsestate.wave.chunklength > 0 && *sz > 0 &&
	  (signed long)*sz < (signed long)parsestate.wave.chunklength) {
	parsestate.wave.chunklength -= *sz;
	*sz = 0; }
      else {
	if (parsestate.wave.chunklength > 0 && *sz > 0) {
	  *sz -= parsestate.wave.chunklength;
	  (*(unsigned char **)data) += parsestate.wave.chunklength; }
	parsestate.wave.state = wvOutOfBlock; }
      break;
    case wvSoundChunk: {
      size_t count,rq;
      if (parsestate.wave.left) { /* handle leftover bytes from last
				     alignment operation */
	count = parsestate.wave.left;
	rq    = HEADERSZ-count;
	if (rq > (size_t) parsestate.wave.chunklength)
	  rq = parsestate.wave.chunklength;
	if (!waverequire(data,sz,rq)) {
	  parsestate.wave.chunklength -= parsestate.wave.left - count;
	  return(0); }
	parsestate.wave.chunklength -= rq;
	*outbuf                      = parsestate.wave.leftover;
	parsestate.wave.left         = 0;
	return(rq); }
      if (*sz >= (size_t) parsestate.wave.chunklength) {
	count  = parsestate.wave.chunklength;
	rq     = 0; }
      else {
	count  = *sz;
	count -= rq = count % parsestate.wave.align; }
      *outbuf                   = *data;
      (*(unsigned char **)data) += count;
      *sz                       -= count;
      if ((parsestate.wave.chunklength -= count) < parsestate.wave.align) {
	parsestate.wave.state = wvOutOfBlock;
	/* Some broken software (e.g. SOX) attaches junk to the end of a sound
	   chunk; so, let's ignore this... */
	if (parsestate.wave.chunklength)
	  parsestate.wave.state = wvSkipChunk; }
      else if (rq)
	/* align data length to a multiple of datasize; keep additional data
	   in "leftover" buffer --- this is necessary to ensure proper
	   functioning of the sndcnv... routines */
	waverequire(data,sz,rq);
      return(count); }
    case wvFatalNotify:
      warn("Irrecoverable error while parsing WAVE file");
      parsestate.wave.state = wvFatal;
      break;
    case wvFatal:
    default:
      *sz = 0;
      return(0); }
}

/* Strip the header from files in Sun/DEC audio format; this requires some
   extra processing as the header can be an arbitrary size and it might
   result in alignment errors for subsequent conversions --- thus we do
   some buffering, where needed */
static size_t parsesundecaudio(void **data,size_t *sz,void **outbuf)
{
  /* There is data left over from the last invocation of this function; join
     it with the new data and return a sound chunk that is as big as a
     single entry */
  if (parsestate.audio.left) {
    if (parsestate.audio.left + *sz > (size_t) parsestate.audio.align) {
      int  count;
      memmove(parsestate.audio.leftover + parsestate.audio.left,
	      *data,
	      count = parsestate.audio.align - parsestate.audio.left);
      *outbuf = parsestate.audio.leftover;
      *sz    -= count;
      *data   = (*(char **)data) + count;
      parsestate.audio.left = 0;
      return(parsestate.audio.align); }
    else {
      /* We need even more data in order to get one complete single entry! */
      memmove(parsestate.audio.leftover + parsestate.audio.left,
	      *data,
	      *sz);
      *data = (*(char **)data) + *sz;
      parsestate.audio.left += *sz;
      *sz   = 0;
      return(0); } }

  /* This is the main sound chunk, strip of any extra data that does not fit
     the alignment requirements and move these bytes into the leftover buffer*/
  if (parsestate.audio.isdata) {
    int rc = *sz;
    *outbuf = *data;
    if ((parsestate.audio.left = rc % parsestate.audio.align) != 0) {
      memmove(parsestate.audio.leftover,
	      (char *)*outbuf + rc - parsestate.audio.left,
	      parsestate.audio.left);
      rc -= parsestate.audio.left; }
    *sz = 0;
    return(rc); }

  /* This is the first invocation of this function; we need to parse the
     header information and determine how many bytes we need to skip until
     the start of the sound chunk */
  if (!parsestate.audio.skipping) {
    unsigned char *header = (unsigned char *) *data;
    if (*sz < 8) {
      warn("Irrecoverable error while parsing Sun/DEC audio file");
      return(0); }
    /* Keep compatibility with Linux 68k, etc. by not relying on byte-sex  */
    if (header[3]) { /* Sun audio (big endian) */
      parsestate.audio.align = ((header[15] > 2)+1)*header[23];
      parsestate.audio.skipping = header[7]+256*(header[6]+256*
						 (header[5]+256*header[4])); }
    else { /* DEC audio (little endian) */
      parsestate.audio.align = ((header[12] > 2)+1)*header[20];
      parsestate.audio.skipping = header[4]+256*(header[5]+256*
						 (header[6]+256*header[7])); }}

  /* We are skipping extra data that has been attached to header; most usually
     this will be just a comment, such as the original filename and/or the
     creation date. Make sure that we do not return less than one single sound
     sample entry to the caller; if this happens, rather decide to move those
     few bytes into the leftover buffer and deal with it later */
  if (*sz >= (size_t) parsestate.audio.skipping) {
    /* Skip just the header information and return the sound chunk */
    int rc = *sz - parsestate.audio.skipping;
    *outbuf = (char *)*data + parsestate.audio.skipping;
    if ((parsestate.audio.left = rc % parsestate.audio.align) != 0) {
      memmove(parsestate.audio.leftover,
	      (char *)*outbuf + rc - parsestate.audio.left,
	      parsestate.audio.left);
      rc -= parsestate.audio.left; }
    *sz = 0;
    parsestate.audio.skipping = 0;
    parsestate.audio.isdata++;
    return(rc); }
  else {
    /* Skip everything */
    parsestate.audio.skipping -= *sz;
    return(0); }
}

/* If the soundcard could not be set to natively support the data format, we
   try to do some limited on-the-fly conversion to a different format; if
   no conversion is needed, though, we can output directly */
static size_t sndcnvnop(void **data,size_t *sz,void **outbuf)
{
  int rc = *sz;

  *outbuf = *data;
  *sz = 0;
  return(rc);
}

/* Convert 8 bit unsigned stereo data to 8 bit unsigned mono data */
static size_t sndcnv8U_2mono(void **data,size_t *sz,void **outbuf)
{
  REGISTER unsigned char *src;
  REGISTER unsigned char *dest;
  int rc,count;

  count = *sz / 2;
  if (count > SNDBUFSZ) { *sz  -= 2*SNDBUFSZ; count = SNDBUFSZ; }
  else                    *sz   = 0;
  rc      = count;
  src     = (unsigned char *) *data;
  *outbuf =
  dest    = linuxplay_sndbuf;
  while (count--)
    *dest++ = (unsigned char)(((int)*(src)++ +
			       (int)*(src)++) / 2);
  *data   = src;
  return(rc);
}

/* Convert 8 bit signed stereo data to 8 bit signed mono data */
static size_t sndcnv8S_2mono(void **data,size_t *sz,void **outbuf)
{
  REGISTER unsigned char *src;
  REGISTER unsigned char *dest;
  int rc, count;

  count = *sz / 2;
  if (count > SNDBUFSZ) { *sz  -= 2*SNDBUFSZ; count = SNDBUFSZ; }
  else                    *sz   = 0;
  rc      = count;
  src     = (unsigned char *) *data;
  *outbuf =
  dest    = linuxplay_sndbuf;
  while (count--)
    *dest++ = (unsigned char)(((int)*((signed char *)(src++)) +
			       (int)*((signed char *)(src++))) / 2);
  *data   = src;
  return(rc);
}

/* Convert 8 bit signed stereo data to 8 bit unsigned mono data */
static size_t sndcnv2monounsigned(void **data,size_t *sz,void **outbuf)
{
  REGISTER unsigned char *src;
  REGISTER unsigned char *dest;
  int rc,count;

  count = *sz / 2;
  if (count > SNDBUFSZ) { *sz  -= 2*SNDBUFSZ; count = SNDBUFSZ; }
  else                    *sz   = 0;
  rc      = count;
  src     = (unsigned char *) *data;
  *outbuf =
  dest    = linuxplay_sndbuf;
  while (count--)
    *dest++ = (unsigned char)(((int)*((signed char *)(src++)) +
			       (int)*((signed char *)(src++))) / 2) ^ 0x80;
  *data   = src;
  return(rc);
}

/* Convert 8 bit signed mono data to 8 bit unsigned mono data */
static size_t sndcnv2unsigned(void **data,size_t *sz,void **outbuf)
{
  REGISTER unsigned char *src;
  REGISTER unsigned char *dest;
  int rc,count;

  count = *sz;
  if (count > SNDBUFSZ) { *sz  -= SNDBUFSZ; count = SNDBUFSZ; }
  else                    *sz   = 0;
  rc      = count;
  src     = (unsigned char *) *data;
  *outbuf =
  dest    = linuxplay_sndbuf;
  while (count--)
    *dest++ = *(src)++ ^ 0x80;
  *data   = src;
  return(rc);
}

/* Convert a number in the range -32768..32767 to an 8 bit ulaw encoded
   number --- I hope, I got this conversion right :-) */
static __inline__ signed char int2ulaw(int i)
{
    /* Lookup table for fast calculation of number of bits that need shifting*/
    static short int t_bits[128] = {
      0,1,2,2,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
      6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
      7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
      7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7};
    REGISTER int bits,logi;

    /* unrolling this condition (hopefully) improves execution speed */
    if (i < 0) {
      if ((i = (132-i)) > 0x7FFF) i = 0x7FFF;
      logi = (i >> ((bits = t_bits[i/256])+4));
      return((bits << 4 | logi) ^ 0x7F); }
    else {
      if ((i = 132+i) > 0x7FFF) i = 0x7FFF;
      logi = (i >> ((bits = t_bits[i/256])+4));
      return(~(bits << 4 | logi)); }
}

/* Convert 8 bit ulaw stereo data to 8 bit ulaw mono data */
static size_t sndcnvULaw_2mono(void **data,size_t *sz,void **outbuf)
{

  static short int ulaw2int[256] = {
    /* Precomputed lookup table for conversion from ulaw to 15 bit signed */
    -16062,-15550,-15038,-14526,-14014,-13502,-12990,-12478,
    -11966,-11454,-10942,-10430, -9918, -9406, -8894, -8382,
     -7998, -7742, -7486, -7230, -6974, -6718, -6462, -6206,
     -5950, -5694, -5438, -5182, -4926, -4670, -4414, -4158,
     -3966, -3838, -3710, -3582, -3454, -3326, -3198, -3070,
     -2942, -2814, -2686, -2558, -2430, -2302, -2174, -2046,
     -1950, -1886, -1822, -1758, -1694, -1630, -1566, -1502,
     -1438, -1374, -1310, -1246, -1182, -1118, -1054,  -990,
      -942,  -910,  -878,  -846,  -814,  -782,  -750,  -718,
      -686,  -654,  -622,  -590,  -558,  -526,  -494,  -462,
      -438,  -422,  -406,  -390,  -374,  -358,  -342,  -326,
      -310,  -294,  -278,  -262,  -246,  -230,  -214,  -198,
      -186,  -178,  -170,  -162,  -154,  -146,  -138,  -130,
      -122,  -114,  -106,   -98,   -90,   -82,   -74,   -66,
       -60,   -56,   -52,   -48,   -44,   -40,   -36,   -32,
       -28,   -24,   -20,   -16,   -12,    -8,    -4,    +0,
    +16062,+15550,+15038,+14526,+14014,+13502,+12990,+12478,
    +11966,+11454,+10942,+10430, +9918, +9406, +8894, +8382,
     +7998, +7742, +7486, +7230, +6974, +6718, +6462, +6206,
     +5950, +5694, +5438, +5182, +4926, +4670, +4414, +4158,
     +3966, +3838, +3710, +3582, +3454, +3326, +3198, +3070,
     +2942, +2814, +2686, +2558, +2430, +2302, +2174, +2046,
     +1950, +1886, +1822, +1758, +1694, +1630, +1566, +1502,
     +1438, +1374, +1310, +1246, +1182, +1118, +1054,  +990,
      +942,  +910,  +878,  +846,  +814,  +782,  +750,  +718,
      +686,  +654,  +622,  +590,  +558,  +526,  +494,  +462,
      +438,  +422,  +406,  +390,  +374,  +358,  +342,  +326,
      +310,  +294,  +278,  +262,  +246,  +230,  +214,  +198,
      +186,  +178,  +170,  +162,  +154,  +146,  +138,  +130,
      +122,  +114,  +106,   +98,   +90,   +82,   +74,   +66,
       +60,   +56,   +52,   +48,   +44,   +40,   +36,   +32,
       +28,   +24,   +20,   +16,   +12,    +8,    +4,    +0};

  REGISTER unsigned char *src;
  REGISTER unsigned char *dest;
  int rc,count;

  count = *sz / 2;
  if (count > SNDBUFSZ) { *sz  -= 2*SNDBUFSZ; count = SNDBUFSZ; }
  else                    *sz   = 0;
  rc      = count;
  src     = (unsigned char *) *data;
  *outbuf =
  dest    = linuxplay_sndbuf;
  while (count--)
    /* it is not possible to directly interpolate between two ulaw encoded
       data bytes, thus we need to convert to linear format first and later
       we convert back to ulaw format */
    *dest++ = int2ulaw(ulaw2int[*(src)++] +
		       ulaw2int[*(src)++]);
  *data = src;
  return(rc);
}

/* Convert 16 bit little endian signed stereo data to 16 bit little endian
   signed mono data */
static size_t sndcnv16_2monoLE(void **data,size_t *sz,void **outbuf)
{
  REGISTER unsigned char *src;
  REGISTER unsigned char *dest;
  int rc,count;
  signed short i;

  count = *sz / 2;
  if (count > SNDBUFSZ) { *sz  -= 2*SNDBUFSZ; count = SNDBUFSZ; }
  else                    *sz   = 0;
  rc      = count;
  src     = (unsigned char *) *data;
  *outbuf =
  dest    = linuxplay_sndbuf;
  for (count /= 2; count--; ) {
    i = ((int)(src[0]) +
        256*(int)(src[1]) +
	(int)(src[2]) +
	256*(int)(src[3])) / 2;
    src += 4;
    *dest++ = (unsigned char)(i & 0xFF);
    *dest++ = (unsigned char)((i / 256) & 0xFF); }
  *data = src;
  return(rc);
}

/* Convert 16 bit big endian signed stereo data to 16 bit big endian
   signed mono data */
static size_t sndcnv16_2monoBE(void **data,size_t *sz,void **outbuf)
{
  REGISTER unsigned char *src;
  REGISTER unsigned char *dest;
  int rc,count;
  signed short i;

  count = *sz / 2;
  if (count > SNDBUFSZ) { *sz  -= 2*SNDBUFSZ; count = SNDBUFSZ; }
  else                    *sz   = 0;
  rc      = count;
  src     = (unsigned char *) *data;
  *outbuf =
  dest    = linuxplay_sndbuf;
  for (count /= 2; count--; ) {
    i = ((int)(src[1]) +
        256*(int)(src[0]) +
	(int)(src[3]) +
	256*(int)(src[2])) / 2;
    src += 4;
    *dest++ = (unsigned char)((i / 256) & 0xFF);
    *dest++ = (unsigned char)(i & 0xFF); }
  *data = src;
  return(rc);
}

/* Convert 16 bit little endian signed data to 8 bit unsigned data */
static size_t sndcnv2byteLE(void **data,size_t *sz,void **outbuf)
{
  REGISTER unsigned char *src;
  REGISTER unsigned char *dest;
  int rc,count;

  count = *sz / 2;
  if (count > SNDBUFSZ) { *sz  -= 2*SNDBUFSZ; count = SNDBUFSZ; }
  else                    *sz   = 0;
  rc      = count;
  src     = (unsigned char *) *data;
  *outbuf =
  dest    = linuxplay_sndbuf;
  while (count--) {
    *dest++ = (unsigned char)(((signed char *)src)[1] ^ (signed char)0x80);
    src += 2;
  }
  *data = src;
  return(rc);
}

/* Convert 16 bit big endian signed data to 8 bit unsigned data */
static size_t sndcnv2byteBE(void **data,size_t *sz,void **outbuf)
{
  REGISTER unsigned char *src;
  REGISTER unsigned char *dest;
  int rc,count;

  count = *sz / 2;
  if (count > SNDBUFSZ) { *sz  -= 2*SNDBUFSZ; count = SNDBUFSZ; }
  else                    *sz   = 0;
  rc      = count;
  src     = (unsigned char *) *data;
  *outbuf =
  dest    = linuxplay_sndbuf;
  while (count--) {
    *dest++ = (unsigned char)(((signed char *)src)[0] ^ (signed char)0x80);
    src += 2;
  }
  *data = src;
  return(rc);
}

/* Convert 16 bit little endian signed stereo data to 8 bit unsigned
   mono data */
static size_t sndcnv2monobyteLE(void **data,size_t *sz,void **outbuf)
{
  REGISTER unsigned char *src;
  REGISTER unsigned char *dest;
  int rc,count;

  count = *sz / 4;
  if (count > SNDBUFSZ) { *sz  -= 4*SNDBUFSZ; count = SNDBUFSZ; }
  else                    *sz   = 0;
  rc      = count;
  src     = (unsigned char *) *data;
  *outbuf =
  dest    = linuxplay_sndbuf;
  while (count--) {
    *dest++ = (unsigned char)(((int)((signed char *)src)[1] +
			       (int)((signed char *)src)[3]) / 2 ^ 0x80);
    src += 4;
  }
  *data = src;
  return(rc);
}

/* Convert 16 bit big endian signed stereo data to 8 bit unsigned
   mono data */
static size_t sndcnv2monobyteBE(void **data,size_t *sz,void **outbuf)
{
  REGISTER unsigned char *src;
  REGISTER unsigned char *dest;
  int rc,count;

  count = *sz / 4;
  if (count > SNDBUFSZ) { *sz  -= 4*SNDBUFSZ; count = SNDBUFSZ; }
  else                    *sz   = 0;
  rc      = count;
  src     = (unsigned char *) *data;
  *outbuf =
  dest    = linuxplay_sndbuf;
  while (count--) {
    *dest++ = (unsigned char)(((int)((signed char *)src)[0] +
			       (int)((signed char *)src)[2]) / 2 ^ 0x80);
    src += 4;
  }
  *data = src;
  return(rc);
}

/* Look at the header of the sound file and try to determine the format;
   we can recognize files in VOC, WAVE, and, Sun/DEC-audio format--- everything
   else is assumed to be raw 8 bit unsigned data sampled at 8kHz */
static fmtType analyze_format(unsigned char *format,int *fmt,int *speed,
			      int *tracks,
			      size_t (**parsesndfile)(void **,size_t *sz,
						      void **))
{
  /* Keep compatibility with Linux 68k, etc. by not relying on byte-sex  */
  if (!memcmp(format,"Creative Voice File\x1A\x1A\x00",22) &&
              (format[22]+256*format[23]) ==
      ((0x1233-format[24]-256*format[25])&0xFFFF)) { /* VOC */
    *fmt          = AFMT_U8;
    *speed        = 8000;
    *tracks       = 2;
    *parsesndfile = parsevoc;
    return(fmtVoc); }
  else if (!memcmp(format,"RIFF",4) &&
	   !memcmp(format+8,"WAVEfmt ",8)) { /* WAVE */
    if (memcmp(format+20,"\001\000\001"/* PCM mono */,4) &&
	memcmp(format+20,"\001\000\002"/* PCM stereo */,4))
      return(fmtIllegal);
    *fmt          = (format[32]/(*tracks = format[22])) == 1 ?
                    AFMT_U8 : AFMT_S16_LE;
    /* Keep compatibility with Linux 68k, etc. by not relying on byte-sex  */
    *speed        = format[24]+256*(format[25]+256*
				    (format[26]+256*format[27]));
    *parsesndfile = parsewave;
    return(fmtWave); }
  else if (!memcmp(format,".snd",4)) { /* Sun Audio (big endian) */
    if (format[7]+256*(format[6]+256*(format[5]+256*format[4])) < 24) {
      *fmt          = AFMT_MU_LAW;
      *speed        = 8000;
      *tracks       = 1;
      *parsesndfile = parsesundecaudio;
      return(fmtSunAudio); }
    if      (!memcmp(format+12,"\000\000\000\001",4)) *fmt = AFMT_MU_LAW;
    else if (!memcmp(format+12,"\000\000\000\002",4)) *fmt = AFMT_S8;
    else if (!memcmp(format+12,"\000\000\000\003",4)) *fmt = AFMT_S16_BE;
    else return(fmtIllegal);
    /* Keep compatibility with Linux 68k, etc. by not relying on byte-sex  */
    *speed        = format[19]+256*(format[18]+256*
				    (format[17]+256*format[16]));
    *tracks       = format[23];
    *parsesndfile = parsesundecaudio;
    return(fmtSunAudio); }
  else if (!memcmp(format,".sd",4)) { /* DEC Audio (little endian) */
    if (format[4]+256*(format[5]+256*(format[6]+256*format[7])) < 24) {
      *fmt          = AFMT_MU_LAW;
      *speed        = 8000;
      *tracks       = 1;
      *parsesndfile = parsesundecaudio;
      return(fmtSunAudio); }
    if      (!memcmp(format+12,"\001\000\000",4)) *fmt = AFMT_MU_LAW;
    else if (!memcmp(format+12,"\002\000\000",4)) *fmt = AFMT_S8;
    else if (!memcmp(format+12,"\003\000\000",4)) *fmt = AFMT_S16_LE;
    else return(fmtIllegal);
    /* Keep compatibility with Linux 68k, etc. by not relying on byte-sex  */
    *speed        = format[16]+256*(format[17]+256*
				    (format[18]+256*format[19]));
    *tracks       = format[20];
    *parsesndfile = parsesundecaudio;
    return(fmtSunAudio); }
  else {
    *fmt          = AFMT_U8;
    *speed        = 8000;
    *tracks       = 1;
    *parsesndfile = parseraw;
    return(fmtRaw); }
}

/* Initialize the soundcard and mixer device with the parameters that we
   found in the header of the sound file. If the soundcard is not capable of
   natively supporting the required parameters, then try to set up conversion
   routines.
   The difficulty with setting up the sound card is that the parameters are
   not fully orthogonal; changing one of them might affect some of the
   others, too. Thus we do quite a lot of double checking; actually most of
   this is not needed right now, but it will come in handy, if the kernel's
   sounddriver ever changes or if third-party sounddrivers are used. */
static int audio_init(int mixx_fd, int auddio_fd, int fmt, int speed,
		      int tracks, int *volume,
		      size_t (**sndcnv) (void **, size_t *sz, void **))
{
  int i,the_speed,the_stereo,the_fmt;

  *sndcnv = sndcnvnop;

  if (ioctl(auddio_fd,SNDCTL_DSP_SYNC,NULL) < 0) {
    perror("SNDCTL_DSP_SYNC");
    return(0); }

  /* Initialize sound hardware with preferred parameters */

  /* If the sound hardware cannot support 16 bit format or requires a
     different byte sex then try to drop to 8 bit format */

  the_fmt = fmt;
  if(ioctl(audio_fd,SNDCTL_DSP_SETFMT,&the_fmt) < 0) {
  	perror("SNDCTL_DSP_SETFMT");
  	return(0);
  }

  if (fmt != the_fmt) {
    if (fmt == AFMT_S16_LE || fmt == AFMT_S16_BE) {
      *sndcnv = fmt == AFMT_S16_BE ? sndcnv2byteBE : sndcnv2byteLE;
      if (((i=fmt=AFMT_U8),ioctl(audio_fd,SNDCTL_DSP_SETFMT,&i)) < 0 ||
	  fmt != i || ioctl(audio_fd,SNDCTL_DSP_SETFMT,&the_fmt) < 0 ||
	  fmt != the_fmt) {
  	perror("SNDCTL_DSP_SETFMT");
  	return(0); } }
    else if (fmt == AFMT_MU_LAW && the_fmt == AFMT_U8 ) {
      /* the kernel will convert for us */ }
    else {
      perror("SNDCTL_DSP_SETFMT");
      return(0); } }
  else if (fmt == AFMT_S8) {
    *sndcnv = sndcnv2unsigned;
    if (((i=fmt=AFMT_U8),ioctl(audio_fd,SNDCTL_DSP_SETFMT,&i)) < 0 ||
        fmt != i || ioctl(audio_fd,SNDCTL_DSP_SETFMT,&the_fmt) < 0 ||
        fmt != the_fmt) {
      perror("SNDCTRL_DSP_SETFMT");
      return(0); } }

  /* The PCSP driver does not support reading of the sampling rate via the
     SOUND_PCM_READ_RATE ioctl; determine "the_speed" here */
  the_speed = speed; ioctl(audio_fd,SNDCTL_DSP_SPEED,&the_speed);
  /* The PCSP driver does not support reading of the mono/stereo flag, thus
     we assume, that failure to change this mode means we are in mono mode  */
  if (((i = (the_stereo = tracks)-1),ioctl(audio_fd,SNDCTL_DSP_STEREO,&i)) < 0)
    the_stereo = 1;

  /* Try to request stereo playback (if needed); if this cannot be supported
     by the hardware, then install conversion routines for mono playback */

  /* This ioctl will fail if we use the PCSP driver; thus the value of
     "the_stereo" is still unchanged */
  ioctl(audio_fd,SOUND_PCM_READ_CHANNELS,&the_stereo);
  if (tracks != the_stereo) {
    if (tracks == 2) {
      tracks = 1;
      *sndcnv = *sndcnv == sndcnv2byteLE   ? sndcnv2monobyteLE :
              *sndcnv == sndcnv2byteBE   ? sndcnv2monobyteBE :
              *sndcnv == sndcnv2unsigned ? sndcnv2monounsigned :
	the_fmt == AFMT_S16_LE ? sndcnv16_2monoLE :
	the_fmt == AFMT_S16_BE ? sndcnv16_2monoBE :
	the_fmt == AFMT_S8     ? sndcnv8S_2mono :
	the_fmt == AFMT_U8     ? sndcnv8U_2mono :
	the_fmt == AFMT_MU_LAW ? sndcnvULaw_2mono : NULL;
      if (*sndcnv == NULL) { /* this should not happen */
	perror("SNDCTL_DSP_STEREO");
	return(0); }
      /* Switch to mono mode */
      if (((i = 0),ioctl(audio_fd,SNDCTL_DSP_STEREO,&i)) < 0 || i) {
  	perror("SNDCTL_DSP_STEREO");
	return(0); }
      /* Now double check that everything is set as expected */
      if (((i = AFMT_QUERY),ioctl(audio_fd,SNDCTL_DSP_SETFMT,&i)) < 0 ||
	  (i != the_fmt &&
	   (((i=the_fmt),ioctl(audio_fd,SNDCTL_DSP_SETFMT,&i)) < 0 ||
	    i != the_fmt ||
	    ((i = AFMT_QUERY),ioctl(audio_fd,SNDCTL_DSP_SETFMT,&i)) < 0 ||
	    i != the_fmt)) ||
	  (ioctl(audio_fd,SOUND_PCM_READ_CHANNELS,&i) >= 0 &&
	   i != 1)) {
	/* There was no way that we could set the soundcard to a meaningful
           mode */
 	perror("SNDCTL_DSP_SETFMT and SNDCTL_DSP_STEREO");
  	return(0); } }
    else {
      /* Somebody set the soundcard to stereo even though we requested
         mono; this should not happen... */
      if (((i = the_stereo = tracks),ioctl(audio_fd,SNDCTL_DSP_STEREO,&i))<0 ||
	  i != the_stereo-1) {
	perror("SNDCTL_DSP_STEREO");
	return(0); }
      if (((i = AFMT_QUERY),ioctl(audio_fd,SNDCTL_DSP_SETFMT,&i)) < 0 ||
	  i != the_fmt) {
	perror("SNDCTL_DSP_SETFMT");
	return(0); } } }

  /* Fail if deviations from desired sampling frequency are too big */

  /* This ioctl will fail if we use the PCSP driver; thus the value of
     "the_speed" is still unchanged */
  ioctl(audio_fd,SOUND_PCM_READ_RATE,&the_speed);
  if (speed*14 < the_speed*10 || speed*6 > the_speed*10) {
    char buffer[256];
    sprintf(buffer,"SNDCTL_DSP_SPEED (req: %d, rtn: %d)",speed,the_speed);
    perror(buffer);
    return(0); }

  /* Use the mixer device for setting the playback volume */
  if (mixx_fd > 0) {
    int vol = *volume & 0xFF;
    if (ioctl(mixx_fd,SOUND_MIXER_READ_PCM,volume) < 0)
      *volume = -1;
    if (vol < 0) vol = 0; else if (vol > 100) vol = 100;
#ifdef NOVOLUMECTRLFORMULAW
    if (fmt == AFMT_MU_LAW)
      vol = 100;
#endif
    vol |= 256*vol;
    /* Do not signal an error, if volume control is unavailable! */
    ioctl(mixx_fd,SOUND_MIXER_WRITE_PCM,&vol); }

#if defined(LINUXPLAYSTANDALONE) && 1
  /* Debugging output is displayed only when compiled as stand-alone version */
  {int the_volume;
  the_fmt = AFMT_QUERY;
  ioctl(audio_fd,SNDCTL_DSP_SETFMT,&the_fmt);
  ioctl(auddio_fd,SOUND_PCM_READ_CHANNELS,&the_stereo);
  ioctl(auddio_fd,SOUND_PCM_READ_RATE,&the_speed);
  ioctl(mixx_fd,SOUND_MIXER_READ_PCM,&the_volume);
  fprintf(stderr,"%s, %s, %dHz, L:%d/R:%d\n",
	  the_fmt == AFMT_MU_LAW ? "AFMT_MU_LAW" :
	  the_fmt == AFMT_A_LAW ? "AFMT_A_LAW" :
	  the_fmt == AFMT_IMA_ADPCM ? "AFMT_IMA_ADPCM" :
	  the_fmt == AFMT_U8 ? "AFMT_U8" :
	  the_fmt == AFMT_S16_LE ? "AFMT_S16_LE" :
	  the_fmt == AFMT_S16_BE ? "AFMT_S16_BE" :
	  the_fmt == AFMT_S8 ? "AFMT_S8" :
	  the_fmt == AFMT_U16_LE ? "AFMT_U16_LE" :
	  the_fmt == AFMT_U16_BE ? "AFMT_U16_BE" :
	  the_fmt == AFMT_MPEG ? "AFMT_MPEG" :
	  "AFMT_???",
	  the_stereo == 2 ? "stereo" : "mono",
	  the_speed,
	  the_volume / 256, the_volume % 256); }
#endif

  return(1);
}

/* XEmacs requires code both for playback of pre-loaded data and for playback
   from a soundfile; we use one function for both cases */
static void linux_play_data_or_file(int fd,unsigned char *data,
				    int length,int volume)
{
  size_t         (*parsesndfile)(void **dayta,size_t *sz,void **outbuf);
  size_t         (*sndcnv)(void **dayta,size_t *sz,void **);
  fmtType        ffmt;
  int            fmt,speed,tracks;
  unsigned char *pptr,*optr,*cptr,*sptr;
  int            wrtn,rrtn,crtn,prtn;

  /* We need to read at least the header information before we can start
     doing anything */
  if (!data || length < HEADERSZ) {
    if (fd < 0) return;
    else {
      length = read(fd,linuxplay_sndbuf,SNDBUFSZ);
      if (length < HEADERSZ)
	return;
      data   = linuxplay_sndbuf;
      length = SNDBUFSZ; }
  }

  ffmt = analyze_format(data,&fmt,&speed,&tracks,&parsesndfile);

  if (ffmt != fmtRaw && ffmt != fmtSunAudio && ffmt != fmtWave) {
    warn("Unsupported file format (neither RAW, nor Sun/DECAudio, nor WAVE)");
      return; }

  /* The VoxWare-SDK discourages opening /dev/audio; opening /dev/dsp and
     properly initializing it via ioctl() is preferred */
  if ((audio_fd=open(audio_dev, O_WRONLY | O_NONBLOCK, 0)) < 0) {
    perror(audio_dev);
    if (mix_fd > 0 && mix_fd != audio_fd) { close(mix_fd); mix_fd = -1; }
    return; }

  /* The VoxWare-SDK discourages direct manipulation of the mixer device as
     this could lead to problems, when multiple sound cards are installed */
  mix_fd = audio_fd;

  sighup_handler = signal(SIGHUP, sighandler);
  sigint_handler = signal(SIGINT, sighandler);

  if (!audio_init(mix_fd,audio_fd,fmt,speed,tracks,&volume,&sndcnv))
    goto END_OF_PLAY;
  audio_vol = volume;

  /* Initialize global parser state information to zero */
  memset(&parsestate,0,sizeof(parsestate));

  /* Mainloop: read a block of data, parse its contents, perform all
               the necessary conversions and output it to the sound
               device; repeat until all data has been processed */
  rrtn = length;
  do {
    for (pptr = data; (prtn = parsesndfile((void **)&pptr,(size_t *)&rrtn,
					   (void **)&optr)) > 0; )
      for (cptr = optr; (crtn = sndcnv((void **)&cptr,(size_t *) &prtn,
				       (void **)&sptr)) > 0; ) {
	for (;;) {
	  if ((wrtn = write(audio_fd,sptr,crtn)) < 0) {
	    perror("write"); goto END_OF_PLAY; }
	  else if (wrtn) break;
	  else if (ioctl(audio_fd,SNDCTL_DSP_SYNC,NULL) < 0) {
	    perror("SNDCTL_DSP_SYNC"); goto END_OF_PLAY; } }
	if (wrtn != crtn) {
	  char buf[255];
	  sprintf(buf,"play: crtn = %d, wrtn = %d",crtn,wrtn);
	  warn(buf);
	  goto END_OF_PLAY; } }
    if (fd >= 0) {
      if ((rrtn = read(fd,linuxplay_sndbuf,SNDBUFSZ)) < 0) {
	perror("read"); goto END_OF_PLAY; } }
    else
      break;
  } while (rrtn > 0);

  /* Verify that we could fully parse the entire soundfile; this is needed
     only for files in WAVE format */
  if (ffmt == fmtWave && parsestate.wave.state != wvOutOfBlock &&
      parsestate.wave.state != wvFatal)
    warn("Unexpected end of WAVE file");

END_OF_PLAY:
  /* Now cleanup all used resources */

  ioctl(audio_fd,SNDCTL_DSP_SYNC,NULL);
  ioctl(audio_fd,SNDCTL_DSP_RESET,NULL);

  signal(SIGHUP,sighup_handler);
  signal(SIGINT,sigint_handler);

  if (mix_fd > 0) {
    if (audio_vol >= 0) {
      ioctl(mix_fd,SOUND_MIXER_WRITE_PCM,&audio_vol);
      audio_vol = -1; }
    if (mix_fd != audio_fd)
      close(mix_fd);
    mix_fd = -1; }

  close(audio_fd);
  audio_fd = -1;

  return;
}

/* Call "linux_play_data_or_file" with the appropriate parameters for
   playing a soundfile */
void play_sound_file (char *sound_file, int volume);
void play_sound_file (char *sound_file, int volume)
{
  int fd;

  if ((fd=open(sound_file,O_RDONLY,0)) < 0) {
    perror(sound_file);
    return; }
  linux_play_data_or_file(fd,NULL,0,volume);
  close(fd);
  return;
}

/* Call "linux_play_data_or_file" with the appropriate parameters for
   playing pre-loaded data */
void play_sound_data (unsigned char *data, int length, int volume);
void play_sound_data (unsigned char *data, int length, int volume)
{
  linux_play_data_or_file(-1,data,length,volume);
  return;
}
