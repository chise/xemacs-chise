;;; ldap.el --- LDAP support for Emacs

;; Copyright (C) 1997 Free Software Foundation, Inc.

;; Author: Oscar Figueiredo <Oscar.Figueiredo@di.epfl.ch>
;; Maintainer: Oscar Figueiredo <Oscar.Figueiredo@di.epfl.ch>
;; Created: Jan 1998
;; Version: $Revision: 1.7.2.3 $
;; Keywords: help comm

;; This file is part of XEmacs

;; XEmacs is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; XEmacs is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs; see the file COPYING.  If not, write to 
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:
;;    This file provides mid-level and user-level functions to access directory
;;    servers using the LDAP protocol (RFC 1777). 

;;; Installation:
;;    LDAP support must have been built into XEmacs.


;;; Code:

(defgroup ldap nil
  "Lightweight Directory Access Protocol"
  :group 'comm)

(defcustom ldap-default-host nil
  "*Default LDAP server hostname.
A TCP port number can be appended to that name using a colon as 
a separator."
  :type '(choice (string :tag "Host name")
		 (const :tag "Use library default" nil))
  :group 'ldap)

(defcustom ldap-default-port nil
  "*Default TCP port for LDAP connections.
Initialized from the LDAP library at build time. Default value is 389."
  :type '(choice (const :tag "Use library default" nil)
		 (integer :tag "Port number"))
  :group 'ldap)

(defcustom ldap-default-base nil
  "*Default base for LDAP searches.
This is a string using the syntax of RFC 1779.
For instance, \"o=ACME, c=US\" limits the search to the
Acme organization in the United States."
  :type '(choice (const :tag "Use library default" nil)
		 (string :tag "Search base"))
  :group 'ldap)


(defcustom ldap-host-parameters-alist nil
  "*Alist of host-specific options for LDAP transactions.
The format of each list element is:
\(HOST PROP1 VAL1 PROP2 VAL2 ...)
HOST is the hostname of an LDAP server (with an optional TCP port number
appended to it  using a colon as a separator). 
PROPn and VALn are property/value pairs describing parameters for the server.
Valid properties include:
  `binddn' is the distinguished name of the user to bind as 
    (in RFC 1779 syntax).
  `passwd' is the password to use for simple authentication.
  `auth' is the authentication method to use. 
    Possible values are: `simple', `krbv41' and `krbv42'.
  `base' is the base for the search as described in RFC 1779.
  `scope' is one of the three symbols `subtree', `base' or `onelevel'.
  `deref' is one of the symbols `never', `always', `search' or `find'.
  `timelimit' is the timeout limit for the connection in seconds.
  `sizelimit' is the maximum number of matches to return."
  :type '(repeat :menu-tag "Host parameters"
		 :tag "Host parameters"
		 (list :menu-tag "Host parameters"
		       :tag "Host parameters"
		       :value nil
		       (string :tag "Host name")
		       (checklist :inline t
				  :greedy t
				  (list
				   :tag "Search Base" 
				   :inline t
				   (const :tag "Search Base" base)
				   string)
				  (list
				   :tag "Binding DN"
				   :inline t
				   (const :tag "Binding DN" binddn)
				   string)
				  (list
				   :tag "Password"
				   :inline t
				   (const :tag "Password" passwd)
				   string)
				  (list
				   :tag "Authentication Method"
				   :inline t
				   (const :tag "Authentication Method" auth)
				   (choice
				    (const :menu-tag "None" :tag "None" nil)
				    (const :menu-tag "Simple" :tag "Simple" simple)
				    (const :menu-tag "Kerberos 4.1" :tag "Kerberos 4.1" krbv41)
				    (const :menu-tag "Kerberos 4.2" :tag "Kerberos 4.2" krbv42)))
				  (list
				   :tag "Search Scope" 
				   :inline t
				   (const :tag "Search Scope" scope)
				   (choice
				    (const :menu-tag "Default" :tag "Default" nil)
				    (const :menu-tag "Subtree" :tag "Subtree" subtree)
				    (const :menu-tag "Base" :tag "Base" base)
				    (const :menu-tag "One Level" :tag "One Level" onelevel)))
				  (list
				   :tag "Dereferencing"
				   :inline t
				   (const :tag "Dereferencing" deref)
				   (choice
				    (const :menu-tag "Default" :tag "Default" nil)
				    (const :menu-tag "Never" :tag "Never" never)
				    (const :menu-tag "Always" :tag "Always" always)
				    (const :menu-tag "When searching" :tag "When searching" search)
				    (const :menu-tag "When locating base" :tag "When locating base" find)))
				  (list
				   :tag "Time Limit"
				   :inline t
				   (const :tag "Time Limit" timelimit)
				   (integer :tag "(in seconds)"))
				  (list
				   :tag "Size Limit"
				   :inline t
				   (const :tag "Size Limit" sizelimit)
				   (integer :tag "(number of records)")))))
:group 'ldap)

(defun ldap-get-host-parameter (host parameter)
  "Get the value of PARAMETER for HOST in `ldap-host-parameters-alist'."
  (plist-get (cdr (assoc host ldap-host-parameters-alist))
	     parameter))
	
(defun ldap-search (filter &optional host attributes attrsonly withdn)
  "Perform an LDAP search.
FILTER is the search filter in RFC1558 syntax, i.e. something that
looks like \"(cn=John Smith)\".
HOST is the LDAP host on which to perform the search.
ATTRIBUTES is a list of attributes to retrieve; nil means retrieve all.
If ATTRSONLY is non nil, the attributes will be retrieved without
the associated values.
If WITHDN is non-nil each entry in the result will be prepennded with
its distinguished name DN.
Additional search parameters can be specified through 
`ldap-host-parameters-alist' which see.
The function returns a list of matching entries.  Each entry is itself
an alist of attribute/value pairs optionally preceded by the DN of the
entry according to the value of WITHDN."
  (interactive "sFilter:")
  (or host
      (setq host ldap-default-host))
  (or host
      (error "No LDAP host specified"))
  (let ((host-plist (cdr (assoc host ldap-host-parameters-alist)))
	ldap)
    (message "Opening LDAP connection to %s..." host)
    (setq ldap (ldap-open host host-plist))
    (message "Searching with LDAP on %s..." host)
    (prog1 (ldap-search-internal ldap filter 
				 (plist-get host-plist 'base)
				 (plist-get host-plist 'scope)
				 attributes attrsonly withdn)
      (ldap-close ldap))))

(provide 'ldap)
		
;;; ldap.el ends here
