/*
  postgresql.h -- Emacs Lisp binding to libpq.so
  Copyright (C) 2000 Electrotechnical Laboratory, JAPAN.
  Licensed to the Free Software Foundation.

  Author:  SL Baur <steve@beopen.com>
  Maintainer:  SL Baur <steve@beopen.com>

Please send patches to this file to me first before submitting them to
xemacs-patches.
*/

#ifndef XEMACS_POSTGRESQL_H__
#define XEMACS_POSTGRESQL_H__ 1

#define BLCKSZ 8192 /* size of a default Postres disk block */
/*
  This file contains the GCC bug workaround code for the private
  LRECORD types.
*/

/* PGconn is an opaque object and we need to be able to store them in
   Lisp code because libpq supports multiple connections.
*/
struct Lisp_PGconn
{
  struct lcrecord_header header;
  PGconn *pgconn;
};
typedef struct Lisp_PGconn Lisp_PGconn;

DECLARE_LRECORD (pgconn, Lisp_PGconn);

#define XPGCONN(x) XRECORD (x, pgconn, Lisp_PGconn)
#define XSETPGCONN(x, p) XSETRECORD (x, p, pgconn)
#define PGCONNP(x) RECORDP (x, pgconn)
#define CHECK_PGCONN(x) CHECK_RECORD (x, pgconn)
#define CONCHECK_PGCONN(x) CONCHECK_RECORD (x, pgconn)

/****/

/* PGresult is an opaque object and we need to be able to store them in
   Lisp code.
*/
struct Lisp_PGresult
{
  struct lcrecord_header header;
  PGresult *pgresult;
};
typedef struct Lisp_PGresult Lisp_PGresult;

DECLARE_LRECORD (pgresult, Lisp_PGresult);

#define XPGRESULT(x) XRECORD (x, pgresult, Lisp_PGresult)
#define XSETPGRESULT(x, p) XSETRECORD (x, p, pgresult)
#define PGRESULTP(x) RECORDP (x, pgresult)
#define CHECK_PGRESULT(x) CHECK_RECORD (x, pgresult)
#define CONCHECK_PGRESULT(x) CONCHECK_RECORD (x, pgresult)

/****/
#ifdef HAVE_POSTGRESQLV7

#ifdef LIBPQ_7_0_IS_FIXED /* this is broken in released 7.0b1 */

/* PGsetenvHandle is an opaque object and we need to be able to store
   them in Lisp code in order to make asynchronous environment calls.
*/
struct Lisp_PGsetenvHandle
{
  struct lcrecord_header header;
  PGsetenvHandle *pgsetenv;
};
typedef struct Lisp_PGsetenvHandle Lisp_PGsetenvHandle;

DECLARE_LRECORD (pgsetenv, Lisp_PGsetenvHandle);

#define XPGSETENV(x) XRECORD (x, pgsetenv, Lisp_PGsetenvHandle)
#define XSETPGSETENV(x, p) XSETRECORD (x, p, pgsetenv)
#define PGSETENVP(x) RECORDP (x, pgsetenv)
#define CHECK_PGSETENV(x) CHECK_RECORD (x, pgsetenv)
#define CONCHECK_PGSETENV(x) CONCHECK_RECORD (x, pgsetenv)

#endif /* LIBPQ_7_0_IS_FIXED */

#endif /* HAVE_POSTGRESQLV7 */

#endif /* XEMACS_POSTGRESQL_H__ */
