/* Workable version of <sys/socket.h> based on winsock.h */

#ifndef _SOCKET_H_
#define _SOCKET_H_

/* defeat the multiple include protection */
#ifdef _WINSOCKAPI_
#undef _WINSOCKAPI_
#endif

#if 0 /* What's wrong with winsock.h version ? - kkm */
/* avoid clashing with our version of FD_SET if already defined */
#ifdef FD_SET
#undef FD_SET
#undef FD_CLR
#undef FD_ISSET
#undef FD_ZERO
#endif

/* allow us to provide our own version of fd_set */
#define fd_set ws_fd_set
#endif /* 0 */

/* avoid duplicate definition of timeval */
#ifdef HAVE_TIMEVAL
#define timeval ws_timeval
#endif

#include <winsock.h>

#if 0 /* What's wrong with winsock.h version ? - kkm */
/* revert to our version of FD_SET */
#undef FD_SET
#undef FD_CLR
#undef FD_ISSET
#undef FD_ZERO
#undef fd_set
#include "nt.h"
#endif /* 0 */

#ifdef HAVE_TIMEVAL
#undef timeval
#endif

/* map winsock error codes to standard names */
#define EWOULDBLOCK             WSAEWOULDBLOCK
#define EINPROGRESS             WSAEINPROGRESS
#define EALREADY                WSAEALREADY
#define ENOTSOCK                WSAENOTSOCK
#define EDESTADDRREQ            WSAEDESTADDRREQ
#define EMSGSIZE                WSAEMSGSIZE
#define EPROTOTYPE              WSAEPROTOTYPE
#define ENOPROTOOPT             WSAENOPROTOOPT
#define EPROTONOSUPPORT         WSAEPROTONOSUPPORT
#define ESOCKTNOSUPPORT         WSAESOCKTNOSUPPORT
#define EOPNOTSUPP              WSAEOPNOTSUPP
#define EPFNOSUPPORT            WSAEPFNOSUPPORT
#define EAFNOSUPPORT            WSAEAFNOSUPPORT
#define EADDRINUSE              WSAEADDRINUSE
#define EADDRNOTAVAIL           WSAEADDRNOTAVAIL
#define ENETDOWN                WSAENETDOWN
#define ENETUNREACH             WSAENETUNREACH
#define ENETRESET               WSAENETRESET
#define ECONNABORTED            WSAECONNABORTED
#define ECONNRESET              WSAECONNRESET
#define ENOBUFS                 WSAENOBUFS
#define EISCONN                 WSAEISCONN
#define ENOTCONN                WSAENOTCONN
#define ESHUTDOWN               WSAESHUTDOWN
#define ETOOMANYREFS            WSAETOOMANYREFS
#define ETIMEDOUT               WSAETIMEDOUT
#define ECONNREFUSED            WSAECONNREFUSED
#define ELOOP                   WSAELOOP
/* #define ENAMETOOLONG            WSAENAMETOOLONG */
#define EHOSTDOWN               WSAEHOSTDOWN
#define EHOSTUNREACH            WSAEHOSTUNREACH
/* #define ENOTEMPTY               WSAENOTEMPTY */
#define EPROCLIM                WSAEPROCLIM
#define EUSERS                  WSAEUSERS
#define EDQUOT                  WSAEDQUOT
#define ESTALE                  WSAESTALE
#define EREMOTE                 WSAEREMOTE

#endif /* _SOCKET_H_ */

/* end of socket.h */
