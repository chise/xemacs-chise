(defvar system-char-database-directory
  (expand-file-name "char-db"
		    (or exec-directory
			"../lib-src/")))

(when (or load-ignore-elc-files
	  (not (file-exists-p system-char-database-directory)))
  (condition-case nil
      (call-process "rm" nil nil nil "-rf" system-char-database-directory)
    (error nil))

  (load "dumped-chars.el")
  (dolist (file system-char-db-source-file-list)
    (pureload file))

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
