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
(require 'package-get-base)

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

(defvar package-get-dir (temp-directory)
  "*Where to store temporary files for staging.")

(defvar package-get-remote
  '(
    ("ftp.xemacs.org" "/pub/xemacs/beta/xemacs-21.0/packages/binary-packages")
    ("ftp.xemacs.org" "/pub/xemacs/beta/xemacs-21.0/packages/single-file-packages")
    ("ftp.xemacs.org" "/pub/xemacs/package"))
  "*List of remote sites to contact for downloading packages.
List format is '(site-name directory-on-site).  Each site is tried in
order until the package is found.")

(defvar package-get-remove-copy nil
  "*After copying and installing a package, if this is T, then remove the
copy.  Otherwise, keep it around.")

;;;###autoload
(defun package-get-update-all ()
  "Fetch and install the latest versions of all currently installed packages."
  (interactive)
  ;; Load a fresh copy
  (mapcar (lambda (pkg)
	    (package-get-all
	     (car pkg) nil))
          packages-package-list))

;;;###autoload
(defun package-get-all (package version &optional fetched-packages)
  "Fetch PACKAGE with VERSION and all other required packages.
Uses `package-get-base' to determine just what is required and what
package provides that functionality.  If VERSION is nil, retrieves
latest version.  Optional argument FETCHED-PACKAGES is used to keep
track of packages already fetched."
  (interactive "sPackage: \nsVersion: ")
  (let* ((the-package (package-get-info-find-package package-get-base
						     package))
	 (this-package (package-get-info-version
			the-package version))
	 (this-requires (package-get-info-prop this-package 'requires))
	 )
    (setq version (package-get-info-prop this-package 'version))
    (unless (package-get-installedp package version)
      (package-get package version))
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
		(error "Unable to find a provider for %s" (car this-requires)))
	    (setq fetched-packages
		  (package-get-all reqd-name reqd-version fetched-packages)))
	)
      (setq this-requires (cdr this-requires)))
    fetched-packages
    ))

;;;###autoload
(defun package-get (package &optional version conflict)
  "Fetch PACKAGE from remote site.
Optional arguments VERSION indicates which version to retrieve, nil
means most recent version.  CONFLICT indicates what happens if the
package is already installed.  Valid values for CONFLICT are:
'always	always retrieve the package even if it is already installed
'never	do not retrieve the package if it is installed.

The value of `package-get-base' is used to determine what files should 
be retrieved.  The value of `package-get-remote' is used to determine
where a package should be retrieved from.  The sites are tried in
order so one is better off listing easily reached sites first.

Once the package is retrieved, its md5 checksum is computed.  If that
sum does not match that stored in `package-get-base' for this version
of the package, an error is signalled."
  (interactive "xPackage List: ")
  (let* ((this-package
	  (package-get-info-version
	   (package-get-info-find-package package-get-base
					  package) version))
	 (found nil)
	 (search-dirs package-get-remote)
	 (filename (package-get-info-prop this-package 'filename)))
    (if (null this-package)
	(error "Couldn't find package %s with version %s"
	       package version))
    (if (null filename)
	(error "No filename associated with package %s, version %s"
	       package version))
    (setq version (package-get-info-prop this-package 'version))
    (unless (and (eq conflict 'never)
		 (package-get-installedp package version))
      ;; Find the package from search list in package-get-remote
      ;; and copy it into the staging directory.  Then validate
      ;; the checksum.  Finally, install the package.
      (while (and search-dirs
		  (not (file-exists-p (package-get-staging-dir filename))))
	(if (file-exists-p (package-get-remote-filename
			    (car search-dirs) filename))
	    (copy-file (package-get-remote-filename (car search-dirs) filename)
		       (package-get-staging-dir filename))
	  (setq search-dirs (cdr search-dirs))
	  ))
      (if (not (file-exists-p (package-get-staging-dir filename)))
	  (error "Unable to find file %s" filename))
      ;; Validate the md5 checksum
      ;; Doing it with XEmacs removes the need for an external md5 program
      (with-temp-buffer
	;; What ever happened to i-f-c-literally
	(let (file-name-handler-alist)
	  (insert-file-contents-internal (package-get-staging-dir filename)))
	(if (not (string= (md5 (current-buffer))
			  (package-get-info-prop this-package
						 'md5sum)))
	    (error "Package %s does not match md5 checksum" filename)))
      (message "Retrieved package %s" filename) (sit-for 0)
      (let ((status
	     (package-admin-add-binary-package
	      (package-get-staging-dir filename))))
	(when (not (= status 0))
	  (message "Package failed.")
	  (switch-to-buffer package-admin-temp-buffer)))
      (sit-for 0)
      (message "Added package") (sit-for 0)
      (setq found t))
    (if (and found package-get-remove-copy)
	(delete-file (package-get-staging-dir filename)))
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
  (interactive "xPackage Info: \nsVersion: ")
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
  (concat 
   (file-name-as-directory package-get-dir)
   (file-name-nondirectory (or (nth 2 (efs-ftp-path filename)) filename))))
       

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
			    (concat (file-name-directory 
				     (package-get-file-installed-p 
				      "package-get-base.el"))
				    "package-get-custom.el"))))
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
  (load "package-get-custom.el"))

;;; package-get.el ends here
