(dolist (attribute (char-attribute-list))
  (save-char-attribute-table attribute))

(garbage-collect)

(dolist (ccs (charset-list))
  (save-charset-mapping-table ccs))

(garbage-collect)
