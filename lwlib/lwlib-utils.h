#ifndef _LWLIB_UTILS_H_
#define _LWLIB_UTILS_H_

void destroy_all_children (Widget widget);
void XtNoClearRefreshWidget (Widget);

typedef void (*XtApplyToWidgetsProc) (Widget, XtPointer);
typedef void* (*XtApplyUntilToWidgetsProc) (Widget, XtPointer);

void XtApplyToWidgets (Widget, XtApplyToWidgetsProc, XtPointer);
void *XtApplyUntilToWidgets (Widget, XtApplyUntilToWidgetsProc, XtPointer);

Widget *XtCompositeChildren (Widget, unsigned int *);

/* returns True is the widget is being destroyed, False otherwise */
Boolean
XtWidgetBeingDestroyedP (Widget widget);

void XtSafelyDestroyWidget (Widget);

#ifdef USE_DEBUG_MALLOC
#include <dmalloc.h>
#endif
#endif /* _LWLIB_UTILS_H_ */
