/* Compatibility routines based on code from the MIT Xmu library */

/* Synched up with: Not in FSF. */

#ifdef HAVE_XMU

# include <X11/Xmu/CharSet.h>
# include <X11/Xmu/Converters.h>
# include <X11/Xmu/CurUtil.h>
# include <X11/Xmu/Drawing.h>
# include <X11/Xmu/Error.h>

/* Do the EDITRES protocol if running X11R5 (or later) version */
#if (XtSpecificationRelease >= 5) 
/* #### No dice if we don't have XMU until someone ports
   _XEditResCheckMessages to xmu.c */
#define HACK_EDITRES
#include <X11/Xmu/Editres.h>
#endif /* R5+ */

#else

int XmuCursorNameToIndex (CONST char *name);
int XmuReadBitmapDataFromFile (CONST char *filename, unsigned int *width,
                               unsigned int *height, unsigned char **datap,
                               int *x_hot, int *y_hot);
int XmuPrintDefaultErrorMessage (Display *dpy, XErrorEvent *event, FILE *fp);
void XmuCopyISOLatin1Lowered (char *, CONST char *);

#endif

