;;; Test database functionality

(defun test-database (db)
  (Assert (databasep db))
  (put-database "key1" "val1" db)
  (Assert (equal "val1" (get-database "key1" db)))
  (remove-database "key1" db)
  (Assert (equal nil (get-database "key1" db)))
  (close-database db)
  (Assert (not (database-live-p db)))
  (Assert (databasep db))
  (let ((filename (database-file-name db)))
    (loop for fn in (list filename (concat filename ".db")) do
      (when (file-exists-p fn)
	(delete-file fn))))
  )

(let ((filename (expand-file-name "test-emacs" (temp-directory))))

  (when (featurep 'dbm)
  (let ((db (open-database filename 'dbm)))
    (test-database db)))
  
  (princ "\n")

  (when (featurep 'berkeley-db)
    (let ((db (open-database filename 'berkeley-db)))
      (test-database db)))
  )
