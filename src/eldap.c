/* LDAP client interface for XEmacs.
   Copyright (C) 1998 Free Software Foundation, Inc.

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

/* Author: Oscar Figueiredo with lots of support from Hrvoje Niksic */

/* This file provides lisp primitives for access to an LDAP library
   conforming to the API defined in RFC 1823.
   It has been tested with:
   - UMich LDAP 3.3 (http://www.umich.edu/~dirsvcs/ldap/)
   - OpenLDAP 1.0.3 (http://www.openldap.org/)
   - Netscape's LDAP SDK 1.0 (http://developer.netscape.com/) */


#include <config.h>
#include "lisp.h"
#include "opaque.h"
#include "sysdep.h"
#include "buffer.h"

#include <errno.h>

#include "eldap.h"

#ifdef HAVE_NS_LDAP
# define HAVE_LDAP_SET_OPTION 1
# define HAVE_LDAP_GET_ERRNO 1
#else
# undef HAVE_LDAP_SET_OPTION
# undef HAVE_LDAP_GET_ERRNO
#endif

static int ldap_default_port;
static Lisp_Object Vldap_default_base;

/* Needed by the lrecord definition */
Lisp_Object Qldapp;

/* ldap-open plist keywords */
extern Lisp_Object Qport, Qauth, Qbinddn, Qpasswd, Qderef, Qtimelimit,
  Qsizelimit;
/* Search scope limits */
extern Lisp_Object Qbase, Qonelevel, Qsubtree;
/* Authentication methods */
extern Lisp_Object Qkrbv41, Qkrbv42;
/* Deref policy */
extern Lisp_Object Qnever, Qalways, Qfind;

/************************************************************************/
/*                         Utility Functions                            */
/************************************************************************/

static void
signal_ldap_error (LDAP *ld)
{
#ifdef HAVE_LDAP_GET_ERRNO
  signal_simple_error
    ("LDAP error",
     build_string (ldap_err2string (ldap_get_lderrno (ld, NULL, NULL))));
#else
  signal_simple_error ("LDAP error",
                       build_string (ldap_err2string (ld->ld_errno)));
#endif
}


/************************************************************************/
/*                        ldap lrecord basic functions                  */
/************************************************************************/

static Lisp_Object
make_ldap (struct Lisp_LDAP *ldap)
{
  Lisp_Object lisp_ldap;
  XSETLDAP (lisp_ldap, ldap);
  return lisp_ldap;
}

static Lisp_Object
mark_ldap (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  return XLDAP (obj)->host;
}

static void
print_ldap (Lisp_Object obj, Lisp_Object printcharfun, int escapeflag)
{
  char buf[32];

  struct Lisp_LDAP *ldap = XLDAP (obj);

  if (print_readably)
    error ("printing unreadable object #<ldap %s>",
           XSTRING_DATA (ldap->host));

  write_c_string ("#<ldap ", printcharfun);
  print_internal (ldap->host, printcharfun, 1);
  if (!ldap->livep)
    write_c_string ("(dead) ",printcharfun);
  sprintf (buf, " 0x%x>", (unsigned int)ldap);
  write_c_string (buf, printcharfun);
}

static struct Lisp_LDAP *
allocate_ldap (void)
{
  struct Lisp_LDAP *ldap =
    alloc_lcrecord_type (struct Lisp_LDAP, lrecord_ldap);

  ldap->ld = NULL;
  ldap->host = Qnil;
  ldap->livep = 0;
  return ldap;
}

static void
finalize_ldap (void *header, int for_disksave)
{
  struct Lisp_LDAP *ldap = (struct Lisp_LDAP *) header;

  if (for_disksave)
    signal_simple_error ("Can't dump an emacs containing LDAP objects",
			 make_ldap (ldap));

  if (ldap->livep)
    ldap_unbind (ldap->ld);
}

DEFINE_LRECORD_IMPLEMENTATION ("ldap", ldap,
                               mark_ldap, print_ldap, finalize_ldap,
                               NULL, NULL, struct Lisp_LDAP);




/************************************************************************/
/*                        Basic ldap accessors                          */
/************************************************************************/

DEFUN ("ldapp", Fldapp, 1, 1, 0, /*
Return t if OBJECT is a LDAP connection.
*/
       (object))
{
  return LDAPP (object) ? Qt : Qnil;
}

DEFUN ("ldap-host", Fldap_host, 1, 1, 0, /*
Return the server host of the connection LDAP, as a string.
*/
       (ldap))
{
  CHECK_LDAP (ldap);
  return (XLDAP (ldap))->host;
}

DEFUN ("ldap-live-p", Fldap_status, 1, 1, 0, /*
Return t if LDAP is an active LDAP connection.
*/
       (ldap))
{
  CHECK_LDAP (ldap);
  return (XLDAP (ldap))->livep ? Qt : Qnil;
}

/************************************************************************/
/*                  Opening/Closing a LDAP connection                   */
/************************************************************************/


DEFUN ("ldap-open", Fldap_open, 1, 2, 0, /*
Open a LDAP connection to HOST.
PLIST is a plist containing additional parameters for the connection.
Valid keys in that list are:
  `port' the TCP port to use for the connection if different from
`ldap-default-port'.
  `auth' is the authentication method to use, possible values depend on
the LDAP library XEmacs was compiled with: `simple', `krbv41' and `krbv42'.
  `binddn' is the distinguished name of the user to bind as (in RFC 1779 syntax).
  `passwd' is the password to use for simple authentication.
  `deref' is one of the symbols `never', `always', `search' or `find'.
  `timelimit' is the timeout limit for the connection in seconds.
  `sizelimit' is the maximum number of matches to return.
*/
       (host, plist))
{
  /* This function can GC */
  struct Lisp_LDAP *ldap;
  LDAP *ld;
  int  ldap_port = 0;
  int  ldap_auth = LDAP_AUTH_SIMPLE;
  char *ldap_binddn = NULL;
  char *ldap_passwd = NULL;
  int  ldap_deref = LDAP_DEREF_NEVER;
  int  ldap_timelimit = 0;
  int  ldap_sizelimit = 0;
  int  err;

  Lisp_Object list, keyword, value;

  CHECK_STRING (host);

  EXTERNAL_PROPERTY_LIST_LOOP (list, keyword, value, plist)
    {
      /* TCP Port */
      if (EQ (keyword, Qport))
        {
          CHECK_INT (value);
          ldap_port = XINT (value);
        }
      /* Authentication method */
      if (EQ (keyword, Qauth))
        {
          if (EQ (value, Qsimple))
            ldap_auth = LDAP_AUTH_SIMPLE;
#ifdef LDAP_AUTH_KRBV41
          else if (EQ (value, Qkrbv41))
            ldap_auth = LDAP_AUTH_KRBV41;
#endif
#ifdef LDAP_AUTH_KRBV42
          else if (EQ (value, Qkrbv42))
            ldap_auth = LDAP_AUTH_KRBV42;
#endif
          else
            signal_simple_error ("Invalid authentication method", value);
        }
      /* Bind DN */
      else if (EQ (keyword, Qbinddn))
        {
          CHECK_STRING (value);
          GET_C_STRING_OS_DATA_ALLOCA (value, ldap_binddn);
        }
      /* Password */
      else if (EQ (keyword, Qpasswd))
        {
          CHECK_STRING (value);
          GET_C_STRING_OS_DATA_ALLOCA (value, ldap_passwd);
        }
      /* Deref */
      else if (EQ (keyword, Qderef))
        {
          if (EQ (value, Qnever))
            ldap_deref = LDAP_DEREF_NEVER;
          else if (EQ (value, Qsearch))
            ldap_deref = LDAP_DEREF_SEARCHING;
          else if (EQ (value, Qfind))
            ldap_deref = LDAP_DEREF_FINDING;
          else if (EQ (value, Qalways))
            ldap_deref = LDAP_DEREF_ALWAYS;
          else
            signal_simple_error ("Invalid deref value", value);
        }
      /* Timelimit */
      else if (EQ (keyword, Qtimelimit))
        {
          CHECK_INT (value);
          ldap_timelimit = XINT (value);
        }
      /* Sizelimit */
      else if (EQ (keyword, Qsizelimit))
        {
          CHECK_INT (value);
          ldap_sizelimit = XINT (value);
        }
    }

  if (ldap_port == 0)
    {
      ldap_port = ldap_default_port;
    }

  /* Connect to the server and bind */
  slow_down_interrupts ();
  ld = ldap_open ((char *)XSTRING_DATA (host), ldap_port);
  speed_up_interrupts ();

  if (ld == NULL )
    signal_simple_error_2 ("Failed connecting to host",
                           host,
                           lisp_strerror (errno));


#ifdef HAVE_LDAP_SET_OPTION
  if (ldap_set_option (ld, LDAP_OPT_DEREF, (void *)&ldap_deref) != LDAP_SUCCESS)
    signal_ldap_error (ld);
  if (ldap_set_option (ld, LDAP_OPT_TIMELIMIT,
                       (void *)&ldap_timelimit) != LDAP_SUCCESS)
    signal_ldap_error (ld);
  if (ldap_set_option (ld, LDAP_OPT_SIZELIMIT,
                       (void *)&ldap_sizelimit) != LDAP_SUCCESS)
    signal_ldap_error (ld);
  if (ldap_set_option (ld, LDAP_OPT_REFERRALS, LDAP_OPT_ON) != LDAP_SUCCESS)
    signal_ldap_error (ld);
#else  /* not HAVE_LDAP_SET_OPTION */
  ld->ld_deref = ldap_deref;
  ld->ld_timelimit = ldap_timelimit;
  ld->ld_sizelimit = ldap_sizelimit;
#ifdef LDAP_REFERRALS
  ld->ld_options = LDAP_OPT_REFERRALS;
#else /* not LDAP_REFERRALS */
  ld->ld_options = 0;
#endif /* not LDAP_REFERRALS */
#endif /* not HAVE_LDAP_SET_OPTION */

  /* ldap_bind_s calls select and may be wedged by SIGIO.  */
  slow_down_interrupts ();
  err = ldap_bind_s (ld, ldap_binddn, ldap_passwd, ldap_auth);
  speed_up_interrupts ();
  if (err != LDAP_SUCCESS)
    signal_simple_error ("Failed binding to the server",
                         build_string (ldap_err2string (err)));

  ldap = allocate_ldap ();
  ldap->ld = ld;
  ldap->host = host;
  ldap->livep = 1;

  return make_ldap (ldap);
}



DEFUN ("ldap-close", Fldap_close, 1, 1, 0, /*
Close an LDAP connection.
*/
      (ldap))
{
  struct Lisp_LDAP *lldap;
  CHECK_LIVE_LDAP (ldap);
  lldap = XLDAP (ldap);
  ldap_unbind (lldap->ld);
  lldap->livep = 0;
  return Qnil;
}



/************************************************************************/
/*                  Working on a LDAP connection                        */
/************************************************************************/
struct ldap_unwind_struct
{
  LDAPMessage *res;
  char **vals;
};


static Lisp_Object
ldap_search_unwind (Lisp_Object unwind_obj)
{
  struct ldap_unwind_struct *unwind =
    (struct ldap_unwind_struct *) get_opaque_ptr (unwind_obj);
  if (unwind->res)
    ldap_msgfree (unwind->res);
  if (unwind->vals)
    ldap_value_free (unwind->vals);
  return Qnil;
}

DEFUN ("ldap-search-internal", Fldap_search_internal, 2, 6, 0, /*
Perform a search on an open LDAP connection.
LDAP is an LDAP connection object created with `ldap-open'.
FILTER is a filter string for the search as described in RFC 1558.
BASE is the distinguished name at which to start the search.
SCOPE is one of the symbols `base', `onelevel' or `subtree' indicating
the scope of the search.
ATTRS is a list of strings indicating which attributes to retrieve
 for each matching entry. If nil return all available attributes.
If ATTRSONLY is non-nil then only the attributes are retrieved, not
the associated values.
The function returns a list of matching entries.  Each entry is itself
an alist of attribute/values.
*/
       (ldap, filter, base, scope, attrs, attrsonly))
{
  /* This function can GC */

  /* Vars for query */
  LDAP *ld;
  LDAPMessage *e;
  BerElement *ptr;
  char *a;
  int i, rc;
  int  matches;
  struct ldap_unwind_struct unwind;

  int  ldap_scope = LDAP_SCOPE_SUBTREE;
  char **ldap_attributes = NULL;

  int speccount = specpdl_depth ();

  Lisp_Object list, entry, result;
  struct gcpro gcpro1, gcpro2, gcpro3;

  list = entry = result = Qnil;
  GCPRO3 (list, entry, result);

  unwind.res = NULL;
  unwind.vals = NULL;

  /* Do all the parameter checking  */
  CHECK_LIVE_LDAP (ldap);
  ld = XLDAP (ldap)->ld;

  /* Filter */
  CHECK_STRING (filter);

  /* Search base */
  if (NILP (base))
    {
      base = Vldap_default_base;
    }
  if (!NILP (base))
    {
      CHECK_STRING (base);
    }

  /* Search scope */
  if (!NILP (scope))
    {
      if (EQ (scope, Qbase))
        ldap_scope = LDAP_SCOPE_BASE;
      else if (EQ (scope, Qonelevel))
        ldap_scope = LDAP_SCOPE_ONELEVEL;
      else if (EQ (scope, Qsubtree))
        ldap_scope = LDAP_SCOPE_SUBTREE;
      else
        signal_simple_error ("Invalid scope", scope);
    }

  /* Attributes to search */
  if (!NILP (attrs))
    {
      CHECK_CONS (attrs);
      ldap_attributes = alloca_array (char *, 1 + XINT (Flength (attrs)));

      i = 0;
      EXTERNAL_LIST_LOOP (attrs, attrs)
	{
	  Lisp_Object current = XCAR (attrs);
	  CHECK_STRING (current);
          GET_C_STRING_OS_DATA_ALLOCA (current, ldap_attributes[i]);
	  ++i;
	}
      ldap_attributes[i] = NULL;
    }

  /* Attributes only ? */
  CHECK_SYMBOL (attrsonly);

  /* Perform the search */
  if (ldap_search (ld,
                   NILP (base) ? "" : (char *) XSTRING_DATA (base),
                   ldap_scope,
                   NILP (filter) ? "" : (char *) XSTRING_DATA (filter),
                   ldap_attributes,
                   NILP (attrsonly) ? 0 : 1)
       == -1)
    {
      signal_ldap_error (ld);
    }

  /* Ensure we don't exit without cleaning up */
  record_unwind_protect (ldap_search_unwind,
                         make_opaque_ptr (&unwind));

  /* Build the results list */
  matches = 0;

  /* ldap_result calls select() and can get wedged by EINTR signals */
  slow_down_interrupts ();
  rc = ldap_result (ld, LDAP_RES_ANY, 0, NULL, &unwind.res);
  speed_up_interrupts ();
  while (rc == LDAP_RES_SEARCH_ENTRY)
    {
      QUIT;
      matches ++;
      e = ldap_first_entry (ld, unwind.res);
      /* #### This call to message() is pretty fascist, because it
         destroys the current echo area contents, even when invoked
         from Lisp.  It should use echo_area_message() instead, and
         restore the old echo area contents later.  */
      message ("Parsing ldap results... %d", matches);
      entry = Qnil;
      for (a= ldap_first_attribute (ld, e, &ptr);
           a != NULL;
           a= ldap_next_attribute (ld, e, ptr) )
        {
          list = Fcons (build_ext_string (a, FORMAT_OS), Qnil);
          unwind.vals = ldap_get_values (ld, e, a);
          if (unwind.vals != NULL)
            {
              for (i = 0; unwind.vals[i] != NULL; i++)
                {
                  list = Fcons (build_ext_string (unwind.vals[i], FORMAT_OS),
                                list);
                }
            }
          entry = Fcons (Fnreverse (list),
                         entry);
          ldap_value_free (unwind.vals);
          unwind.vals = NULL;
        }
      result = Fcons (Fnreverse (entry),
                      result);
      ldap_msgfree (unwind.res);
      unwind.res = NULL;

      slow_down_interrupts ();
      rc = ldap_result (ld, LDAP_RES_ANY, 0, NULL, &(unwind.res));
      speed_up_interrupts ();
    }

  if (rc == -1)
    {
      signal_ldap_error (ld);
    }
  rc = ldap_result2error (ld, unwind.res, 0);
  if ((rc != LDAP_SUCCESS) &&
      (rc != LDAP_SIZELIMIT_EXCEEDED))
    {
      signal_ldap_error (ld);
    }

  ldap_msgfree (unwind.res);
  unwind.res = (LDAPMessage *)NULL;
  /* #### See above for calling message().  */
  message ("Parsing ldap results... done");

  unbind_to (speccount, Qnil);
  UNGCPRO;
  return Fnreverse (result);
}


void
syms_of_eldap (void)
{
  defsymbol (&Qldapp, "ldapp");
  DEFSUBR (Fldapp);
  DEFSUBR (Fldap_host);
  DEFSUBR (Fldap_status);
  DEFSUBR (Fldap_open);
  DEFSUBR (Fldap_close);
  DEFSUBR (Fldap_search_internal);
}

void
vars_of_eldap (void)
{

  ldap_default_port = LDAP_PORT;
  Vldap_default_base =  Qnil;

  DEFVAR_INT ("ldap-default-port", &ldap_default_port /*
Default TCP port for LDAP connections.
Initialized from the LDAP library. Default value is 389.
*/ );

  DEFVAR_LISP ("ldap-default-base", &Vldap_default_base /*
Default base for LDAP searches.
This is a string using the syntax of RFC 1779.
For instance, "o=ACME, c=US" limits the search to the
Acme organization in the United States.
*/ );

}


