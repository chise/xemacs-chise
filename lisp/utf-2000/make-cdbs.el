(defvar system-char-database-directory
  (expand-file-name "char-db"
		    (or exec-directory
			"../lib-src/")))


(defun delete-file-with-children (filename)
  (if (file-directory-p filename)
      (let ((files
	     (directory-files filename 'full "^[^.]" 'so-sort)))
	(if files
	    (dolist (file files)
	      (delete-file-with-children file)))
	(remove-directory filename))
    (delete-file filename)))

(when (or load-ignore-elc-files
	  (not (file-exists-p system-char-database-directory)))
  (load "dumped-chars.el")
  (dolist (file system-char-db-source-file-list)
    (pureload file))
  
  ;;(condition-case nil
  ;; (call-process "rm" nil 0 nil
  ;;               "-rf" system-char-database-directory)
  ;;(error (princ (format "Can't delete %s\n"
  ;;		  system-char-database-directory))))
  (if (file-exists-p system-char-database-directory)
      (delete-file-with-children system-char-database-directory))

  (dolist (attribute (char-attribute-list))
    (save-char-attribute-table attribute))

  (dolist (ccs (charset-list))
    (save-charset-mapping-table ccs)))

(mapcar (lambda (file)
	  (reset-char-attribute-table (intern file)))
	(directory-files
	 (expand-file-name "system-char-id"
			   system-char-database-directory)
	 nil nil t t))

(garbage-collect)
