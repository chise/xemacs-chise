(dolist (attribute (char-attribute-list))
  (save-char-attribute-table attribute))

(garbage-collect)
