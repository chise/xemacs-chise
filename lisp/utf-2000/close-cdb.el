(cond
 ((featurep 'chise)
  (dolist (attribute (char-attribute-list))
    (close-char-attribute-table attribute))
  ))

(garbage-collect)
