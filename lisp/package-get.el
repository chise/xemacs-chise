;;; package-get.el --- Retrieve XEmacs package

;; Copyright (C) 1998 by Pete Ware

;; Author: Pete Ware <ware@cis.ohio-state.edu>
;; Keywords: internal

;; This file is part of XEmacs.

;; XEmacs is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; XEmacs is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs; see the file COPYING.  If not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Synched up with: Not in FSF

;;; Commentary:

;; package-get -
;;	Retrieve a package and any other required packages from an archive
;;
;; The idea:
;;	A new XEmacs lisp-only release is generated with the following steps:
;;	1. The maintainer runs some yet to be written program that
;;	   generates all the dependency information.  This should
;;	   determine all the require and provide statements and associate
;;	   them with a package.
;;	2. All the packages are then bundled into their own tar balls
;;	   (or whatever format)
;;	3. Maintainer automatically generates a new `package-get-base'
;;	   data structure which contains information such as the
;;	   package name, the file to be retrieved, an md5 checksum,
;;	   etc (see `package-get-base').
;;	4. The maintainer posts an announcement with the new version
;;	   of `package-get-base'.
;;	5. A user/system manager saves this posting and runs
;;	   `package-get-update' which uses the previously saved list
;;	   of packages, `package-get-here' that the user/site
;;	   wants to determine what new versions to download and
;;	   install.
;;
;;	A user/site manager can generate a new `package-get-here' structure
;;	by using `package-get-setup' which generates a customize like
;;	interface to the list of packages.  The buffer looks something
;;	like:
;;
;;	gnus	- a mail and news reader
;;	[]	Always install
;;	[]	Needs updating
;;	[]	Required by other [packages]
;;	version: 2.0
;;
;;	vm	- a mail reader
;;	[]	Always install
;;	[]	Needs updating
;;	[]	Required by other [packages]	
;;
;;	Where `[]' indicates a toggle box
;;
;;	- Clicking on "Always install" puts this into
;;	  `package-get-here' list.  "Needs updating" indicates a new
;;	  version is available.  Anything already in
;;	  `package-get-here' has this enabled.
;;	- "Required by other" means some other packages are going to force
;;	  this to be installed.  Clicking on  [packages] gives a list
;;	  of packages that require this.
;;	
;;	The `package-get-base' should be installed in a file in
;;	`data-directory'.  The `package-get-here' should be installed in
;;	site-lisp.  Both are then read at run time.
;;
;; TODO:
;;	- Implement `package-get-setup'
;;	- Actually put `package-get-base' and `package-get-here' into
;;	  files that are read.
;;	- Allow users to have their own packages that they want installed
;;	  in ~/.xemacs/.
;;	- SOMEONE needs to write the programs that generate the
;;	  provides/requires database and makes it into a lisp data
;;	  structure suitable for `package-get-base'
;;	- Handle errors such as no package providing a required symbol.
;;	- Tie this into the `require' function to download packages
;;	  transparently.

;;; Change Log

;;; Code:

(require 'package-admin)
;; (require 'package-get-base)

(defgroup package-tools nil
  "Tools to manipulate packages."
  :group 'emacs)

(defgroup package-get nil
  "Automatic Package Fetcher and Installer."
  :prefix "package-get"
  :group 'package-tools)
  
(defvar package-get-base nil
  "List of packages that are installed at this site.
For each element in the alist,  car is the package name and the cdr is
a plist containing information about the package.   Typical fields
kept in the plist are:

version		- version of this package
provides	- list of symbols provided
requires	- list of symbols that are required.
		  These in turn are provided by other packages.
filename	- name of the file.
size		- size of the file (aka the bundled package)
md5sum		- computed md5 checksum
description	- What this package is for.
type		- Whether this is a 'binary (default) or 'single file package

More fields may be added as needed.  An example:

'(
 (name
  (version \"<version 2>\"
   file \"filename\"
   description \"what this package is about.\"
   provides (<list>)
   requires (<list>)
   size <integer-bytes>
   md5sum \"<checksum\"
   type single
   )
  (version \"<version 1>\"
   file \"filename\"
   description \"what this package is about.\"
   provides (<list>)
   requires (<list>)
   size <integer-bytes>
   md5sum \"<checksum\"
   type single
   )
   ...
   ))

For version information, it is assumed things are listed in most
recent to least recent -- in other words, the version names don't have to
be lexically ordered.  It is debatable if it makes sense to have more than
one version of a package available.")

(defcustom package-get-dir (temp-directory)
  "*Where to store temporary files for staging."
  :tag "Temporary directory"
  :type 'directory
  :group 'package-get)

;; JV Any Custom expert know to get "Host" and "Dir" for the remote option
(defcustom package-get-remote
  '(("ftp.xemacs.org" "/pub/xemacs/packages"))
  "*List of remote sites to contact for downloading packages.
List format is '(site-name directory-on-site).  Each site is tried in
order until the package is found.  As a special case, `site-name' can be
`nil', in which case `directory-on-site' is treated as a local directory."
  :tag "Package repository"
  :type '(repeat (choice (list :tag "Local" (const :tag "Local" nil) directory )
			 (list :tag "Remote" string string) ))
  :group 'package-get)

(defcustom package-get-remove-copy nil
  "*After copying and installing a package, if this is T, then remove the
copy.  Otherwise, keep it around."
  :type 'boolean
  :group 'package-get)

(defcustom package-get-base-filename
  "/ftp.xemacs.org:/pub/xemacs/packages/package-index.LATEST"
  "*Name of the default package database file, usually on ftp.xemacs.org."
  :type 'file
  :group 'package-get)

;;;###autoload
(defun package-get-require-base ()
  "Require that a package-get database has been loaded."
  (when (or (not (boundp 'package-get-base))
            (not package-get-base))
    (package-get-update-base))
  (when (or (not (boundp 'package-get-base))
            (not package-get-base))
    (error "Package-get database not loaded")))

(defconst package-get-pgp-signed-begin-line "^-----BEGIN PGP SIGNED MESSAGE-----"
  "Text for start of PGP signed messages.")
(defconst package-get-pgp-signature-begin-line "^-----BEGIN PGP SIGNATURE-----"
  "Text for beginning of PGP signature.")
(defconst package-get-pgp-signature-end-line "^-----END PGP SIGNATURE-----"
  "Text for end of PGP signature.")

;;;###autoload
(defun package-get-update-base-entry (entry)
  "Update an entry in `package-get-base'."
  (let ((existing (assoc (car entry) package-get-base)))
    (if existing
        (setcdr existing (cdr entry))
      (setq package-get-base (cons entry package-get-base)))))

;;;###autoload
(defun package-get-update-base (&optional db-file)
  "Update the package-get database file with entries from DB-FILE."
  (interactive (list
                (read-file-name "Load package-get database: "
                                (file-name-directory package-get-base-filename)
                                package-get-base-filename
                                t
                                (file-name-nondirectory package-get-base-filename))))
  (setq db-file (expand-file-name (or db-file package-get-base-filename)))
  (if (not (file-exists-p db-file))
      (error "Package-get database file `%s' does not exist" db-file))
  (if (not (file-readable-p db-file))
      (error "Package-get database file `%s' not readable" db-file))
  (let ((buf (get-buffer-create "*package database*")))
    (unwind-protect
        (save-excursion
          (set-buffer buf)
          (erase-buffer buf)
          (insert-file-contents-internal db-file)
          (package-get-update-base-from-buffer buf))
      (kill-buffer buf))))

;;;###autoload
(defun package-get-update-base-from-buffer (&optional buf)
  "Update the package-get database with entries from BUFFER.
BUFFER defaults to the current buffer.  This command can be
used interactively, for example from a mail or news buffer."
  (interactive)
  (setq buf (or buf (current-buffer)))
  (let (content-beg content-end beg end)
    (save-excursion
      (set-buffer buf)
      (goto-char (point-min))
      (setq content-beg (point))
      (setq content-end (save-excursion (goto-char (point-max)) (point)))
      (when (re-search-forward package-get-pgp-signed-begin-line nil t)
        (setq beg (match-beginning 0))
        (setq content-beg (match-end 0)))
      (when (re-search-forward package-get-pgp-signature-begin-line nil t)
        (setq content-end (match-beginning 0)))
      (when (re-search-forward package-get-pgp-signature-end-line nil t)
        (setq end (point)))
      (if (not (and content-beg content-end beg end))
          (or (yes-or-no-p "Package-get entries not PGP signed, continue? ")
              (error "Package-get database not updated")))
      (if (and content-beg content-end beg end)
          (if (not (condition-case nil
                       (or (fboundp 'mc-pgp-verify-region)
                           (load-library "mc-pgp")
                           (fboundp 'mc-pgp-verify-region))
                     (error nil)))
              (or (yes-or-no-p
                   "No mailcrypt; can't verify package-get DB signature, continue? ")
                  (error "Package-get database not updated"))))
      (if (and beg end
               (fboundp 'mc-pgp-verify-region)
               (or (not
                    (condition-case err
                        (mc-pgp-verify-region beg end)
                      (file-error
                       (and (string-match "No such file" (nth 2 err))
                            (yes-or-no-p
                             "Can't find PGP, continue without package-get DB verification? ")))
                      (t nil)))))
          (error "Package-get PGP signature failed to verify"))
      (package-get-update-base-entries content-beg content-end)
      (message "Updated package-get database"))))

(defun package-get-update-base-entries (beg end)
  "Update the package-get database with the entries found between
BEG and END in the current buffer."
  (save-excursion
    (goto-char beg)
    (if (not (re-search-forward "^(package-get-update-base-entry" nil t))
        (error "Buffer does not contain package-get database entries"))
    (beginning-of-line)
    (let ((count 0))
      (while (and (< (point) end)
                  (re-search-forward "^(package-get-update-base-entry" nil t))
        (beginning-of-line)
        (let ((entry (read (current-buffer))))
          (if (or (not (consp entry))
                  (not (eq (car entry) 'package-get-update-base-entry)))
              (error "Invalid package-get database entry found"))
          (package-get-update-base-entry
           (car (cdr (car (cdr entry)))))
          (setq count (1+ count))))
      (message "Got %d package-get database entries" count))))

(defun package-get-interactive-package-query (get-version package-symbol)
  "Perform interactive querying for package and optional version.
Query for a version if GET-VERSION is non-nil.  Return package name as
a symbol instead of a string if PACKAGE-SYMBOL is non-nil.
The return value is suitable for direct passing to `interactive'."
  (package-get-require-base)
  (let ( (table (mapcar '(lambda (item)
			   (let ( (name (symbol-name (car item))) )
			     (cons name name)
			     ))
			package-get-base)) 
	 package package-symbol default-version version)
    (save-window-excursion
      (setq package (completing-read "Package: " table nil t))
      (setq package-symbol (intern package))
      (if get-version
	  (progn
	    (setq default-version 
		  (package-get-info-prop 
		   (package-get-info-version
		    (package-get-info-find-package package-get-base
						   package-symbol) nil)
		   'version))
	    (while (string=
		    (setq version (read-string "Version: " default-version))
		    "")
	      )
	    (if package-symbol
		(list package-symbol version)
	      (list package version))
	    )
	(if package-symbol
	    (list package-symbol)
	  (list package)))
      )))

;;;###autoload
(defun package-get-delete-package (package &optional pkg-topdir)
  "Delete an installation of PACKAGE below directory PKG-TOPDIR.
PACKAGE is a symbol, not a string.
This is just an interactive wrapper for `package-admin-delete-binary-package'."
  (interactive (package-get-interactive-package-query nil t))
  (package-admin-delete-binary-package package pkg-topdir))

;;;###autoload
(defun package-get-update-all ()
  "Fetch and install the latest versions of all currently installed packages."
  (interactive)
  (package-get-require-base)
  ;; Load a fresh copy
  (catch 'exit
    (mapcar (lambda (pkg)
	      (if (not (package-get (car pkg) nil 'never))
		  (throw 'exit nil)		;; Bail out if error detected
		  ))
	    packages-package-list)))

;;;###autoload
(defun package-get-all (package version &optional fetched-packages install-dir)
  "Fetch PACKAGE with VERSION and all other required packages.
Uses `package-get-base' to determine just what is required and what
package provides that functionality.  If VERSION is nil, retrieves
latest version.  Optional argument FETCHED-PACKAGES is used to keep
track of packages already fetched.  Optional argument INSTALL-DIR,
if non-nil, specifies the package directory where fetched packages
should be installed.

Returns nil upon error."
  (interactive (package-get-interactive-package-query t nil))
  (let* ((the-package (package-get-info-find-package package-get-base
						     package))
	 (this-package (package-get-info-version
			the-package version))
	 (this-requires (package-get-info-prop this-package 'requires))
	 )
    (catch 'exit
      (setq version (package-get-info-prop this-package 'version))
      (unless (package-get-installedp package version)
	(if (not (package-get package version nil install-dir))
	    (progn
	      (setq fetched-packages nil)
	      (throw 'exit nil))))
      (setq fetched-packages
	    (append (list package)
		    (package-get-info-prop this-package 'provides)
		    fetched-packages))
      ;; grab everything that this package requires plus recursively
      ;; grab everything that the requires require.  Keep track
      ;; in `fetched-packages' the list of things provided -- this
      ;; keeps us from going into a loop
      (while this-requires
	(if (not (member (car this-requires) fetched-packages))
	    (let* ((reqd-package (package-get-package-provider
				  (car this-requires)))
		   (reqd-version (cadr reqd-package))
		   (reqd-name (car reqd-package)))
	      (if (null reqd-name)
		  (error "Unable to find a provider for %s"
			 (car this-requires)))
	      (if (not (setq fetched-packages
			     (package-get-all reqd-name reqd-version
					      fetched-packages
                                              install-dir)))
		  (throw 'exit nil)))
	  )
	(setq this-requires (cdr this-requires)))
      )
    fetched-packages
    ))

;;;###autoload
(defun package-get-dependencies (packages)
  "Compute dependencies for PACKAGES.
Uses `package-get-base' to determine just what is required and what
package provides that functionality.  Returns the list of packages
required by PACKAGES."
  (package-get-require-base)
  (let ((orig-packages packages)
        dependencies provided)
    (while packages
      (let* ((package (car packages))
             (the-package (package-get-info-find-package
                           package-get-base package))
             (this-package (package-get-info-version
                            the-package nil))
             (this-requires (package-get-info-prop this-package 'requires))
             (new-depends   (set-difference
                             (mapcar
                              #'(lambda (reqd)
                                  (let* ((reqd-package (package-get-package-provider reqd))
                                         (reqd-version (cadr reqd-package))
                                         (reqd-name    (car reqd-package)))
                                    (if (null reqd-name)
                                        (error "Unable to find a provider for %s" reqd))
                                    reqd-name))
                              this-requires)
                             dependencies))
             (this-provides (package-get-info-prop this-package 'provides)))
        (setq dependencies
              (union dependencies new-depends))
        (setq provided
              (union provided (union (list package) this-provides)))
        (setq packages
              (union new-depends (cdr packages)))))
    (set-difference dependencies orig-packages)))

(defun package-get-load-package-file (lispdir file)
  (let (pathname)
    (setq pathname (expand-file-name file lispdir))
    (condition-case err
	(progn
	  (load pathname t)
	  t)
      (t
       (message "Error loading package file \"%s\" %s!" pathname err)
       nil))
    ))

(defun package-get-init-package (lispdir)
  "Initialize the package.
This really assumes that the package has never been loaded.  Updating
a newer package can cause problems, due to old, obsolete functions in
the old package.

Return `t' upon complete success, `nil' if any errors occurred."
  (progn
    (if (and lispdir
	     (file-accessible-directory-p lispdir))
	(progn
	  ;; Add lispdir to load-path if it doesn't already exist.
	  ;; NOTE: this does not take symlinks, etc., into account.
	  (if (let ( (dirs load-path) )
		(catch 'done
		  (while dirs
		    (if (string-equal (car dirs) lispdir)
			(throw 'done nil))
		    (setq dirs (cdr dirs))
		    )
		  t))
	      (setq load-path (cons lispdir load-path)))
	  (if (not (package-get-load-package-file lispdir "auto-autoloads"))
	      (package-get-load-package-file lispdir "_pkg"))
	  t)
      nil)
    ))

;;;###autoload
(defun package-get (package &optional version conflict install-dir)
  "Fetch PACKAGE from remote site.
Optional arguments VERSION indicates which version to retrieve, nil
means most recent version.  CONFLICT indicates what happens if the
package is already installed.  Valid values for CONFLICT are:
'always	always retrieve the package even if it is already installed
'never	do not retrieve the package if it is installed.
INSTALL-DIR, if non-nil, specifies the package directory where
fetched packages should be installed.

The value of `package-get-base' is used to determine what files should 
be retrieved.  The value of `package-get-remote' is used to determine
where a package should be retrieved from.  The sites are tried in
order so one is better off listing easily reached sites first.

Once the package is retrieved, its md5 checksum is computed.  If that
sum does not match that stored in `package-get-base' for this version
of the package, an error is signalled.

Returns `t' upon success, the symbol `error' if the package was
successfully installed but errors occurred during initialization, or
`nil' upon error."
  (interactive (package-get-interactive-package-query nil t))
  (let* ((this-package
	  (package-get-info-version
	   (package-get-info-find-package package-get-base
					  package) version))
	 (this-requires (package-get-info-prop this-package 'requires))
	 (found nil)
	 (search-dirs package-get-remote)
	 (base-filename (package-get-info-prop this-package 'filename))
	 (package-status t)
	 filenames full-package-filename)
    (if (null this-package)
	(error "Couldn't find package %s with version %s"
	       package version))
    (if (null base-filename)
	(error "No filename associated with package %s, version %s"
	       package version))
    (setq install-dir
	  (package-admin-get-install-dir package install-dir
		(or (eq package 'mule-base) (memq 'mule-base this-requires))))

    ;; Contrive a list of possible package filenames.
    ;; Ugly.  Is there a better way to do this?
    (setq filenames (cons base-filename nil))
    (if (string-match "^\\(..*\\)\.tar\.gz$" base-filename)
	(setq filenames (append filenames
				(list (concat (match-string 1 base-filename)
					      ".tgz")))))

    (setq version (package-get-info-prop this-package 'version))
    (unless (and (eq conflict 'never)
		 (package-get-installedp package version))
      ;; Find the package from the search list in package-get-remote
      ;; and copy it into the staging directory.  Then validate
      ;; the checksum.  Finally, install the package.
      (catch 'done
	(let (search-filenames current-dir-entry host dir current-filename
			       dest-filename)
	  ;; In each search directory ...
	  (while search-dirs
	    (setq current-dir-entry (car search-dirs)
		  host (car current-dir-entry)
		  dir (car (cdr current-dir-entry))
		  search-filenames filenames
		  )

	    ;; Look for one of the possible package filenames ...
	    (while search-filenames
	      (setq current-filename (car search-filenames)
		    dest-filename (package-get-staging-dir current-filename))
	      (cond
	       ;; No host means look on the current system.
	       ( (null host)
		 (setq full-package-filename
		       (substitute-in-file-name
			(expand-file-name current-filename
					  (file-name-as-directory dir))))
		 )

	       ;; If it's already on the disk locally, and the size is
	       ;; greater than zero ...
	       ( (and (file-exists-p dest-filename)
		      (let (attrs)
			;; file-attributes could return -1 for LARGE files,
			;; but, hopefully, packages won't be that large.
			(and (setq attrs (file-attributes dest-filename))
			     (> (nth 7 attrs) 0))))
		 (setq full-package-filename dest-filename)
		 )

	       ;; If the file exists on the remote system ...
	       ( (file-exists-p (package-get-remote-filename
				 current-dir-entry current-filename))
		 ;; Get it
		 (setq full-package-filename dest-filename)
		 (message "Retrieving package `%s' ..." 
			  current-filename)
		 (sit-for 0)
		 (copy-file (package-get-remote-filename current-dir-entry
							 current-filename)
			    full-package-filename t)
		 )
	       )

	      ;; If we found it, we're done.
	      (if (and full-package-filename
		       (file-exists-p full-package-filename))
		  (throw 'done nil))
	      ;; Didn't find it.  Try the next possible filename.
	      (setq search-filenames (cdr search-filenames))
	      )
	    ;; Try looking in the next possible directory ...
	    (setq search-dirs (cdr search-dirs))
	    )
	  ))

      (if (or (not full-package-filename)
	      (not (file-exists-p full-package-filename)))
	  (error "Unable to find file %s" base-filename))
      ;; Validate the md5 checksum
      ;; Doing it with XEmacs removes the need for an external md5 program
      (message "Validating checksum for `%s'..." package) (sit-for 0)
      (with-temp-buffer
	;; What ever happened to i-f-c-literally
	(let (file-name-handler-alist)
	  (insert-file-contents-internal full-package-filename))
	(if (not (string= (md5 (current-buffer))
			  (package-get-info-prop this-package
						 'md5sum)))
	    (error "Package %s does not match md5 checksum" base-filename)))

      (package-admin-delete-binary-package package install-dir)

      (message "Installing package `%s' ..." package) (sit-for 0)
      (let ((status
	     (package-admin-add-binary-package full-package-filename
					       install-dir)))
	(if (= status 0)
	    (progn
	      ;; clear messages so that only messages from
	      ;; package-get-init-package are seen, below.
	      (clear-message)
	      (if (package-get-init-package (package-admin-get-lispdir
					     install-dir package))
		  (progn
		    (message "Added package `%s'" package)
		    (sit-for 0)
		    )
		(progn
		  ;; display message only if there isn't already one.
		  (if (not (current-message))
		      (progn
			(message "Added package `%s' (errors occurred)"
				 package)
			(sit-for 0)
			))
		  (if package-status
		      (setq package-status 'errors))
		  ))
	      )
	  (message "Installation of package %s failed." base-filename)
	  (sit-for 0)
	  (switch-to-buffer package-admin-temp-buffer)
	  (setq package-status nil)
	  ))
      (setq found t))
    (if (and found package-get-remove-copy)
	(delete-file full-package-filename))
    package-status
    ))

(defun package-get-info-find-package (which name)
  "Look in WHICH for the package called NAME and return all the info
associated with it.  See `package-get-base' for info on the format
returned.

 To access fields returned from this, use
`package-get-info-version' to return information about particular a
version.  Use `package-get-info-find-prop' to find particular property 
from a version returned by `package-get-info-version'."
  (interactive "xPackage list: \nsPackage Name: ")
  (if which
      (if (eq (caar which) name)
	  (cdar which)
	(if (cdr which)
	    (package-get-info-find-package (cdr which) name)))))

(defun package-get-info-version (package version)
  "In PACKAGE, return the plist associated with a particular VERSION of the
  package.  PACKAGE is typically as returned by
  `package-get-info-find-package'.  If VERSION is nil, then return the 
  first (aka most recent) version.  Use `package-get-info-find-prop'
  to retrieve a particular property from the value returned by this."
  (interactive (package-get-interactive-package-query t t))
  (while (and version package (not (string= (plist-get (car package) 'version) version)))
    (setq package (cdr package)))
  (if package (car package)))

(defun package-get-info-prop (package-version property)
  "In PACKAGE-VERSION, return the value associated with PROPERTY.
PACKAGE-VERSION is typically returned by `package-get-info-version'
and PROPERTY is typically (although not limited to) one of the
following:

version		- version of this package
provides		- list of symbols provided
requires		- list of symbols that are required.
		  These in turn are provided by other packages.
size		- size of the bundled package
md5sum		- computed md5 checksum"
  (interactive "xPackage Version: \nSProperty")
  (plist-get package-version property))

(defun package-get-info-version-prop (package-list package version property)
  "In PACKAGE-LIST, search for PACKAGE with this VERSION and return
  PROPERTY value."
  (package-get-info-prop
   (package-get-info-version
    (package-get-info-find-package package-list package) version) property))

(defun package-get-set-version-prop (package-list package version
						  property value)
  "A utility to make it easier to add a VALUE for a specific PROPERTY
  in this VERSION of a specific PACKAGE kept in the PACKAGE-LIST.
Returns the modified PACKAGE-LIST.  Any missing fields are created."
  )

(defun package-get-staging-dir (filename)
  "Return a good place to stash FILENAME when it is retrieved.
Use `package-get-dir' for directory to store stuff.
Creates `package-get-dir'  it it doesn't exist."
  (interactive "FPackage filename: ")
  (if (not (file-exists-p package-get-dir))
      (make-directory package-get-dir))
  (expand-file-name
   (file-name-nondirectory (or (and (fboundp 'efs-ftp-path)
				    (nth 2 (efs-ftp-path filename)))
			       filename))
   (file-name-as-directory package-get-dir)))

(defun package-get-remote-filename (search filename)
  "Return FILENAME as a remote filename.
It first checks if FILENAME already is a remote filename.  If it is
not, then it uses the (car search) as the remote site-name and the (cadr
search) as the remote-directory and concatenates filename.  In other
words
	site-name:remote-directory/filename
"
  (if (efs-ftp-path filename)
      filename
    (let ((dir (cadr search)))
      (concat "/"
	      (car search) ":"
	      (if (string-match "/$" dir)
		  dir
		(concat dir "/"))
	      filename))))


(defun package-get-installedp (package version)
  "Determine if PACKAGE with VERSION has already been installed.
I'm not sure if I want to do this by searching directories or checking 
some built in variables.  For now, use packages-package-list."
  ;; Use packages-package-list which contains name and version
  (equal (plist-get
	  (package-get-info-find-package packages-package-list
					 package) ':version)
	 (if (floatp version) version (string-to-number version))))

;;;###autoload
(defun package-get-package-provider (sym)
  "Search for a package that provides SYM and return the name and
  version.  Searches in `package-get-base' for SYM.   If SYM is a
  consp, then it must match a corresponding (provide (SYM VERSION)) from 
  the package."
  (interactive "SSymbol: ")
  (package-get-require-base)
  (let ((packages package-get-base)
	(done nil)
	(found nil))
    (while (and (not done) packages)
      (let* ((this-name (caar packages))
	     (this-package (cdr (car packages)))) ;strip off package name
	(while (and (not done) this-package)
	  (if (or (eq this-name sym)
		  (eq (cons this-name
			    (package-get-info-prop (car this-package) 'version))
		      sym)
		  (member sym (package-get-info-prop (car this-package) 'provides)))
	      (progn (setq done t)
		     (setq found (list (caar packages)
				       (package-get-info-prop (car this-package) 'version))))
	    (setq this-package (cdr this-package)))))
      (setq packages (cdr packages)))
    found))

;;
;; customize interfaces.
;; The group is in this file so that custom loads includes this file.
;;
(defgroup packages nil
  "Configure XEmacs packages."
  :group 'emacs)

;;;###autoload
(defun package-get-custom ()
  "Fetch and install the latest versions of all customized packages."
  (interactive)
  (package-get-require-base)
  ;; Load a fresh copy
  (load "package-get-custom.el")
  (mapcar (lambda (pkg)
	    (if (eval (intern (concat (symbol-name (car pkg)) "-package")))
		(package-get-all (car pkg) nil))
	    t)
	  package-get-base))

(defun package-get-ever-installed-p (pkg &optional notused)
  (string-match "-package$" (symbol-name pkg))
  (custom-initialize-set 
   pkg 
   (if (package-get-info-find-package 
	packages-package-list 
	(intern (substring (symbol-name pkg) 0 (match-beginning 0))))
       t)))

(defun package-get-file-installed-p (file &optional paths)
  "Return absolute-path of FILE if FILE exists in PATHS.
If PATHS is omitted, `load-path' is used."
  (if (null paths)
      (setq paths load-path)
    )
  (catch 'tag
    (let (path)
      (while paths
	(setq path (expand-file-name file (car paths)))
	(if (file-exists-p path)
	    (throw 'tag path)
	  )
	(setq paths (cdr paths))
	))))

(defun package-get-create-custom ()
  "Creates a package customization file package-get-custom.el.
Entries in the customization file are retrieved from package-get-base.el."
  (interactive)
  ;; Load a fresh copy
  (let ((custom-buffer (find-file-noselect 
			(or (package-get-file-installed-p 
			     "package-get-custom.el")
			    (expand-file-name
			     "package-get-custom.el"
			     (file-name-directory 
			      (package-get-file-installed-p 
			       "package-get-base.el"))
			     ))))
	(pkg-groups nil))

    ;; clear existing stuff
    (delete-region (point-min custom-buffer) 
		   (point-max custom-buffer) custom-buffer)
    (insert-string "(require 'package-get)\n" custom-buffer)

    (mapcar (lambda (pkg)
	      (let ((category (plist-get (car (cdr pkg)) 'category)))
		(or (memq (intern category) pkg-groups)
		    (progn
		      (setq pkg-groups (cons (intern category) pkg-groups))
		      (insert-string 
		       (concat "(defgroup " category "-packages nil\n"
			       "  \"" category " package group\"\n"
			       "  :group 'packages)\n\n") custom-buffer)))
		
		(insert-string 
		 (concat "(defcustom " (symbol-name (car pkg)) 
			 "-package nil \n"
			 "  \"" (plist-get (car (cdr pkg)) 'description) "\"\n"
			 "  :group '" category "-packages\n"
			 "  :initialize 'package-get-ever-installed-p\n"
			 "  :type 'boolean)\n\n") custom-buffer)))
	    package-get-base) custom-buffer)
  )

;; need this first to avoid infinite dependency loops
(provide 'package-get)

;; potentially update the custom dependencies every time we load this
(when nil ;; #### disable for now... -gk
(unless noninteractive
(let ((custom-file (package-get-file-installed-p "package-get-custom.el"))
      (package-file (package-get-file-installed-p "package-get-base.el")))
  ;; update custom file if it doesn't exist
  (if (or (not custom-file)
	  (and (< (car (nth 5 (file-attributes custom-file)))
		  (car (nth 5 (file-attributes package-file))))
	       (< (car (nth 5 (file-attributes custom-file)))
		  (car (nth 5 (file-attributes package-file))))))
      (save-excursion
	(message "generating package customizations...")
	(set-buffer (package-get-create-custom))
	(save-buffer)
	(message "generating package customizations...done")))
  (load "package-get-custom.el")))
)

;;; package-get.el ends here
