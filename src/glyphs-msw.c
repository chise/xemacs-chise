/* mswindows-specific glyph objects.
   Copyright (C) 1998 Andy Piper.
   
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

/* written by Andy Piper <andy@xemacs.org> plagerising bits from
   glyphs-x.c */

#include <config.h>
#include "lisp.h"
#include "lstream.h"

#define OEMRESOURCE /* Define OCR_ and friend constants */
#include "console-msw.h"
#include "glyphs-msw.h"
#include "objects-msw.h"

#include "window.h"
#include "elhash.h"
#include "buffer.h"
#include "frame.h"
#include "insdel.h"
#include "opaque.h"
#include "sysfile.h"
#include "faces.h"
#include "imgproc.h"

#ifdef FILE_CODING
#include "file-coding.h"
#endif
#include <stdio.h>
#include <ctype.h>
#ifdef HAVE_XFACE
#include <setjmp.h>
#endif

#define WIDGET_GLYPH_SLOT 0

#ifdef HAVE_XPM
DEFINE_DEVICE_IIFORMAT (mswindows, xpm);
#endif
DEFINE_DEVICE_IIFORMAT (mswindows, xbm);
#ifdef HAVE_XFACE
DEFINE_DEVICE_IIFORMAT (mswindows, xface);
#endif
DEFINE_DEVICE_IIFORMAT (mswindows, button);
DEFINE_DEVICE_IIFORMAT (mswindows, edit);
#if 0
DEFINE_DEVICE_IIFORMAT (mswindows, group);
#endif
DEFINE_DEVICE_IIFORMAT (mswindows, subwindow);
DEFINE_DEVICE_IIFORMAT (mswindows, widget);
DEFINE_DEVICE_IIFORMAT (mswindows, label);
DEFINE_DEVICE_IIFORMAT (mswindows, scrollbar);
DEFINE_DEVICE_IIFORMAT (mswindows, combo);
DEFINE_DEVICE_IIFORMAT (mswindows, progress);
DEFINE_DEVICE_IIFORMAT (mswindows, tree);
DEFINE_DEVICE_IIFORMAT (mswindows, tab);

DEFINE_IMAGE_INSTANTIATOR_FORMAT (bmp);
Lisp_Object Qbmp;
Lisp_Object Vmswindows_bitmap_file_path;
static	COLORREF transparent_color = RGB (1,1,1);

DEFINE_IMAGE_INSTANTIATOR_FORMAT (mswindows_resource);
Lisp_Object Q_resource_type, Q_resource_id;
Lisp_Object Qmswindows_resource;

static void
mswindows_initialize_dibitmap_image_instance (struct Lisp_Image_Instance *ii,
					      enum image_instance_type type);
static void
mswindows_initialize_image_instance_mask (struct Lisp_Image_Instance* image, 
					  struct frame* f);

COLORREF mswindows_string_to_color (CONST char *name);

#define BPLINE(width) ((int)(~3UL & (unsigned long)((width) +3)))

/************************************************************************/
/* convert from a series of RGB triples to a BITMAPINFO formated for the*/
/* proper display 							*/
/************************************************************************/
static BITMAPINFO* convert_EImage_to_DIBitmap (Lisp_Object device,
					       int width, int height,
					       unsigned char *pic,
					       int *bit_count,
					       unsigned char** bmp_data)
{
  struct device *d = XDEVICE (device);
  int i,j;
  RGBQUAD* colortbl;
  int		ncolors;
  BITMAPINFO*	bmp_info;
  unsigned char *ip, *dp;

  if (DEVICE_MSWINDOWS_BITSPIXEL (d) > 0)
    {
      int bpline = BPLINE(width * 3);
      /* FIXME: we can do this because 24bpp implies no color table, once
       * we start palettizing this is no longer true. The X versions of
       * this function quantises to 256 colors or bit masks down to a
       * long. Windows can actually handle rgb triples in the raw so I
       * don't see much point trying to optimize down to the best
       * structure - unless it has memory / color allocation implications
       * .... */
      bmp_info=xnew_and_zero (BITMAPINFO);
      
      if (!bmp_info)
	{
	  return NULL;
	}

      bmp_info->bmiHeader.biBitCount=24; /* just RGB triples for now */
      bmp_info->bmiHeader.biCompression=BI_RGB; /* just RGB triples for now */
      bmp_info->bmiHeader.biSizeImage=width*height*3; 

      /* bitmap data needs to be in blue, green, red triples - in that
	 order, eimage is in RGB format so we need to convert */
      *bmp_data = xnew_array_and_zero (unsigned char, bpline * height);
      *bit_count = bpline * height;

      if (!bmp_data)
	{
	  xfree (bmp_info);
	  return NULL;
	}

      ip = pic;
      for (i = height-1; i >= 0; i--) {
	dp = (*bmp_data) + (i * bpline);
	for (j = 0; j < width; j++) {
	  dp[2] =*ip++;
	  dp[1] =*ip++;
	  *dp   =*ip++;
	  dp += 3;
	}
      }
    }
  else				/* scale to 256 colors */
    {
      int rd,gr,bl;
      quant_table *qtable;
      int bpline = BPLINE (width * 3);
      /* Quantize the image and get a histogram while we're at it.
	 Do this first to save memory */
      qtable = build_EImage_quantable(pic, width, height, 256);
      if (qtable == NULL) return NULL;

      /* use our quantize table to allocate the colors */
      ncolors = qtable->num_active_colors;
      bmp_info=(BITMAPINFO*)xmalloc_and_zero (sizeof(BITMAPINFOHEADER) + 
					     sizeof(RGBQUAD) * ncolors);
      if (!bmp_info)
	{
	  xfree (qtable);
	  return NULL;
	}

      colortbl=(RGBQUAD*)(((unsigned char*)bmp_info)+sizeof(BITMAPINFOHEADER));

      bmp_info->bmiHeader.biBitCount=8; 
      bmp_info->bmiHeader.biCompression=BI_RGB; 
      bmp_info->bmiHeader.biSizeImage=bpline*height;
      bmp_info->bmiHeader.biClrUsed=ncolors; 
      bmp_info->bmiHeader.biClrImportant=ncolors; 
      
      *bmp_data = (unsigned char *) xmalloc_and_zero (bpline * height);
      *bit_count = bpline * height;

      if (!*bmp_data)
	{
	  xfree (qtable);
	  xfree (bmp_info);
	  return NULL;
	}
      
      /* build up an RGBQUAD colortable */
      for (i = 0; i < qtable->num_active_colors; i++) {
	colortbl[i].rgbRed = (BYTE) qtable->rm[i];
	colortbl[i].rgbGreen = (BYTE) qtable->gm[i];
	colortbl[i].rgbBlue = (BYTE) qtable->bm[i];
	colortbl[i].rgbReserved = 0;
      }

      /* now build up the data. picture has to be upside-down and
         back-to-front for msw bitmaps */
      ip = pic;
      for (i = height-1; i >= 0; i--) {
	dp = (*bmp_data) + (i * bpline);
	for (j = 0; j < width; j++) {
	  rd = *ip++;
	  gr = *ip++;
	  bl = *ip++;
	  *dp++ = QUANT_GET_COLOR (qtable,rd,gr,bl);
	}
      }
      xfree (qtable);
    } 
  /* fix up the standard stuff */
  bmp_info->bmiHeader.biWidth=width;
  bmp_info->bmiHeader.biHeight=height;
  bmp_info->bmiHeader.biPlanes=1;
  bmp_info->bmiHeader.biSize=sizeof(BITMAPINFOHEADER);
  bmp_info->bmiHeader.biXPelsPerMeter=0; /* unless you know better */
  bmp_info->bmiHeader.biYPelsPerMeter=0; 

  return bmp_info;
}

/* Given a pixmap filename, look through all of the "standard" places
   where the file might be located.  Return a full pathname if found;
   otherwise, return Qnil. */

static Lisp_Object
mswindows_locate_pixmap_file (Lisp_Object name)
{
  /* This function can GC if IN_REDISPLAY is false */
  Lisp_Object found;

  /* Check non-absolute pathnames with a directory component relative to
     the search path; that's the way Xt does it. */
  if (IS_DIRECTORY_SEP(XSTRING_BYTE (name, 0)) ||
      (XSTRING_BYTE (name, 0) == '.' &&
       (IS_DIRECTORY_SEP(XSTRING_BYTE (name, 1)) ||
	(XSTRING_BYTE (name, 1) == '.' &&
	 (IS_DIRECTORY_SEP(XSTRING_BYTE (name, 2)))))))
    {
      if (!NILP (Ffile_readable_p (name)))
	return name;
      else
	return Qnil;
    }

  if (locate_file (Vmswindows_bitmap_file_path, name, Qnil, &found, R_OK) < 0)
    {
      Lisp_Object temp = list1 (Vdata_directory);
      struct gcpro gcpro1;

      GCPRO1 (temp);
      locate_file (temp, name, Qnil, &found, R_OK);
      UNGCPRO;
    }
    
  return found;
}


/* Initialize an image instance from a bitmap

   DEST_MASK specifies the mask of allowed image types.

   If this fails, signal an error.  INSTANTIATOR is only used
   in the error message. */

static void
init_image_instance_from_dibitmap (struct Lisp_Image_Instance *ii,
				   BITMAPINFO *bmp_info,
				   int dest_mask,
				   void *bmp_data,
				   int bmp_bits,
				   Lisp_Object instantiator, 
				   int x_hot, int y_hot,
				   int create_mask)
{
  Lisp_Object device = IMAGE_INSTANCE_DEVICE (ii);
  struct device *d = XDEVICE (device);
  struct frame *f;
  void* bmp_buf=0;
  int type = 0;
  HBITMAP bitmap;
  HDC hdc;

  if (!DEVICE_MSWINDOWS_P (d))
    signal_simple_error ("Not an mswindows device", device);

  if (NILP (DEVICE_SELECTED_FRAME (d)))
    signal_simple_error ("No selected frame on mswindows device", device);

  f = XFRAME (DEVICE_SELECTED_FRAME (d));
  
  if (dest_mask & IMAGE_COLOR_PIXMAP_MASK)
    type = IMAGE_COLOR_PIXMAP;
  else if (dest_mask & IMAGE_POINTER_MASK)
    type = IMAGE_POINTER;
  else 
    incompatible_image_types (instantiator, dest_mask,
			      IMAGE_COLOR_PIXMAP_MASK | IMAGE_POINTER_MASK);
  hdc = FRAME_MSWINDOWS_CDC (f);

  bitmap=CreateDIBSection (hdc,  
			  bmp_info,
			  DIB_RGB_COLORS,
			  &bmp_buf, 
			  0,0);

  if (!bitmap || !bmp_buf)
    signal_simple_error ("Unable to create bitmap", instantiator);

  /* copy in the actual bitmap */
  memcpy (bmp_buf, bmp_data, bmp_bits);

  mswindows_initialize_dibitmap_image_instance (ii, type);

  IMAGE_INSTANCE_PIXMAP_FILENAME (ii) =
    find_keyword_in_vector (instantiator, Q_file);

  IMAGE_INSTANCE_MSWINDOWS_BITMAP (ii) = bitmap;
  IMAGE_INSTANCE_MSWINDOWS_MASK (ii) = NULL;
  IMAGE_INSTANCE_PIXMAP_WIDTH (ii) = bmp_info->bmiHeader.biWidth;
  IMAGE_INSTANCE_PIXMAP_HEIGHT (ii) = bmp_info->bmiHeader.biHeight;
  IMAGE_INSTANCE_PIXMAP_DEPTH (ii) = bmp_info->bmiHeader.biBitCount;
  XSETINT (IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (ii), x_hot);
  XSETINT (IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (ii), y_hot);

  if (create_mask)
    {
      mswindows_initialize_image_instance_mask (ii, f);
    }
  
  if (type == IMAGE_POINTER)
    {
      mswindows_initialize_image_instance_icon(ii, TRUE);
    }
}

static void
mswindows_init_image_instance_from_eimage (struct Lisp_Image_Instance *ii,
					   int width, int height,
					   unsigned char *eimage, 
					   int dest_mask,
					   Lisp_Object instantiator,
					   Lisp_Object domain)
{
  Lisp_Object device = IMAGE_INSTANCE_DEVICE (ii);
  BITMAPINFO*		bmp_info;
  unsigned char*	bmp_data;
  int			bmp_bits;
  COLORREF		bkcolor;
  
  if (!DEVICE_MSWINDOWS_P (XDEVICE (device)))
    signal_simple_error ("Not an mswindows device", device);

  /* this is a hack but MaskBlt and TransparentBlt are not supported
     on most windows variants */
  bkcolor = COLOR_INSTANCE_MSWINDOWS_COLOR 
    (XCOLOR_INSTANCE (FACE_BACKGROUND (Vdefault_face, domain)));

  /* build a bitmap from the eimage */
  if (!(bmp_info=convert_EImage_to_DIBitmap (device, width, height, eimage,
					     &bmp_bits, &bmp_data)))
    {
      signal_simple_error ("EImage to DIBitmap conversion failed",
			   instantiator);
    }

  /* Now create the pixmap and set up the image instance */
  init_image_instance_from_dibitmap (ii, bmp_info, dest_mask,
				     bmp_data, bmp_bits, instantiator,
				     0, 0, 0);

  xfree (bmp_info);
  xfree (bmp_data);
}

static void set_mono_pixel ( unsigned char* bits, 
			     int bpline, int height, 
			     int x, int y, int white ) 
{ 
  int index;
  unsigned char    bitnum;  
  /* Find the byte on which this scanline begins */
  index = (height - y - 1) * bpline; 
  /* Find the byte containing this pixel */
  index += (x >> 3); 
  /* Which bit is it? */
  bitnum = (unsigned char)( 7 - (x % 8) );  
  if( white )         /* Turn it on */
    bits[index] |= (1<<bitnum);
  else         /* Turn it off */
    bits[index] &= ~(1<<bitnum); 
} 

static void
mswindows_initialize_image_instance_mask (struct Lisp_Image_Instance* image, 
					  struct frame* f)
{
  HBITMAP mask;
  HGDIOBJ old = NULL;
  HDC hcdc = FRAME_MSWINDOWS_CDC (f);
  unsigned char* dibits;
  BITMAPINFO* bmp_info = 
    xmalloc_and_zero (sizeof(BITMAPINFO) + sizeof(RGBQUAD));
  int i, j;
  int height = IMAGE_INSTANCE_PIXMAP_HEIGHT (image);
  
  void* and_bits; 
  int maskbpline = BPLINE (((IMAGE_INSTANCE_PIXMAP_WIDTH (image)+7)/8));
  int bpline = BPLINE (IMAGE_INSTANCE_PIXMAP_WIDTH (image) * 3); 

  if (!bmp_info)
    return;

  bmp_info->bmiHeader.biWidth=IMAGE_INSTANCE_PIXMAP_WIDTH (image);
  bmp_info->bmiHeader.biHeight = height;
  bmp_info->bmiHeader.biPlanes=1;
  bmp_info->bmiHeader.biSize=sizeof(BITMAPINFOHEADER);
  bmp_info->bmiHeader.biBitCount=1; 
  bmp_info->bmiHeader.biCompression=BI_RGB; 
  bmp_info->bmiHeader.biClrUsed = 2; 
  bmp_info->bmiHeader.biClrImportant = 2; 
  bmp_info->bmiHeader.biSizeImage = height * maskbpline; 
  bmp_info->bmiColors[0].rgbRed = 0;
  bmp_info->bmiColors[0].rgbGreen = 0;
  bmp_info->bmiColors[0].rgbBlue = 0;
  bmp_info->bmiColors[0].rgbReserved = 0;
  bmp_info->bmiColors[1].rgbRed = 255;
  bmp_info->bmiColors[1].rgbGreen = 255;
  bmp_info->bmiColors[1].rgbBlue = 255;
  bmp_info->bmiColors[0].rgbReserved = 0;
    
  if (!(mask = CreateDIBSection (hcdc,  
				 bmp_info,
				 DIB_RGB_COLORS,
				 &and_bits, 
				 0,0)))
    {
      xfree (bmp_info);
      return;
    }

  old = SelectObject (hcdc, IMAGE_INSTANCE_MSWINDOWS_BITMAP (image));
  /* build up an in-memory set of bits to mess with */
  xzero (*bmp_info);

  bmp_info->bmiHeader.biWidth=IMAGE_INSTANCE_PIXMAP_WIDTH (image);
  bmp_info->bmiHeader.biHeight = -height;
  bmp_info->bmiHeader.biPlanes=1;
  bmp_info->bmiHeader.biSize=sizeof(BITMAPINFOHEADER);
  bmp_info->bmiHeader.biBitCount=24; 
  bmp_info->bmiHeader.biCompression=BI_RGB; 
  bmp_info->bmiHeader.biClrUsed = 0; 
  bmp_info->bmiHeader.biClrImportant = 0; 
  bmp_info->bmiHeader.biSizeImage = height * bpline;

  dibits = xmalloc_and_zero (bpline * height);
  if (GetDIBits (hcdc,
		 IMAGE_INSTANCE_MSWINDOWS_BITMAP (image),
		 0,
		 height,
		 dibits,
		 bmp_info,
		 DIB_RGB_COLORS) <= 0)
    {
      xfree (bmp_info);
      return;
    }

  /* now set the colored bits in the mask and transparent ones to
     black in the original */
  for(i=0; i<IMAGE_INSTANCE_PIXMAP_WIDTH (image); i++)     
    { 
      for(j=0; j<height; j++)         
	{ 
	  unsigned char* idx = &dibits[j * bpline + i * 3];

	  if( RGB (idx[2], idx[1], idx[0]) == transparent_color )
	    { 
	      idx[0] = idx[1] = idx[2] = 0;
	      set_mono_pixel( and_bits, maskbpline, height, i, j, TRUE );
	    }
	  else             
	    { 
	      set_mono_pixel( and_bits, maskbpline, height, i, j, FALSE );
            }
	}
    }

  SetDIBits (hcdc,
	     IMAGE_INSTANCE_MSWINDOWS_BITMAP (image),
	     0,
	     height,
	     dibits,
	     bmp_info,
	     DIB_RGB_COLORS);

  xfree (bmp_info);
  xfree (dibits);
  
  SelectObject(hcdc, old);

  IMAGE_INSTANCE_MSWINDOWS_MASK (image) = mask;
}

void
mswindows_initialize_image_instance_icon (struct Lisp_Image_Instance* image,
					  int cursor)
{
  ICONINFO x_icon;

  /* we rely on windows to do any resizing necessary */
  x_icon.fIcon=cursor ? FALSE : TRUE;
  x_icon.xHotspot=XINT (IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (image));
  x_icon.yHotspot=XINT (IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (image));
  x_icon.hbmMask=IMAGE_INSTANCE_MSWINDOWS_MASK (image);
  x_icon.hbmColor=IMAGE_INSTANCE_MSWINDOWS_BITMAP (image);
  
  IMAGE_INSTANCE_MSWINDOWS_ICON (image)=
    CreateIconIndirect (&x_icon);
}

HBITMAP
mswindows_create_resized_bitmap (struct Lisp_Image_Instance* ii,
				 struct frame* f,
				 int newx, int newy)
{
  HBITMAP newbmp;
  HGDIOBJ old1, old2;
  HDC hcdc = FRAME_MSWINDOWS_CDC (f);
  HDC hdcDst = CreateCompatibleDC (hcdc);  
  
  old1 = SelectObject (hcdc, IMAGE_INSTANCE_MSWINDOWS_BITMAP (ii)); 
  
  newbmp = CreateCompatibleBitmap (hcdc, newx, newy);

  old2 = SelectObject (hdcDst, newbmp);
  
  if (!StretchBlt (hdcDst, 0, 0, newx, newy,
		   hcdc, 0, 0, 
		   IMAGE_INSTANCE_PIXMAP_WIDTH (ii), 
		   IMAGE_INSTANCE_PIXMAP_HEIGHT (ii), 
		   SRCCOPY))
    {
      DeleteObject (newbmp);
      DeleteDC (hdcDst);
      return 0;
    }

  SelectObject (hdcDst, old2);
  SelectObject (hcdc, old1);
  DeleteDC (hdcDst);

  return newbmp;
}

HBITMAP
mswindows_create_resized_mask (struct Lisp_Image_Instance* ii,
			       struct frame* f,
			       int newx, int newy)
{
  if (IMAGE_INSTANCE_MSWINDOWS_MASK (ii))
    {
      HBITMAP newmask;
      HGDIOBJ old1, old2;
      HDC hcdc = FRAME_MSWINDOWS_CDC (f);
      HDC hdcDst = CreateCompatibleDC (hcdc);  
  
      old1 = SelectObject (hcdc, IMAGE_INSTANCE_MSWINDOWS_MASK (ii)); 
      newmask = CreateCompatibleBitmap(hcdc, newx, newy);
      old2 = SelectObject (hdcDst, newmask);

      if (!StretchBlt(hdcDst, 0, 0, newx, newy,
		      hcdc, 0, 0, 
		      IMAGE_INSTANCE_PIXMAP_WIDTH (ii), 
		      IMAGE_INSTANCE_PIXMAP_HEIGHT (ii), 
		      SRCCOPY))
	{
	  DeleteObject (newmask);
	  DeleteDC (hdcDst);
	  return NULL;
	}
      
      SelectObject (hdcDst, old2);
      SelectObject (hcdc, old1);

      DeleteDC (hdcDst);

      return newmask;
    }

  return NULL;
}

int
mswindows_resize_dibitmap_instance (struct Lisp_Image_Instance* ii,
				    struct frame* f,
				    int newx, int newy)
{
  HBITMAP newbmp = mswindows_create_resized_bitmap (ii, f, newx, newy);
  HBITMAP newmask = mswindows_create_resized_mask (ii, f, newx, newy);

  if (!newbmp)
    return FALSE;
  
  if (IMAGE_INSTANCE_MSWINDOWS_BITMAP (ii))
    DeleteObject (IMAGE_INSTANCE_MSWINDOWS_BITMAP (ii));
  if (IMAGE_INSTANCE_MSWINDOWS_MASK (ii))
    DeleteObject (IMAGE_INSTANCE_MSWINDOWS_MASK (ii));

  IMAGE_INSTANCE_MSWINDOWS_BITMAP (ii) = newbmp;
  IMAGE_INSTANCE_MSWINDOWS_MASK (ii) = newmask;
  IMAGE_INSTANCE_PIXMAP_WIDTH (ii) = newx;
  IMAGE_INSTANCE_PIXMAP_HEIGHT (ii) = newy;

  return TRUE;
}

/**********************************************************************
 *                               XPM                                  *
 **********************************************************************/

#ifdef HAVE_XPM

struct color_symbol
{
  char*		name;
  COLORREF	color;
};

static struct color_symbol*
extract_xpm_color_names (Lisp_Object device,
			 Lisp_Object domain,
			 Lisp_Object color_symbol_alist,
			 int* nsymbols)
{
  /* This function can GC */
  Lisp_Object rest;
  Lisp_Object results = Qnil;
  int i, j;
  struct color_symbol *colortbl;
  struct gcpro gcpro1, gcpro2;

  GCPRO2 (results, device);

  /* We built up results to be (("name" . #<color>) ...) so that if an
     error happens we don't lose any malloc()ed data, or more importantly,
     leave any pixels allocated in the server. */
  i = 0;
  LIST_LOOP (rest, color_symbol_alist)
    {
      Lisp_Object cons = XCAR (rest);
      Lisp_Object name = XCAR (cons);
      Lisp_Object value = XCDR (cons);
      if (NILP (value))
	continue;
      if (STRINGP (value))
	value =
	  Fmake_color_instance
	  (value, device, encode_error_behavior_flag (ERROR_ME_NOT));
      else
        {
          assert (COLOR_SPECIFIERP (value));
          value = Fspecifier_instance (value, domain, Qnil, Qnil);
        }
      if (NILP (value))
        continue;
      results = noseeum_cons (noseeum_cons (name, value), results);
      i++;
    }
  UNGCPRO;			/* no more evaluation */

  *nsymbols=i;
  if (i == 0) return 0;

  colortbl = xnew_array_and_zero (struct color_symbol, i);

  for (j=0; j<i; j++)
    {
      Lisp_Object cons = XCAR (results);
      colortbl[j].color = 
	COLOR_INSTANCE_MSWINDOWS_COLOR (XCOLOR_INSTANCE (XCDR (cons)));

      GET_C_STRING_OS_DATA_ALLOCA (XCAR (cons), colortbl[j].name);
      colortbl[j].name = xstrdup (colortbl[j].name); /* mustn't lose this when we return */
      free_cons (XCONS (cons));
      cons = results;
      results = XCDR (results);
      free_cons (XCONS (cons));
    }
  return colortbl;
}

static int xpm_to_eimage (Lisp_Object image, CONST Extbyte *buffer,
			  unsigned char** data,
			  int* width, int* height,
			  int* x_hot, int* y_hot,
			  int* transp,
			  struct color_symbol* color_symbols,
			  int nsymbols)
{
  XpmImage xpmimage;
  XpmInfo xpminfo;
  int result, i, j, transp_idx, maskbpline;
  unsigned char* dptr;
  unsigned int* sptr;
  COLORREF color; /* the american spelling virus hits again .. */
  COLORREF* colortbl; 

  xzero (xpmimage);
  xzero (xpminfo);
  xpminfo.valuemask=XpmHotspot;
  *transp=FALSE;

  result = XpmCreateXpmImageFromBuffer ((char*)buffer,
				       &xpmimage,
				       &xpminfo);
  switch (result)
    {
    case XpmSuccess:
      break;
    case XpmFileInvalid:
      {
	signal_simple_error ("Invalid XPM data", image);
      }
    case XpmNoMemory:
      {
	signal_double_file_error ("Parsing pixmap data",
				  "out of memory", image);
      }
    default:
      {
	signal_double_file_error_2 ("Parsing pixmap data",
				    "unknown error code",
				    make_int (result), image);
      }
    }
  
  *width = xpmimage.width;
  *height = xpmimage.height;
  maskbpline = BPLINE (((~7UL & (unsigned long)(*width + 7)) / 8));
  
  *data = xnew_array_and_zero (unsigned char, *width * *height * 3);

  if (!*data)
    {
      XpmFreeXpmImage (&xpmimage);
      XpmFreeXpmInfo (&xpminfo);
      return 0;
    }

  /* build a color table to speed things up */
  colortbl = xnew_array_and_zero (COLORREF, xpmimage.ncolors);
  if (!colortbl)
    {
      xfree (*data);
      XpmFreeXpmImage (&xpmimage);
      XpmFreeXpmInfo (&xpminfo);
      return 0;
    }

  for (i=0; i<xpmimage.ncolors; i++)
    {
      /* goto alert!!!! */
      /* pick up symbolic colors in preference */
      if (xpmimage.colorTable[i].symbolic)
	{
	  if (!strcasecmp (xpmimage.colorTable[i].symbolic,"BgColor")
	      ||
	      !strcasecmp (xpmimage.colorTable[i].symbolic,"None"))
	    {
	      *transp=TRUE;
	      colortbl[i]=transparent_color; 
	      transp_idx=i;
	      goto label_found_color;
	    }
	  else if (color_symbols)
	    {
	      for (j = 0; j<nsymbols; j++)
		{
		  if (!strcmp (xpmimage.colorTable[i].symbolic,
			       color_symbols[j].name ))
		    {
		      colortbl[i]=color_symbols[j].color;
		      goto label_found_color;
		    }
		}
	    }
	  else if (xpmimage.colorTable[i].c_color == 0)
	    {
	      goto label_no_color;
	    }
	}
      /* pick up transparencies */
      if (!strcasecmp (xpmimage.colorTable[i].c_color,"None"))
	{
	  *transp=TRUE;
	  colortbl[i]=transparent_color; 
	  transp_idx=i;
	  goto label_found_color;
	}
      /* finally pick up a normal color spec */
      if (xpmimage.colorTable[i].c_color)
	{
	  colortbl[i]=
	    mswindows_string_to_color (xpmimage.colorTable[i].c_color);
	  goto label_found_color;
	}
      
    label_no_color:
      xfree (*data);
      xfree (colortbl);
      XpmFreeXpmImage (&xpmimage);
      XpmFreeXpmInfo (&xpminfo);
      return 0;
      
    label_found_color:;
    }

  /* convert the image */
  sptr=xpmimage.data;
  dptr=*data;
  for (i = 0; i< *width * *height; i++)
    {
      color = colortbl[*sptr++];

      /* split out the 0x02bbggrr colorref into an rgb triple */
      *dptr++=GetRValue (color); /* red */
      *dptr++=GetGValue (color); /* green */
      *dptr++=GetBValue (color); /* blue */
    }

  *x_hot=xpminfo.x_hotspot;
  *y_hot=xpminfo.y_hotspot;

  XpmFreeXpmImage (&xpmimage);
  XpmFreeXpmInfo (&xpminfo);
  xfree (colortbl);
  return TRUE;
}

static void
mswindows_xpm_instantiate (Lisp_Object image_instance,
			   Lisp_Object instantiator,
			   Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			   int dest_mask, Lisp_Object domain)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  Lisp_Object device = IMAGE_INSTANCE_DEVICE (ii);
  CONST Extbyte		*bytes;
  Extcount 		len;
  unsigned char		*eimage;
  int			width, height, x_hot, y_hot;
  BITMAPINFO*		bmp_info;
  unsigned char*	bmp_data;
  int			bmp_bits;
  int 			nsymbols=0, transp;
  struct color_symbol*	color_symbols=NULL;
  
  Lisp_Object data = find_keyword_in_vector (instantiator, Q_data);
  Lisp_Object color_symbol_alist = find_keyword_in_vector (instantiator,
							   Q_color_symbols);

  if (!DEVICE_MSWINDOWS_P (XDEVICE (device)))
    signal_simple_error ("Not an mswindows device", device);

  assert (!NILP (data));

  GET_STRING_BINARY_DATA_ALLOCA (data, bytes, len);

  /* in case we have color symbols */
  color_symbols = extract_xpm_color_names (device, domain,
					   color_symbol_alist, &nsymbols);

  /* convert to an eimage to make processing easier */
  if (!xpm_to_eimage (image_instance, bytes, &eimage, &width, &height,
		      &x_hot, &y_hot, &transp, color_symbols, nsymbols))
    {
      signal_simple_error ("XPM to EImage conversion failed", 
			   image_instance);
    }
  
  if (color_symbols)
    {
      while (nsymbols--)
	{
	  xfree (color_symbols[nsymbols].name);
	}
      xfree(color_symbols);
    }
  
  /* build a bitmap from the eimage */
  if (!(bmp_info=convert_EImage_to_DIBitmap (device, width, height, eimage,
					     &bmp_bits, &bmp_data)))
    {
      signal_simple_error ("XPM to EImage conversion failed",
			   image_instance);
    }
  xfree (eimage);

  /* Now create the pixmap and set up the image instance */
  init_image_instance_from_dibitmap (ii, bmp_info, dest_mask,
				     bmp_data, bmp_bits, instantiator,
				     x_hot, y_hot, transp);

  xfree (bmp_info);
  xfree (bmp_data);
}
#endif /* HAVE_XPM */

/**********************************************************************
 *                               BMP                                  *
 **********************************************************************/

static void
bmp_validate (Lisp_Object instantiator)
{
  file_or_data_must_be_present (instantiator);
}

static Lisp_Object
bmp_normalize (Lisp_Object inst, Lisp_Object console_type)
{
  return simple_image_type_normalize (inst, console_type, Qbmp);
}

static int
bmp_possible_dest_types (void)
{
  return IMAGE_COLOR_PIXMAP_MASK;
}

static void
bmp_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
		 Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		 int dest_mask, Lisp_Object domain)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  Lisp_Object device = IMAGE_INSTANCE_DEVICE (ii);
  CONST Extbyte		*bytes;
  Extcount 		len;
  BITMAPFILEHEADER*	bmp_file_header;
  BITMAPINFO*		bmp_info;
  void*			bmp_data;
  int			bmp_bits;
  Lisp_Object data = find_keyword_in_vector (instantiator, Q_data);

  if (!DEVICE_MSWINDOWS_P (XDEVICE (device)))
    signal_simple_error ("Not an mswindows device", device);

  assert (!NILP (data));

  GET_STRING_BINARY_DATA_ALLOCA (data, bytes, len);
  
  /* Then slurp the image into memory, decoding along the way.
     The result is the image in a simple one-byte-per-pixel
     format. */
  
  bmp_file_header=(BITMAPFILEHEADER*)bytes;
  bmp_info = (BITMAPINFO*)(bytes + sizeof(BITMAPFILEHEADER));
  bmp_data = (Extbyte*)bytes + bmp_file_header->bfOffBits;
  bmp_bits = bmp_file_header->bfSize - bmp_file_header->bfOffBits;

  /* Now create the pixmap and set up the image instance */
  init_image_instance_from_dibitmap (ii, bmp_info, dest_mask,
				     bmp_data, bmp_bits, instantiator,
				     0, 0, 0);
}


/**********************************************************************
 *                             RESOURCES                              *
 **********************************************************************/

static void
mswindows_resource_validate (Lisp_Object instantiator)
{
  if ((NILP (find_keyword_in_vector (instantiator, Q_file)) 
       &&
       NILP (find_keyword_in_vector (instantiator, Q_resource_id))) 
      ||
      NILP (find_keyword_in_vector (instantiator, Q_resource_type)))
    signal_simple_error ("Must supply :file, :resource-id and :resource-type",
			 instantiator);
}

static Lisp_Object
mswindows_resource_normalize (Lisp_Object inst, Lisp_Object console_type)
{
  /* This function can call lisp */
  Lisp_Object file = Qnil;
  struct gcpro gcpro1, gcpro2;
  Lisp_Object alist = Qnil;

  GCPRO2 (file, alist);

  file = potential_pixmap_file_instantiator (inst, Q_file, Q_data, 
					     console_type);

  if (CONSP (file)) /* failure locating filename */
    signal_double_file_error ("Opening pixmap file",
			      "no such file or directory",
			      Fcar (file));

  if (NILP (file)) /* no conversion necessary */
    RETURN_UNGCPRO (inst);

  alist = tagged_vector_to_alist (inst);

  {
    alist = remassq_no_quit (Q_file, alist);
    alist = Fcons (Fcons (Q_file, file), alist);
  }

  {
    Lisp_Object result = alist_to_tagged_vector (Qmswindows_resource, alist);
    free_alist (alist);
    RETURN_UNGCPRO (result);
  }
}

static int
mswindows_resource_possible_dest_types (void)
{
  return IMAGE_POINTER_MASK | IMAGE_COLOR_PIXMAP_MASK;
}

typedef struct 
{
  char *name;
  int	resource_id;
} resource_t;

#ifndef OCR_ICOCUR
#define OCR_ICOCUR          32647
#define OIC_SAMPLE          32512
#define OIC_HAND            32513
#define OIC_QUES            32514
#define OIC_BANG            32515
#define OIC_NOTE            32516
#define OIC_WINLOGO         32517
#define LR_SHARED           0x8000
#endif

static CONST resource_t bitmap_table[] = 
{
  /* bitmaps */
  { "close", OBM_CLOSE },
  { "uparrow", OBM_UPARROW },
  { "dnarrow", OBM_DNARROW },
  { "rgarrow", OBM_RGARROW },
  { "lfarrow", OBM_LFARROW },
  { "reduce", OBM_REDUCE },
  { "zoom", OBM_ZOOM },
  { "restore", OBM_RESTORE },
  { "reduced", OBM_REDUCED },
  { "zoomd", OBM_ZOOMD },
  { "restored", OBM_RESTORED },
  { "uparrowd", OBM_UPARROWD },
  { "dnarrowd", OBM_DNARROWD },
  { "rgarrowd", OBM_RGARROWD },
  { "lfarrowd", OBM_LFARROWD },
  { "mnarrow", OBM_MNARROW },
  { "combo", OBM_COMBO },
  { "uparrowi", OBM_UPARROWI },
  { "dnarrowi", OBM_DNARROWI },
  { "rgarrowi", OBM_RGARROWI },
  { "lfarrowi", OBM_LFARROWI },
  { "size", OBM_SIZE },
  { "btsize", OBM_BTSIZE },
  { "check", OBM_CHECK },
  { "checkboxes", OBM_CHECKBOXES },
  { "btncorners" , OBM_BTNCORNERS },
  {0}
};

static CONST resource_t cursor_table[] = 
{
  /* cursors */
  { "normal", OCR_NORMAL },
  { "ibeam", OCR_IBEAM },
  { "wait", OCR_WAIT },
  { "cross", OCR_CROSS },
  { "up", OCR_UP },
  /* { "icon", OCR_ICON }, */
  { "sizenwse", OCR_SIZENWSE },
  { "sizenesw", OCR_SIZENESW },
  { "sizewe", OCR_SIZEWE },
  { "sizens", OCR_SIZENS },
  { "sizeall", OCR_SIZEALL },
  /* { "icour", OCR_ICOCUR }, */
  { "no", OCR_NO },
  { 0 }
};

static CONST resource_t icon_table[] = 
{
  /* icons */
  { "sample", OIC_SAMPLE },
  { "hand", OIC_HAND },
  { "ques", OIC_QUES },
  { "bang", OIC_BANG },
  { "note", OIC_NOTE },
  { "winlogo", OIC_WINLOGO },
  {0}
};

static int resource_name_to_resource (Lisp_Object name, int type)
{
  CONST resource_t* res = (type == IMAGE_CURSOR ? cursor_table 
			   : type == IMAGE_ICON ? icon_table 
			   : bitmap_table);

  if (INTP (name))
    {
      return XINT (name);
    }
  else if (!STRINGP (name))
    {
      signal_simple_error ("invalid resource identifier", name);
    }
  
  do {
    Extbyte* nm=0;
    GET_C_STRING_OS_DATA_ALLOCA (name, nm);
      if (!strcasecmp ((char*)res->name, nm))
      return res->resource_id;
  } while ((++res)->name);
  return 0;
}

static int
resource_symbol_to_type (Lisp_Object data)
{
  if (EQ (data, Qcursor))
    return IMAGE_CURSOR;
  else if (EQ (data, Qicon))
    return IMAGE_ICON;
  else if (EQ (data, Qbitmap))
    return IMAGE_BITMAP;
  else
    return 0;
}

static void
mswindows_resource_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
		    Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		    int dest_mask, Lisp_Object domain)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  unsigned int type = 0;
  HANDLE himage = NULL;
  LPCTSTR resid=0;
  HINSTANCE hinst = NULL;
  ICONINFO iconinfo;
  int iitype=0;
  char* fname=0;
  Lisp_Object device = IMAGE_INSTANCE_DEVICE (ii);

  Lisp_Object file = find_keyword_in_vector (instantiator, Q_file);
  Lisp_Object resource_type = find_keyword_in_vector (instantiator, 
						      Q_resource_type);
  Lisp_Object resource_id = find_keyword_in_vector (instantiator, 
						    Q_resource_id);

  xzero (iconinfo);

  if (!DEVICE_MSWINDOWS_P (XDEVICE (device)))
    signal_simple_error ("Not an mswindows device", device);

  type = resource_symbol_to_type (resource_type);

  if (dest_mask & IMAGE_POINTER_MASK && type == IMAGE_CURSOR)
    iitype = IMAGE_POINTER;
  else if (dest_mask & IMAGE_COLOR_PIXMAP_MASK)
    iitype = IMAGE_COLOR_PIXMAP;
  else 
    incompatible_image_types (instantiator, dest_mask,
			      IMAGE_COLOR_PIXMAP_MASK | IMAGE_POINTER_MASK);

  /* mess with the keyword info we were provided with */
  if (!NILP (file))
    {
      Extbyte* f=0;
      GET_C_STRING_FILENAME_DATA_ALLOCA (file, f);
#ifdef __CYGWIN32__
      CYGWIN_WIN32_PATH (f, fname);
#else
      fname = f;
#endif
      
      if (NILP (resource_id))
	resid = (LPCTSTR)fname;
      else
	{
	  hinst = LoadLibraryEx (fname, NULL,
				 LOAD_LIBRARY_AS_DATAFILE);
	  resid = MAKEINTRESOURCE (resource_name_to_resource (resource_id,
							   type));
	  
	  if (!resid)
	    GET_C_STRING_OS_DATA_ALLOCA (resource_id, resid);
	}
    }
  else if (!(resid = MAKEINTRESOURCE (resource_name_to_resource (resource_id,
							       type))))
    signal_simple_error ("Invalid resource identifier", resource_id);
  
  /* load the image */
  if (!(himage = LoadImage (hinst, resid, type, 0, 0,
			    LR_CREATEDIBSECTION | LR_DEFAULTSIZE | 
			    LR_SHARED |      
			    (!NILP (file) ? LR_LOADFROMFILE : 0))))
    {
      signal_simple_error ("Cannot load image", instantiator);
    }

  if (hinst)
    FreeLibrary (hinst);

  mswindows_initialize_dibitmap_image_instance (ii, iitype);

  IMAGE_INSTANCE_PIXMAP_FILENAME (ii) = file;
  IMAGE_INSTANCE_PIXMAP_WIDTH (ii) = 
    GetSystemMetrics (type == IMAGE_CURSOR ? SM_CXCURSOR : SM_CXICON);
  IMAGE_INSTANCE_PIXMAP_HEIGHT (ii) = 
    GetSystemMetrics (type == IMAGE_CURSOR ? SM_CYCURSOR : SM_CYICON);
  IMAGE_INSTANCE_PIXMAP_DEPTH (ii) = 1;

  /* hey, we've got an icon type thing so we can reverse engineer the
     bitmap and mask */
  if (type != IMAGE_BITMAP)
    {
      GetIconInfo (himage, &iconinfo);
      IMAGE_INSTANCE_MSWINDOWS_BITMAP (ii) = iconinfo.hbmColor;
      IMAGE_INSTANCE_MSWINDOWS_MASK (ii) = iconinfo.hbmMask;
      XSETINT (IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (ii), iconinfo.xHotspot);
      XSETINT (IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (ii), iconinfo.yHotspot);
      IMAGE_INSTANCE_MSWINDOWS_ICON (ii) = himage;
    }
  else
    {
      IMAGE_INSTANCE_MSWINDOWS_ICON (ii) = NULL;
      IMAGE_INSTANCE_MSWINDOWS_BITMAP (ii) = himage;
      IMAGE_INSTANCE_MSWINDOWS_MASK (ii) = NULL;
      XSETINT (IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (ii), 0);
      XSETINT (IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (ii), 0);
    }
}

static void
check_valid_resource_symbol (Lisp_Object data)
{
  CHECK_SYMBOL (data);
  if (!resource_symbol_to_type (data))
    signal_simple_error ("invalid resource type", data);
}

static void
check_valid_resource_id (Lisp_Object data)
{
  if (!resource_name_to_resource (data, IMAGE_CURSOR)
      &&
      !resource_name_to_resource (data, IMAGE_ICON)
      &&
      !resource_name_to_resource (data, IMAGE_BITMAP))
    signal_simple_error ("invalid resource identifier", data);
}

void
check_valid_string_or_int (Lisp_Object data)
{
  if (!INTP (data))
    CHECK_STRING (data);
  else
    CHECK_INT (data);
}

/**********************************************************************
 *                             XBM                                    *
 **********************************************************************/
#ifndef HAVE_X_WINDOWS
/* $XConsortium: RdBitF.c,v 1.10 94/04/17 20:16:13 kaleb Exp $ */

/*

Copyright (c) 1988  X Consortium

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
X CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of the X Consortium shall not be
used in advertising or otherwise to promote the sale, use or other dealings
in this Software without prior written authorization from the X Consortium.

*/

/*
 * This file contains miscellaneous utility routines and is not part of the
 * Xlib standard.
 *
 * Public entry points:
 *
 *     XmuReadBitmapData		read data from FILE descriptor
 *     XmuReadBitmapDataFromFile	read X10 or X11 format bitmap files
 *					and return data
 *
 * Note that this file and ../X/XRdBitF.c look very similar....  Keep them
 * that way (but don't use common source code so that people can have one 
 * without the other).
 */


/*
 * Based on an optimized version provided by Jim Becker, August 5, 1988.
 */
#ifndef BitmapSuccess
#define BitmapSuccess           0
#define BitmapOpenFailed        1
#define BitmapFileInvalid       2
#define BitmapNoMemory          3
#endif
#define MAX_SIZE 255

/* shared data for the image read/parse logic */
static short hexTable[256];		/* conversion value */
static int initialized = FALSE;	/* easier to fill in at run time */

/*
 *	Table index for the hex values. Initialized once, first time.
 *	Used for translation value or delimiter significance lookup.
 */
static void initHexTable()
{
    /*
     * We build the table at run time for several reasons:
     *
     *     1.  portable to non-ASCII machines.
     *     2.  still reentrant since we set the init flag after setting table.
     *     3.  easier to extend.
     *     4.  less prone to bugs.
     */
    hexTable['0'] = 0;	hexTable['1'] = 1;
    hexTable['2'] = 2;	hexTable['3'] = 3;
    hexTable['4'] = 4;	hexTable['5'] = 5;
    hexTable['6'] = 6;	hexTable['7'] = 7;
    hexTable['8'] = 8;	hexTable['9'] = 9;
    hexTable['A'] = 10;	hexTable['B'] = 11;
    hexTable['C'] = 12;	hexTable['D'] = 13;
    hexTable['E'] = 14;	hexTable['F'] = 15;
    hexTable['a'] = 10;	hexTable['b'] = 11;
    hexTable['c'] = 12;	hexTable['d'] = 13;
    hexTable['e'] = 14;	hexTable['f'] = 15;

    /* delimiters of significance are flagged w/ negative value */
    hexTable[' '] = -1;	hexTable[','] = -1;
    hexTable['}'] = -1;	hexTable['\n'] = -1;
    hexTable['\t'] = -1;
	
    initialized = TRUE;
}

/*
 *	read next hex value in the input stream, return -1 if EOF
 */
static int NextInt ( FILE *fstream )
{
    int	ch;
    int	value = 0;
    int gotone = 0;
    int done = 0;
    
    /* loop, accumulate hex value until find delimiter  */
    /* skip any initial delimiters found in read stream */

    while (!done) {
	ch = getc(fstream);
	if (ch == EOF) {
	    value	= -1;
	    done++;
	} else {
	    /* trim high bits, check type and accumulate */
	    ch &= 0xff;
	    if (isascii(ch) && isxdigit(ch)) {
		value = (value << 4) + hexTable[ch];
		gotone++;
	    } else if ((hexTable[ch]) < 0 && gotone)
	      done++;
	}
    }
    return value;
}


/*
 * The data returned by the following routine is always in left-most byte
 * first and left-most bit first.  If it doesn't return BitmapSuccess then
 * its arguments won't have been touched.  This routine should look as much
 * like the Xlib routine XReadBitmapfile as possible.
 */
int read_bitmap_data (fstream, width, height, datap, x_hot, y_hot)
    FILE *fstream;			/* handle on file  */
    unsigned int *width, *height;	/* RETURNED */
    unsigned char **datap;		/* RETURNED */
    int *x_hot, *y_hot;			/* RETURNED */
{
    unsigned char *data = NULL;		/* working variable */
    char line[MAX_SIZE];		/* input line from file */
    int size;				/* number of bytes of data */
    char name_and_type[MAX_SIZE];	/* an input line */
    char *type;				/* for parsing */
    int value;				/* from an input line */
    int version10p;			/* boolean, old format */
    int padding;			/* to handle alignment */
    int bytes_per_line;			/* per scanline of data */
    unsigned int ww = 0;		/* width */
    unsigned int hh = 0;		/* height */
    int hx = -1;			/* x hotspot */
    int hy = -1;			/* y hotspot */

#define Xmalloc(size) malloc(size)

    /* first time initialization */
    if (initialized == FALSE) initHexTable();

    /* error cleanup and return macro	*/
#define	RETURN(code) { if (data) free (data); return code; }

    while (fgets(line, MAX_SIZE, fstream)) {
	if (strlen(line) == MAX_SIZE-1) {
	    RETURN (BitmapFileInvalid);
	}
	if (sscanf(line,"#define %s %d",name_and_type,&value) == 2) {
	    if (!(type = strrchr(name_and_type, '_')))
	      type = name_and_type;
	    else
	      type++;

	    if (!strcmp("width", type))
	      ww = (unsigned int) value;
	    if (!strcmp("height", type))
	      hh = (unsigned int) value;
	    if (!strcmp("hot", type)) {
		if (type-- == name_and_type || type-- == name_and_type)
		  continue;
		if (!strcmp("x_hot", type))
		  hx = value;
		if (!strcmp("y_hot", type))
		  hy = value;
	    }
	    continue;
	}
    
	if (sscanf(line, "static short %s = {", name_and_type) == 1)
	  version10p = 1;
	else if (sscanf(line,"static unsigned char %s = {",name_and_type) == 1)
	  version10p = 0;
	else if (sscanf(line, "static char %s = {", name_and_type) == 1)
	  version10p = 0;
	else
	  continue;

	if (!(type = strrchr(name_and_type, '_')))
	  type = name_and_type;
	else
	  type++;

	if (strcmp("bits[]", type))
	  continue;
    
	if (!ww || !hh)
	  RETURN (BitmapFileInvalid);

	if ((ww % 16) && ((ww % 16) < 9) && version10p)
	  padding = 1;
	else
	  padding = 0;

	bytes_per_line = (ww+7)/8 + padding;

	size = bytes_per_line * hh;
	data = (unsigned char *) Xmalloc ((unsigned int) size);
	if (!data) 
	  RETURN (BitmapNoMemory);

	if (version10p) {
	    unsigned char *ptr;
	    int bytes;

	    for (bytes=0, ptr=data; bytes<size; (bytes += 2)) {
		if ((value = NextInt(fstream)) < 0)
		  RETURN (BitmapFileInvalid);
		*(ptr++) = value;
		if (!padding || ((bytes+2) % bytes_per_line))
		  *(ptr++) = value >> 8;
	    }
	} else {
	    unsigned char *ptr;
	    int bytes;

	    for (bytes=0, ptr=data; bytes<size; bytes++, ptr++) {
		if ((value = NextInt(fstream)) < 0) 
		  RETURN (BitmapFileInvalid);
		*ptr=value;
	    }
	}
	break;
    }					/* end while */

    if (data == NULL) {
	RETURN (BitmapFileInvalid);
    }

    *datap = data;
    data = NULL;
    *width = ww;
    *height = hh;
    if (x_hot) *x_hot = hx;
    if (y_hot) *y_hot = hy;

    RETURN (BitmapSuccess);
}


int read_bitmap_data_from_file (CONST char *filename, unsigned int *width, 
				unsigned int *height, unsigned char **datap,
				int *x_hot, int *y_hot)
{
    FILE *fstream;
    int status;

    if ((fstream = fopen (filename, "r")) == NULL) {
	return BitmapOpenFailed;
    }
    status = read_bitmap_data (fstream, width, height, datap, x_hot, y_hot);
    fclose (fstream);
    return status;
}
#endif /* HAVE_X_WINDOWS */

/* this table flips four bits around. */
static int flip_table[] =
{
  0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15
};

/* the bitmap data comes in the following format: Widths are padded to
   a multiple of 8.  Scan lines are stored in increasing byte order
   from left to right, little-endian within a byte.  0 = white, 1 =
   black.  It must be converted to the following format: Widths are
   padded to a multiple of 16.  Scan lines are stored in increasing
   byte order from left to right, big-endian within a byte.  0 =
   black, 1 = white.  */
HBITMAP
xbm_create_bitmap_from_data (HDC hdc, char *data,
			     unsigned int width, unsigned int height,
			     int mask, COLORREF fg, COLORREF bg)
{
  int old_width = (width + 7)/8;
  int new_width = BPLINE (2*((width + 15)/16));
  unsigned char *offset;
  void *bmp_buf = 0;
  unsigned char *new_data, *new_offset;
  int i, j;
  BITMAPINFO* bmp_info = 
    xmalloc_and_zero (sizeof(BITMAPINFO) + sizeof(RGBQUAD));
  HBITMAP bitmap;

  if (!bmp_info)
    return NULL;
  
  new_data = (unsigned char *) xmalloc_and_zero (height * new_width);
      
  if (!new_data)
    {
      xfree (bmp_info);
      return NULL;
    }
  
  for (i=0; i<height; i++)
    {
      offset = data + i*old_width;
      new_offset = new_data + i*new_width;

      for (j=0; j<old_width; j++)
	{
	  int byte = offset[j];
	  new_offset[j] = ~ (unsigned char)
	    ((flip_table[byte & 0xf] << 4) + flip_table[byte >> 4]);
	}
    }

  /* if we want a mask invert the bits */
  if (!mask)
    {
      new_offset = &new_data[height * new_width];
      while (new_offset-- != new_data)
	{
	  *new_offset ^= 0xff;
	}
    }

  bmp_info->bmiHeader.biWidth=width;
  bmp_info->bmiHeader.biHeight=-(LONG)height;
  bmp_info->bmiHeader.biPlanes=1;
  bmp_info->bmiHeader.biSize=sizeof(BITMAPINFOHEADER);
  bmp_info->bmiHeader.biBitCount=1; 
  bmp_info->bmiHeader.biCompression=BI_RGB;
  bmp_info->bmiHeader.biClrUsed = 2; 
  bmp_info->bmiHeader.biClrImportant = 2; 
  bmp_info->bmiHeader.biSizeImage = height * new_width; 
  bmp_info->bmiColors[0].rgbRed = GetRValue (fg);
  bmp_info->bmiColors[0].rgbGreen = GetGValue (fg);
  bmp_info->bmiColors[0].rgbBlue = GetBValue (fg);
  bmp_info->bmiColors[0].rgbReserved = 0;
  bmp_info->bmiColors[1].rgbRed = GetRValue (bg);
  bmp_info->bmiColors[1].rgbGreen = GetGValue (bg);
  bmp_info->bmiColors[1].rgbBlue = GetBValue (bg);
  bmp_info->bmiColors[1].rgbReserved = 0;
  
  bitmap = CreateDIBSection (hdc,  
			     bmp_info,
			     DIB_RGB_COLORS,
			     &bmp_buf, 
			     0,0);

  xfree (bmp_info);
  
  if (!bitmap || !bmp_buf)
    {
      xfree (new_data);
      return NULL;
    }
  
  /* copy in the actual bitmap */
  memcpy (bmp_buf, new_data, height * new_width);
  xfree (new_data);

  return bitmap;
}

/* Given inline data for a mono pixmap, initialize the given
   image instance accordingly. */

static void
init_image_instance_from_xbm_inline (struct Lisp_Image_Instance *ii,
				     int width, int height,
				     /* Note that data is in ext-format! */
				     CONST char *bits,
				     Lisp_Object instantiator,
				     Lisp_Object pointer_fg,
				     Lisp_Object pointer_bg,
				     int dest_mask,
				     HBITMAP mask,
				     Lisp_Object mask_filename)
{
  Lisp_Object device = IMAGE_INSTANCE_DEVICE (ii);
  struct frame* f = XFRAME (DEVICE_SELECTED_FRAME (XDEVICE (device)));
  Lisp_Object foreground = find_keyword_in_vector (instantiator, Q_foreground);
  Lisp_Object background = find_keyword_in_vector (instantiator, Q_background);
  enum image_instance_type type;
  COLORREF black = PALETTERGB (0,0,0);
  COLORREF white = PALETTERGB (255,255,255);

  HDC hdc = FRAME_MSWINDOWS_CDC (f);

  if (!DEVICE_MSWINDOWS_P (XDEVICE (device)))
    signal_simple_error ("Not an MS-Windows device", device);

  if ((dest_mask & IMAGE_MONO_PIXMAP_MASK) &&
      (dest_mask & IMAGE_COLOR_PIXMAP_MASK))
    {
      if (!NILP (foreground) || !NILP (background))
	type = IMAGE_COLOR_PIXMAP;
      else
	type = IMAGE_MONO_PIXMAP;
    }
  else if (dest_mask & IMAGE_MONO_PIXMAP_MASK)
    type = IMAGE_MONO_PIXMAP;
  else if (dest_mask & IMAGE_COLOR_PIXMAP_MASK)
    type = IMAGE_COLOR_PIXMAP;
  else if (dest_mask & IMAGE_POINTER_MASK)
    type = IMAGE_POINTER;
  else
    incompatible_image_types (instantiator, dest_mask,
			      IMAGE_MONO_PIXMAP_MASK | IMAGE_COLOR_PIXMAP_MASK
			      | IMAGE_POINTER_MASK);

  mswindows_initialize_dibitmap_image_instance (ii, type);
  
  IMAGE_INSTANCE_PIXMAP_FILENAME (ii) =
    find_keyword_in_vector (instantiator, Q_file);
  IMAGE_INSTANCE_PIXMAP_WIDTH (ii) = width;
  IMAGE_INSTANCE_PIXMAP_HEIGHT (ii) = height;
  IMAGE_INSTANCE_PIXMAP_DEPTH (ii) = 1;
  XSETINT (IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (ii), 0);
  XSETINT (IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (ii), 0);
  IMAGE_INSTANCE_MSWINDOWS_MASK (ii) = mask ? mask :
    xbm_create_bitmap_from_data (hdc, (Extbyte *) bits, width, height, 
				 TRUE, black, white);

  switch (type)
    {
    case IMAGE_MONO_PIXMAP:
      IMAGE_INSTANCE_MSWINDOWS_BITMAP (ii) = 
	xbm_create_bitmap_from_data (hdc, (Extbyte *) bits, width, height, 
				     FALSE, black, black);
      break;

    case IMAGE_COLOR_PIXMAP:
      {
	COLORREF fg = black;
	COLORREF bg = white;

	if (!NILP (foreground) && !COLOR_INSTANCEP (foreground))
	  foreground =
	    Fmake_color_instance (foreground, device,
				  encode_error_behavior_flag (ERROR_ME));

	if (COLOR_INSTANCEP (foreground))
	  fg = COLOR_INSTANCE_MSWINDOWS_COLOR (XCOLOR_INSTANCE (foreground));

	if (!NILP (background) && !COLOR_INSTANCEP (background))
	  background =
	    Fmake_color_instance (background, device,
				  encode_error_behavior_flag (ERROR_ME));

	if (COLOR_INSTANCEP (background))
	  bg = COLOR_INSTANCE_MSWINDOWS_COLOR (XCOLOR_INSTANCE (background));

	IMAGE_INSTANCE_PIXMAP_FG (ii) = foreground;
	IMAGE_INSTANCE_PIXMAP_BG (ii) = background;

	IMAGE_INSTANCE_MSWINDOWS_BITMAP (ii) = 
	  xbm_create_bitmap_from_data (hdc, (Extbyte *) bits, width, height, 
				       FALSE, fg, black);
      }
      break;

    case IMAGE_POINTER:
      {
	COLORREF fg = black;
	COLORREF bg = white;

	if (NILP (foreground))
	  foreground = pointer_fg;
	if (NILP (background))
	  background = pointer_bg;

	IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (ii) = 
	  find_keyword_in_vector (instantiator, Q_hotspot_x);
	IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (ii) = 
	  find_keyword_in_vector (instantiator, Q_hotspot_y);
	IMAGE_INSTANCE_PIXMAP_FG (ii) = foreground;
	IMAGE_INSTANCE_PIXMAP_BG (ii) = background;
	if (COLOR_INSTANCEP (foreground))
	  fg = COLOR_INSTANCE_MSWINDOWS_COLOR (XCOLOR_INSTANCE (foreground));
	if (COLOR_INSTANCEP (background))
	  bg = COLOR_INSTANCE_MSWINDOWS_COLOR (XCOLOR_INSTANCE (background));

	IMAGE_INSTANCE_MSWINDOWS_BITMAP (ii) = 
	  xbm_create_bitmap_from_data (hdc, (Extbyte *) bits, width, height, 
				       TRUE, fg, black);
	mswindows_initialize_image_instance_icon (ii, TRUE);
      }
      break;

    default:
      abort ();
    }
}

static void
xbm_instantiate_1 (Lisp_Object image_instance, Lisp_Object instantiator,
		   Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		   int dest_mask, int width, int height,
		   /* Note that data is in ext-format! */
		   CONST char *bits)
{
  Lisp_Object mask_data = find_keyword_in_vector (instantiator, Q_mask_data);
  Lisp_Object mask_file = find_keyword_in_vector (instantiator, Q_mask_file);
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  struct frame* f = XFRAME (DEVICE_SELECTED_FRAME 
			    (XDEVICE (IMAGE_INSTANCE_DEVICE (ii))));
  HDC hdc = FRAME_MSWINDOWS_CDC (f);
  HBITMAP mask = 0;
  CONST char *gcc_may_you_rot_in_hell;

  if (!NILP (mask_data))
    {
      GET_C_STRING_BINARY_DATA_ALLOCA (XCAR (XCDR (XCDR (mask_data))),
				       gcc_may_you_rot_in_hell);
      mask =
	xbm_create_bitmap_from_data ( hdc,
				      (unsigned char *)
				      gcc_may_you_rot_in_hell,
				      XINT (XCAR (mask_data)),
				      XINT (XCAR (XCDR (mask_data))), FALSE,
				      PALETTERGB (0,0,0),
				      PALETTERGB (255,255,255));
    }

  init_image_instance_from_xbm_inline (ii, width, height, bits,
				       instantiator, pointer_fg, pointer_bg,
				       dest_mask, mask, mask_file);
}

/* Instantiate method for XBM's. */

static void
mswindows_xbm_instantiate (Lisp_Object image_instance, 
			   Lisp_Object instantiator,
			   Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			   int dest_mask, Lisp_Object domain)
{
  Lisp_Object data = find_keyword_in_vector (instantiator, Q_data);
  CONST char *gcc_go_home;

  assert (!NILP (data));

  GET_C_STRING_BINARY_DATA_ALLOCA (XCAR (XCDR (XCDR (data))),
				   gcc_go_home);

  xbm_instantiate_1 (image_instance, instantiator, pointer_fg,
		     pointer_bg, dest_mask, XINT (XCAR (data)),
		     XINT (XCAR (XCDR (data))), gcc_go_home);
}

#ifdef HAVE_XFACE
/**********************************************************************
 *                             X-Face                                 *
 **********************************************************************/
#if defined(EXTERN)
/* This is about to get redefined! */
#undef EXTERN
#endif
/* We have to define SYSV32 so that compface.h includes string.h
   instead of strings.h. */
#define SYSV32
#ifdef __cplusplus
extern "C" {
#endif
#include <compface.h>
#ifdef __cplusplus
}
#endif
/* JMP_BUF cannot be used here because if it doesn't get defined
   to jmp_buf we end up with a conflicting type error with the
   definition in compface.h */
extern jmp_buf comp_env;
#undef SYSV32

static void
mswindows_xface_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
			     Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			     int dest_mask, Lisp_Object domain)
{
  Lisp_Object data = find_keyword_in_vector (instantiator, Q_data);
  int i, stattis;
  char *p, *bits, *bp;
  CONST char * volatile emsg = 0;
  CONST char * volatile dstring;

  assert (!NILP (data));

  GET_C_STRING_BINARY_DATA_ALLOCA (data, dstring);

  if ((p = strchr (dstring, ':')))
    {
      dstring = p + 1;
    }

  /* Must use setjmp not SETJMP because we used jmp_buf above not JMP_BUF */
  if (!(stattis = setjmp (comp_env)))
    {
      UnCompAll ((char *) dstring);
      UnGenFace ();
    }

  switch (stattis)
    {
    case -2:
      emsg = "uncompface: internal error";
      break;
    case -1:
      emsg = "uncompface: insufficient or invalid data";
      break;
    case 1:
      emsg = "uncompface: excess data ignored";
      break;
    }

  if (emsg)
    signal_simple_error_2 (emsg, data, Qimage);

  bp = bits = (char *) alloca (PIXELS / 8);

  /* the compface library exports char F[], which uses a single byte per
     pixel to represent a 48x48 bitmap.  Yuck. */
  for (i = 0, p = F; i < (PIXELS / 8); ++i)
    {
      int n, b;
      /* reverse the bit order of each byte... */
      for (b = n = 0; b < 8; ++b)
	{
	  n |= ((*p++) << b);
	}
      *bp++ = (char) n;
    }

  xbm_instantiate_1 (image_instance, instantiator, pointer_fg,
		     pointer_bg, dest_mask, 48, 48, bits);
}
#endif /* HAVE_XFACE */


/************************************************************************/
/*                      image instance methods                          */
/************************************************************************/

static void
mswindows_print_image_instance (struct Lisp_Image_Instance *p,
				Lisp_Object printcharfun,
				int escapeflag)
{
  char buf[100];

  switch (IMAGE_INSTANCE_TYPE (p))
    {
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      sprintf (buf, " (0x%lx", 
	       (unsigned long) IMAGE_INSTANCE_MSWINDOWS_BITMAP (p));
      write_c_string (buf, printcharfun);
      if (IMAGE_INSTANCE_MSWINDOWS_MASK (p))
	{
	  sprintf (buf, "/0x%lx", 
		   (unsigned long) IMAGE_INSTANCE_MSWINDOWS_MASK (p));
	  write_c_string (buf, printcharfun);
	}
      write_c_string (")", printcharfun);
      break;

    default:
      break;
    }
}

static void
mswindows_finalize_image_instance (struct Lisp_Image_Instance *p)
{
  if (DEVICE_LIVE_P (XDEVICE (p->device)))
    {
      if (IMAGE_INSTANCE_TYPE (p) == IMAGE_WIDGET
	  || 
	  IMAGE_INSTANCE_TYPE (p) == IMAGE_SUBWINDOW)
	{
	  if (IMAGE_INSTANCE_SUBWINDOW_ID (p))
	    DestroyWindow (WIDGET_INSTANCE_MSWINDOWS_HANDLE (p));
	  IMAGE_INSTANCE_SUBWINDOW_ID (p) = 0;
	}
      else if (p->data)
	{
	  if (IMAGE_INSTANCE_MSWINDOWS_BITMAP (p))
	    DeleteObject (IMAGE_INSTANCE_MSWINDOWS_BITMAP (p));
	  IMAGE_INSTANCE_MSWINDOWS_BITMAP (p) = 0;
	  if (IMAGE_INSTANCE_MSWINDOWS_MASK (p))
	    DeleteObject (IMAGE_INSTANCE_MSWINDOWS_MASK (p));
	  IMAGE_INSTANCE_MSWINDOWS_MASK (p) = 0;
	  if (IMAGE_INSTANCE_MSWINDOWS_ICON (p))
	    DestroyIcon (IMAGE_INSTANCE_MSWINDOWS_ICON (p));
	  IMAGE_INSTANCE_MSWINDOWS_ICON (p) = 0;
	}
    }

  if (p->data)
    {
      xfree (p->data);
      p->data = 0;
    }
}

/************************************************************************/
/*                      subwindow and widget support                      */
/************************************************************************/

/* unmap the image if it is a widget. This is used by redisplay via
   redisplay_unmap_subwindows */
static void
mswindows_unmap_subwindow (struct Lisp_Image_Instance *p)
{
  if (IMAGE_INSTANCE_SUBWINDOW_ID (p))
    {
      SetWindowPos (WIDGET_INSTANCE_MSWINDOWS_HANDLE (p), 
		    NULL, 
		    0, 0, 0, 0,
		    SWP_HIDEWINDOW | SWP_NOMOVE | SWP_NOSIZE 
		    | SWP_NOCOPYBITS | SWP_NOSENDCHANGING);
    }
}

/* map the subwindow. This is used by redisplay via
   redisplay_output_subwindow */
static void
mswindows_map_subwindow (struct Lisp_Image_Instance *p, int x, int y)
{
  /*  ShowWindow (WIDGET_INSTANCE_MSWINDOWS_HANDLE (p), SW_SHOW);*/
  SetWindowPos (WIDGET_INSTANCE_MSWINDOWS_HANDLE (p), 
		NULL, 
		x, y, 0, 0,
		SWP_NOZORDER | SWP_SHOWWINDOW | SWP_NOSIZE
		| SWP_NOCOPYBITS | SWP_NOSENDCHANGING);
}

/* when you click on a widget you may activate another widget this
   needs to be checked and all appropriate widgets updated */
static void
mswindows_update_subwindow (struct Lisp_Image_Instance *p)
{
  if (IMAGE_INSTANCE_TYPE (p) == IMAGE_WIDGET)
    {
      /* buttons checked or otherwise */
      if ( EQ (IMAGE_INSTANCE_WIDGET_TYPE (p), Qbutton))
	{
	  if (gui_item_selected_p (IMAGE_INSTANCE_WIDGET_SINGLE_ITEM (p)))
	    SendMessage (WIDGET_INSTANCE_MSWINDOWS_HANDLE (p), 
			 BM_SETCHECK, (WPARAM)BST_CHECKED, 0); 
	  else
	    SendMessage (WIDGET_INSTANCE_MSWINDOWS_HANDLE (p),
			 BM_SETCHECK, (WPARAM)BST_UNCHECKED, 0);
	}
    }
}

/* register widgets into our hastable so that we can cope with the
   callbacks. The hashtable is weak so deregistration is handled
   automatically */
static int
mswindows_register_gui_item (Lisp_Object gui, Lisp_Object domain)
{
  Lisp_Object frame = FW_FRAME (domain);
  struct frame* f = XFRAME (frame);
  int id = gui_item_id_hash (FRAME_MSWINDOWS_WIDGET_HASH_TABLE (f),
			     gui,
			     WIDGET_GLYPH_SLOT);
  Fputhash (make_int (id),
	    XGUI_ITEM (gui)->callback,
	    FRAME_MSWINDOWS_WIDGET_HASH_TABLE (f));
  return id;
}

static int
mswindows_register_widget_instance (Lisp_Object instance, Lisp_Object domain)
{
  return mswindows_register_gui_item (XIMAGE_INSTANCE_WIDGET_SINGLE_ITEM (instance),
				      domain);
}

static void
mswindows_subwindow_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
				 Lisp_Object pointer_fg, Lisp_Object pointer_bg,
				 int dest_mask, Lisp_Object domain)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  Lisp_Object device = IMAGE_INSTANCE_DEVICE (ii);
  struct device* d = XDEVICE (device);
  Lisp_Object frame = FW_FRAME (domain);
  HWND wnd;

  if (!DEVICE_MSWINDOWS_P (d))
    signal_simple_error ("Not an mswindows device", device);

  /* have to set the type this late in case there is no device
     instantiation for a widget */
  IMAGE_INSTANCE_TYPE (ii) = IMAGE_SUBWINDOW;

  wnd = CreateWindow( "STATIC",  
		      "",
		      WS_CHILD,  
		      0,         /* starting x position */
		      0,         /* starting y position */
		      IMAGE_INSTANCE_WIDGET_WIDTH (ii),
		      IMAGE_INSTANCE_WIDGET_HEIGHT (ii),
		      FRAME_MSWINDOWS_HANDLE (XFRAME (frame)), /* parent window */
		      0,
		      (HINSTANCE) 
		      GetWindowLong (FRAME_MSWINDOWS_HANDLE (XFRAME (frame)),
				     GWL_HINSTANCE), 
		      NULL);

  SetWindowLong (wnd, GWL_USERDATA, (LONG)LISP_TO_VOID(image_instance));
  IMAGE_INSTANCE_SUBWINDOW_ID (ii) = wnd;
}

static int
mswindows_image_instance_equal (struct Lisp_Image_Instance *p1,
				struct Lisp_Image_Instance *p2, int depth)
{
  switch (IMAGE_INSTANCE_TYPE (p1))
    {
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      if (IMAGE_INSTANCE_MSWINDOWS_BITMAP (p1) 
	  != IMAGE_INSTANCE_MSWINDOWS_BITMAP (p2))
	return 0;
      break;
    
    default:
      break;
    }

  return 1;
}

static unsigned long
mswindows_image_instance_hash (struct Lisp_Image_Instance *p, int depth)
{
  switch (IMAGE_INSTANCE_TYPE (p))
    {
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      return (unsigned long) IMAGE_INSTANCE_MSWINDOWS_BITMAP (p);
    
    default:
      return 0;
    }
}

/* Set all the slots in an image instance structure to reasonable
   default values.  This is used somewhere within an instantiate
   method.  It is assumed that the device slot within the image
   instance is already set -- this is the case when instantiate
   methods are called. */

static void
mswindows_initialize_dibitmap_image_instance (struct Lisp_Image_Instance *ii,
					      enum image_instance_type type)
{
  ii->data = xnew_and_zero (struct mswindows_image_instance_data);
  IMAGE_INSTANCE_TYPE (ii) = type;
  IMAGE_INSTANCE_PIXMAP_FILENAME (ii) = Qnil;
  IMAGE_INSTANCE_PIXMAP_MASK_FILENAME (ii) = Qnil;
  IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (ii) = Qnil;
  IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (ii) = Qnil;
  IMAGE_INSTANCE_PIXMAP_FG (ii) = Qnil;
  IMAGE_INSTANCE_PIXMAP_BG (ii) = Qnil;
}


/************************************************************************/
/*                            widgets                            */
/************************************************************************/
static void
mswindows_widget_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
			      Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			      int dest_mask, Lisp_Object domain,
			      CONST char* class, int flags, int exflags)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
#if 0
  struct Lisp_Image_Instance *groupii = 0;
  Lisp_Object group = find_keyword_in_vector (instantiator, Q_group);
#endif
  Lisp_Object device = IMAGE_INSTANCE_DEVICE (ii), style;
  struct device* d = XDEVICE (device);
  Lisp_Object frame = FW_FRAME (domain);
  Extbyte* nm=0;
  HWND wnd;
  int id = 0xffff;
  Lisp_Object gui = IMAGE_INSTANCE_WIDGET_ITEM (ii);
  struct Lisp_Gui_Item* pgui = XGUI_ITEM (gui);

  if (!DEVICE_MSWINDOWS_P (d))
    signal_simple_error ("Not an mswindows device", device);
#if 0
  /* if the user specified another glyph as a group pick up the
     instance in our domain. */
  if (!NILP (group))
    {
      if (SYMBOLP (group))
	group = XSYMBOL (group)->value;
      group = glyph_image_instance (group, domain, ERROR_ME, 1);
      groupii = XIMAGE_INSTANCE (group);
    }
#endif
  if (!gui_item_active_p (gui))
    flags |= WS_DISABLED;

  style = pgui->style;

  if (!NILP (pgui->callback))
    {
      id = mswindows_register_widget_instance (image_instance, domain);
    }
  /* have to set the type this late in case there is no device
     instantiation for a widget */
  IMAGE_INSTANCE_TYPE (ii) = IMAGE_WIDGET;
  if (!NILP (IMAGE_INSTANCE_WIDGET_TEXT (ii)))
    GET_C_STRING_OS_DATA_ALLOCA (IMAGE_INSTANCE_WIDGET_TEXT (ii), nm);

  wnd = CreateWindowEx( 
		       exflags /* | WS_EX_NOPARENTNOTIFY*/,
		       class,  
		       nm,
		       flags | WS_CHILD,
		       0,         /* starting x position */
		       0,         /* starting y position */
		       IMAGE_INSTANCE_WIDGET_WIDTH (ii),
		       IMAGE_INSTANCE_WIDGET_HEIGHT (ii),
		       /* parent window */
		       FRAME_MSWINDOWS_HANDLE (XFRAME (frame)),
		       (HMENU)id,       /* No menu */
		       (HINSTANCE) 
		       GetWindowLong (FRAME_MSWINDOWS_HANDLE (XFRAME (frame)),
				      GWL_HINSTANCE), 
		       NULL);

  IMAGE_INSTANCE_SUBWINDOW_ID (ii) = wnd;
  SetWindowLong (wnd, GWL_USERDATA, (LONG)LISP_TO_VOID(image_instance));
  /* set the widget font from the widget face */
  SendMessage (wnd, WM_SETFONT, 
	       (WPARAM)FONT_INSTANCE_MSWINDOWS_HFONT 
	       (XFONT_INSTANCE (widget_face_font_info 
				(domain, 
				 IMAGE_INSTANCE_WIDGET_FACE (ii),
				 0, 0))), 
	       MAKELPARAM (TRUE, 0));
}

/* Instantiate a button widget. Unfortunately instantiated widgets are
   particular to a frame since they need to have a parent. It's not
   like images where you just select the image into the context you
   want to display it in and BitBlt it. So images instances can have a
   many-to-one relationship with things you see, whereas widgets can
   only be one-to-one (i.e. per frame) */
static void
mswindows_button_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
			      Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			      int dest_mask, Lisp_Object domain)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  HWND wnd;
  int flags = BS_NOTIFY;
  Lisp_Object style;
  Lisp_Object gui = IMAGE_INSTANCE_WIDGET_ITEM (ii);
  struct Lisp_Gui_Item* pgui = XGUI_ITEM (gui);
  Lisp_Object glyph = find_keyword_in_vector (instantiator, Q_image);

  if (!gui_item_active_p (gui))
    flags |= WS_DISABLED;

  if (!NILP (glyph))
    {
      if (!IMAGE_INSTANCEP (glyph))
	glyph = glyph_image_instance (glyph, domain, ERROR_ME, 1);

      if (IMAGE_INSTANCEP (glyph))
	flags |= XIMAGE_INSTANCE_MSWINDOWS_BITMAP (glyph) ? 
	  BS_BITMAP : BS_ICON;
    }

  style = pgui->style;

  if (EQ (style, Qradio))
    {
      flags |= BS_RADIOBUTTON;
    }
  else if (EQ (style, Qtoggle))
    {
      flags |= BS_AUTOCHECKBOX;
    }
  else
    flags |= BS_DEFPUSHBUTTON;

  mswindows_widget_instantiate (image_instance, instantiator, pointer_fg,
				pointer_bg, dest_mask, domain, "BUTTON", flags, 
				WS_EX_CONTROLPARENT);

  wnd = WIDGET_INSTANCE_MSWINDOWS_HANDLE (ii);
  /* set the checked state */
  if (gui_item_selected_p (gui))
    SendMessage (wnd, BM_SETCHECK, (WPARAM)BST_CHECKED, 0); 
  else
    SendMessage (wnd, BM_SETCHECK, (WPARAM)BST_UNCHECKED, 0);
  /* add the image if one was given */
  if (!NILP (glyph) && IMAGE_INSTANCEP (glyph))
    {
      SendMessage (wnd, BM_SETIMAGE, 
		   (WPARAM) (XIMAGE_INSTANCE_MSWINDOWS_BITMAP (glyph) ? 
			     IMAGE_BITMAP : IMAGE_ICON),
		   (LPARAM) (XIMAGE_INSTANCE_MSWINDOWS_BITMAP (glyph) ?
			     XIMAGE_INSTANCE_MSWINDOWS_BITMAP (glyph) :
			     XIMAGE_INSTANCE_MSWINDOWS_ICON (glyph)));
    }
}

/* instantiate an edit control */
static void
mswindows_edit_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
			    Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			    int dest_mask, Lisp_Object domain)
{
  mswindows_widget_instantiate (image_instance, instantiator, pointer_fg,
				pointer_bg, dest_mask, domain, "EDIT", 
				ES_LEFT | ES_AUTOHSCROLL | WS_TABSTOP
				| WS_BORDER,
				WS_EX_CLIENTEDGE | WS_EX_CONTROLPARENT);
}

/* instantiate a progress gauge */
static void
mswindows_progress_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
				Lisp_Object pointer_fg, Lisp_Object pointer_bg,
				int dest_mask, Lisp_Object domain)
{
  HWND wnd;
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  mswindows_widget_instantiate (image_instance, instantiator, pointer_fg,
				pointer_bg, dest_mask, domain, PROGRESS_CLASS, 
				WS_TABSTOP | WS_BORDER | PBS_SMOOTH,
				WS_EX_CLIENTEDGE | WS_EX_CONTROLPARENT);
  wnd = WIDGET_INSTANCE_MSWINDOWS_HANDLE (ii);
  /* set the colors */
#ifdef PBS_SETBKCOLOR
  SendMessage (wnd, PBS_SETBKCOLOR, 0, 
	       (LPARAM) (COLOR_INSTANCE_MSWINDOWS_COLOR 
			 (XCOLOR_INSTANCE 
			  (FACE_BACKGROUND 
			   (XIMAGE_INSTANCE_WIDGET_FACE (ii),
			    XIMAGE_INSTANCE_SUBWINDOW_FRAME (ii))))));
#endif
#ifdef PBS_SETBARCOLOR
  SendMessage (wnd, PBS_SETBARCOLOR, 0, 
	       (L:PARAM) (COLOR_INSTANCE_MSWINDOWS_COLOR 
			  (XCOLOR_INSTANCE 
			   (FACE_FOREGROUND 
			    (XIMAGE_INSTANCE_WIDGET_FACE (ii),
			     XIMAGE_INSTANCE_SUBWINDOW_FRAME (ii))))));
#endif
}

/* instantiate a tree view widget */
static HTREEITEM add_tree_item (Lisp_Object image_instance,
				HWND wnd, HTREEITEM parent, Lisp_Object entry,
				int children, Lisp_Object domain)
{
  TV_INSERTSTRUCT tvitem;
  HTREEITEM ret;

  tvitem.hParent = parent;
  tvitem.hInsertAfter = TVI_LAST;
  tvitem.item.mask = TVIF_TEXT | TVIF_CHILDREN;
  tvitem.item.cChildren = children;
      
  if (VECTORP (entry))
    {
      /* we always maintain the real gui item at the head of the
         list. We have to put them in the list in the first place
         because the whole model assumes that the glyph instances have
         references to all the associated data. If we didn't do this
         GC would bite us badly. */
      Lisp_Object gui = gui_parse_item_keywords_no_errors (entry);
      if (CONSP (XIMAGE_INSTANCE_WIDGET_ITEM (image_instance)))
	{
	  Lisp_Object rest = 
	    Fcons (gui, XCDR (XIMAGE_INSTANCE_WIDGET_ITEM (image_instance)));
	  Fsetcdr (XIMAGE_INSTANCE_WIDGET_ITEM (image_instance), rest);
	}
      else
	{
	  XIMAGE_INSTANCE_WIDGET_ITEM (image_instance) = 
	    Fcons (XIMAGE_INSTANCE_WIDGET_ITEM (image_instance), gui);
	}

      tvitem.item.lParam = mswindows_register_gui_item (gui, domain);
      tvitem.item.mask |= TVIF_PARAM;
      GET_C_STRING_OS_DATA_ALLOCA (XGUI_ITEM (gui)->name, 
				   tvitem.item.pszText);
    }
  else
    GET_C_STRING_OS_DATA_ALLOCA (entry, tvitem.item.pszText);

  tvitem.item.cchTextMax = strlen (tvitem.item.pszText);

  if ((ret = (HTREEITEM)SendMessage (wnd, TVM_INSERTITEM, 
				     0, (LPARAM)&tvitem)) == 0)
    signal_simple_error ("error adding tree view entry", entry);

  return ret;
}

static void add_tree_item_list (Lisp_Object image_instance,
				HWND wnd, HTREEITEM parent, Lisp_Object list,
				Lisp_Object domain)
{
  Lisp_Object rest;

  /* get the first item */
  parent = add_tree_item (image_instance, wnd, parent, XCAR (list), TRUE, domain);
  /* recursively add items to the tree view */
  LIST_LOOP (rest, XCDR (list))
    {
      if (LISTP (XCAR (rest)))
	add_tree_item_list (image_instance, wnd, parent, XCAR (rest), domain);
      else
	add_tree_item (image_instance, wnd, parent, XCAR (rest), FALSE, domain);
    }
}

static void
mswindows_tree_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
			    Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			    int dest_mask, Lisp_Object domain)
{
  Lisp_Object rest;
  HWND wnd;
  HTREEITEM parent;
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  mswindows_widget_instantiate (image_instance, instantiator, pointer_fg,
				pointer_bg, dest_mask, domain, WC_TREEVIEW, 
				WS_TABSTOP | WS_BORDER | PBS_SMOOTH
				| TVS_HASLINES | TVS_HASBUTTONS,
				WS_EX_CLIENTEDGE | WS_EX_CONTROLPARENT);

  wnd = WIDGET_INSTANCE_MSWINDOWS_HANDLE (ii);
 
  /* define a root */
  parent = add_tree_item (image_instance,
			  wnd, NULL, IMAGE_INSTANCE_WIDGET_TEXT (ii), TRUE,
			  domain);
 
  /* recursively add items to the tree view */
  LIST_LOOP (rest, Fplist_get (IMAGE_INSTANCE_WIDGET_PROPS (ii), Q_items, Qnil))
    {
      if (LISTP (XCAR (rest)))
	add_tree_item_list (image_instance, wnd, parent, XCAR (rest), domain);
      else
	add_tree_item (image_instance, wnd, parent, XCAR (rest), FALSE, domain);
    }
}

/* instantiate a tab control */
static TC_ITEM* add_tab_item (Lisp_Object image_instance,
			     HWND wnd, Lisp_Object entry,
			     Lisp_Object domain, int index)
{
  TC_ITEM tvitem, *ret;

  tvitem.mask = TCIF_TEXT;
      
  if (VECTORP (entry))
    {
      /* we always maintain the real gui item at the head of the
         list. We have to put them in the list in the first place
         because the whole model assumes that the glyph instances have
         references to all the associated data. If we didn't do this
         GC would bite us badly. */
      Lisp_Object gui = gui_parse_item_keywords_no_errors (entry);
      if (CONSP (XIMAGE_INSTANCE_WIDGET_ITEM (image_instance)))
	{
	  Lisp_Object rest = 
	    Fcons (gui, XCDR (XIMAGE_INSTANCE_WIDGET_ITEM (image_instance)));
	  Fsetcdr (XIMAGE_INSTANCE_WIDGET_ITEM (image_instance), rest);
	}
      else
	{
	  XIMAGE_INSTANCE_WIDGET_ITEM (image_instance) = 
	    Fcons (XIMAGE_INSTANCE_WIDGET_ITEM (image_instance), gui);
	}

      tvitem.lParam = mswindows_register_gui_item (gui, domain);
      tvitem.mask |= TCIF_PARAM;
      GET_C_STRING_OS_DATA_ALLOCA (XGUI_ITEM (gui)->name, 
				   tvitem.pszText);
    }
  else
    GET_C_STRING_OS_DATA_ALLOCA (entry, tvitem.pszText);

  tvitem.cchTextMax = strlen (tvitem.pszText);

  if ((ret = (TC_ITEM*)SendMessage (wnd, TCM_INSERTITEM, 
				    index, (LPARAM)&tvitem)) < 0)
    signal_simple_error ("error adding tab entry", entry);

  return ret;
}

static void
mswindows_tab_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
			   Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			   int dest_mask, Lisp_Object domain)
{
  Lisp_Object rest;
  HWND wnd;
  HTREEITEM parent;
  int index = 0;
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  mswindows_widget_instantiate (image_instance, instantiator, pointer_fg,
				pointer_bg, dest_mask, domain, WC_TABCONTROL, 
				/* borders don't suit tabs so well */
				WS_TABSTOP,
				WS_EX_CONTROLPARENT);

  wnd = WIDGET_INSTANCE_MSWINDOWS_HANDLE (ii);
 
  /* add items to the tab */
  LIST_LOOP (rest, Fplist_get (IMAGE_INSTANCE_WIDGET_PROPS (ii), Q_items, Qnil))
    {
      add_tab_item (image_instance, wnd, XCAR (rest), domain, index);
      index++;
    }
}

/* instantiate a static control possible for putting other things in */
static void
mswindows_label_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
			     Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			     int dest_mask, Lisp_Object domain)
{
  mswindows_widget_instantiate (image_instance, instantiator, pointer_fg,
				pointer_bg, dest_mask, domain, "STATIC", 
				0, WS_EX_STATICEDGE);
}

#if 0
/* instantiate a static control possible for putting other things in */
static void
mswindows_group_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
			    Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			    int dest_mask, Lisp_Object domain)
{
  mswindows_widget_instantiate (image_instance, instantiator, pointer_fg,
				pointer_bg, dest_mask, domain, "BUTTON", 
				WS_GROUP | BS_GROUPBOX | WS_BORDER,
				WS_EX_CLIENTEDGE );
}
#endif

/* instantiate a scrollbar control */
static void
mswindows_scrollbar_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
				 Lisp_Object pointer_fg, Lisp_Object pointer_bg,
				 int dest_mask, Lisp_Object domain)
{
  mswindows_widget_instantiate (image_instance, instantiator, pointer_fg,
				pointer_bg, dest_mask, domain, "SCROLLBAR", 
				0,
				WS_EX_CLIENTEDGE );
}

/* instantiate a combo control */
static void
mswindows_combo_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
			     Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			     int dest_mask, Lisp_Object domain)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  HANDLE wnd;
  Lisp_Object rest;

  /* Maybe ought to generalise this more but it may be very windows
     specific. In windows the window height of a combo box is the
     height when the combo box is open. Thus we need to set the height
     before creating the window and then reset it to a single line
     after the window is created so that redisplay does the right
     thing. */
  mswindows_widget_instantiate (image_instance, instantiator, pointer_fg,
				pointer_bg, dest_mask, domain, "COMBOBOX", 
				WS_BORDER | WS_TABSTOP | CBS_DROPDOWN
				| CBS_AUTOHSCROLL  
				| CBS_HASSTRINGS | WS_VSCROLL,
				WS_EX_CLIENTEDGE | WS_EX_CONTROLPARENT);
  /* reset the height */
  widget_text_to_pixel_conversion (domain, 
				   IMAGE_INSTANCE_WIDGET_FACE (ii), 1, 0, 
				   &IMAGE_INSTANCE_SUBWINDOW_HEIGHT (ii), 0);
  wnd = WIDGET_INSTANCE_MSWINDOWS_HANDLE (ii);
  /* add items to the combo box */
  SendMessage (wnd, CB_RESETCONTENT, 0, 0);
  LIST_LOOP (rest, Fplist_get (IMAGE_INSTANCE_WIDGET_PROPS (ii), Q_items, Qnil))
    {
      Extbyte* lparam;
      GET_C_STRING_OS_DATA_ALLOCA (XCAR (rest), lparam);
      if (SendMessage (wnd, CB_ADDSTRING, 0, (LPARAM)lparam) == CB_ERR)
	signal_simple_error ("error adding combo entries", instantiator);
    }
}

/* get properties of a control */
static Lisp_Object
mswindows_widget_property (Lisp_Object image_instance, Lisp_Object prop)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  HANDLE wnd = WIDGET_INSTANCE_MSWINDOWS_HANDLE (ii);
  /* get the text from a control */
  if (EQ (prop, Q_text))
    {
      Extcount len = SendMessage (wnd, WM_GETTEXTLENGTH, 0, 0);
      Extbyte* buf =alloca (len+1);
      
      SendMessage (wnd, WM_GETTEXT, (WPARAM)len+1, (LPARAM) buf);
      return build_ext_string (buf, FORMAT_OS);
    }
  return Qunbound;
}

/* get properties of a button */
static Lisp_Object
mswindows_button_property (Lisp_Object image_instance, Lisp_Object prop)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  HANDLE wnd = WIDGET_INSTANCE_MSWINDOWS_HANDLE (ii);
  /* check the state of a button */
  if (EQ (prop, Q_selected))
    {
      if (SendMessage (wnd, BM_GETSTATE, 0, 0) & BST_CHECKED)
	return Qt;
      else
	return Qnil;
    }
  return Qunbound;
}

/* get properties of a combo box */
static Lisp_Object
mswindows_combo_property (Lisp_Object image_instance, Lisp_Object prop)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  HANDLE wnd = WIDGET_INSTANCE_MSWINDOWS_HANDLE (ii);
  /* get the text from a control */
  if (EQ (prop, Q_text))
    {
      long item = SendMessage (wnd, CB_GETCURSEL, 0, 0);
      Extcount len = SendMessage (wnd, CB_GETLBTEXTLEN, (WPARAM)item, 0);
      Extbyte* buf = alloca (len+1);
      SendMessage (wnd, CB_GETLBTEXT, (WPARAM)item, (LPARAM)buf);
      return build_ext_string (buf, FORMAT_OS);
    }
  return Qunbound;
}

/* set the properties of a control */
static Lisp_Object
mswindows_widget_set_property (Lisp_Object image_instance, Lisp_Object prop,
			       Lisp_Object val)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);

  if (EQ (prop, Q_text))
    {
      Extbyte* lparam=0;
      CHECK_STRING (val);
      GET_C_STRING_OS_DATA_ALLOCA (val, lparam);
      SendMessage (WIDGET_INSTANCE_MSWINDOWS_HANDLE (ii),
		   WM_SETTEXT, 0, (LPARAM)lparam);
      return Qt;
    }
  return Qunbound;
}

/* set the properties of a progres guage */
static Lisp_Object
mswindows_progress_set_property (Lisp_Object image_instance, Lisp_Object prop,
				 Lisp_Object val)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);

  if (EQ (prop, Q_percent))
    {
      CHECK_INT (val);
      SendMessage (WIDGET_INSTANCE_MSWINDOWS_HANDLE (ii),
		   PBM_SETPOS, (WPARAM)XINT (val), 0);
      return Qt;
    }
  return Qunbound;
}


/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
syms_of_glyphs_mswindows (void)
{
  defkeyword (&Q_resource_id, ":resource-id");
  defkeyword (&Q_resource_type, ":resource-type");
}

void
console_type_create_glyphs_mswindows (void)
{
  /* image methods */

  CONSOLE_HAS_METHOD (mswindows, print_image_instance);
  CONSOLE_HAS_METHOD (mswindows, finalize_image_instance);
  CONSOLE_HAS_METHOD (mswindows, unmap_subwindow);
  CONSOLE_HAS_METHOD (mswindows, map_subwindow);
  CONSOLE_HAS_METHOD (mswindows, update_subwindow);
  CONSOLE_HAS_METHOD (mswindows, image_instance_equal);
  CONSOLE_HAS_METHOD (mswindows, image_instance_hash);
  CONSOLE_HAS_METHOD (mswindows, init_image_instance_from_eimage);
  CONSOLE_HAS_METHOD (mswindows, locate_pixmap_file);
}

void
image_instantiator_format_create_glyphs_mswindows (void)
{
  /* image-instantiator types */
#ifdef HAVE_XPM
  INITIALIZE_DEVICE_IIFORMAT (mswindows, xpm);
  IIFORMAT_HAS_DEVMETHOD (mswindows, xpm, instantiate);
#endif
  INITIALIZE_DEVICE_IIFORMAT (mswindows, xbm);
  IIFORMAT_HAS_DEVMETHOD (mswindows, xbm, instantiate);
#ifdef HAVE_XFACE
  INITIALIZE_DEVICE_IIFORMAT (mswindows, xface);
  IIFORMAT_HAS_DEVMETHOD (mswindows, xface, instantiate);
#endif
  /* button widget */
  INITIALIZE_DEVICE_IIFORMAT (mswindows, button);
  IIFORMAT_HAS_DEVMETHOD (mswindows, button, property);
  IIFORMAT_HAS_DEVMETHOD (mswindows, button, instantiate);

  INITIALIZE_DEVICE_IIFORMAT (mswindows, edit);
  IIFORMAT_HAS_DEVMETHOD (mswindows, edit, instantiate);
  
  INITIALIZE_DEVICE_IIFORMAT (mswindows, subwindow);
  IIFORMAT_HAS_DEVMETHOD (mswindows, subwindow, instantiate);

  INITIALIZE_DEVICE_IIFORMAT (mswindows, widget);
  IIFORMAT_HAS_DEVMETHOD (mswindows, widget, property);
  IIFORMAT_HAS_DEVMETHOD (mswindows, widget, set_property);
#if 0
  INITIALIZE_DEVICE_IIFORMAT (mswindows, group);
  IIFORMAT_HAS_DEVMETHOD (mswindows, group, instantiate);
#endif
  /* label */
  INITIALIZE_DEVICE_IIFORMAT (mswindows, label);
  IIFORMAT_HAS_DEVMETHOD (mswindows, label, instantiate);

  /* combo box */
  INITIALIZE_DEVICE_IIFORMAT (mswindows, combo);
  IIFORMAT_HAS_DEVMETHOD (mswindows, combo, property);
  IIFORMAT_HAS_DEVMETHOD (mswindows, combo, instantiate);

  /* scrollbar */
  INITIALIZE_DEVICE_IIFORMAT (mswindows, scrollbar);
  IIFORMAT_HAS_DEVMETHOD (mswindows, scrollbar, instantiate);

  /* progress gauge */
  INITIALIZE_DEVICE_IIFORMAT (mswindows, progress);
  IIFORMAT_HAS_DEVMETHOD (mswindows, progress, set_property);
  IIFORMAT_HAS_DEVMETHOD (mswindows, progress, instantiate);

  /* tree view widget */
  INITIALIZE_DEVICE_IIFORMAT (mswindows, tree);
  /*  IIFORMAT_HAS_DEVMETHOD (mswindows, progress, set_property);*/
  IIFORMAT_HAS_DEVMETHOD (mswindows, tree, instantiate);

  /* tab control widget */
  INITIALIZE_DEVICE_IIFORMAT (mswindows, tab);
  IIFORMAT_HAS_DEVMETHOD (mswindows, tab, instantiate);

  /* windows bitmap format */
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (bmp, "bmp");
  IIFORMAT_HAS_METHOD (bmp, validate);
  IIFORMAT_HAS_METHOD (bmp, normalize);
  IIFORMAT_HAS_METHOD (bmp, possible_dest_types);
  IIFORMAT_HAS_METHOD (bmp, instantiate);

  IIFORMAT_VALID_KEYWORD (bmp, Q_data, check_valid_string);
  IIFORMAT_VALID_KEYWORD (bmp, Q_file, check_valid_string);

  /* mswindows resources */
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (mswindows_resource,
					"mswindows-resource");

  IIFORMAT_HAS_METHOD (mswindows_resource, validate);
  IIFORMAT_HAS_METHOD (mswindows_resource, normalize);
  IIFORMAT_HAS_METHOD (mswindows_resource, possible_dest_types);
  IIFORMAT_HAS_METHOD (mswindows_resource, instantiate);

  IIFORMAT_VALID_KEYWORD (mswindows_resource, Q_resource_type, 
			  check_valid_resource_symbol);
  IIFORMAT_VALID_KEYWORD (mswindows_resource, Q_resource_id, check_valid_resource_id);
  IIFORMAT_VALID_KEYWORD (mswindows_resource, Q_file, check_valid_string);
}

void
vars_of_glyphs_mswindows (void)
{
  Fprovide (Qbmp);
  Fprovide (Qmswindows_resource);
  DEFVAR_LISP ("mswindows-bitmap-file-path", &Vmswindows_bitmap_file_path /*
A list of the directories in which mswindows bitmap files may be found.
This is used by the `make-image-instance' function.
*/ );
  Vmswindows_bitmap_file_path = Qnil;

  Fprovide (Qbutton);
  Fprovide (Qedit);
  Fprovide (Qcombo);
  Fprovide (Qscrollbar);
  Fprovide (Qlabel);
  Fprovide (Qprogress);
  Fprovide (Qtree);
  Fprovide (Qtab);
}

void
complex_vars_of_glyphs_mswindows (void)
{
}
