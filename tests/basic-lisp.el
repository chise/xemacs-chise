;;; Test basic Lisp functionality

;;(when (not (boundp 'foo)) (setq foo 1))
;;(incf foo)
;;(print foo)

(let ((my-vector [1 2 3 4])
      (my-bit-vector (bit-vector 1 0 1 0))
      (my-string "1234")
      (my-list '(1 2 3 4)))

  ;;(Assert (fooooo)) ;; Generate Other failure
  ;;(Assert (eq 1 2)) ;; Generate Assertion failure
  
  (Assert (eq (elt my-vector 0) 1))
  (Assert (eq (elt my-bit-vector 0) 1))
  (Assert (eq (elt my-string 0) ?1))
  (Assert (eq (elt my-list 0) 1))

  (Assert (eq 4 (length my-vector)))
  (Assert (eq 4 (length my-bit-vector)))
  (Assert (eq 4 (length my-string)))

  (fillarray my-vector 5)
  (fillarray my-bit-vector 1)
  (fillarray my-string ?5)

  (Assert (eq 4 (length my-vector)))
  (Assert (eq 4 (length my-bit-vector)))
  (Assert (eq 4 (length my-string)))

  (Assert (eq (elt my-vector 0) 5))
  (Assert (eq (elt my-bit-vector 0) 1))
  (Assert (eq (elt my-string 0) ?5))

  (Assert (eq (elt my-vector 3) 5))
  (Assert (eq (elt my-bit-vector 3) 1))
  (Assert (eq (elt my-string 3) ?5))

  (fillarray my-bit-vector 0)
  (Assert (eq 4 (length my-bit-vector)))
  (Assert (eq (elt my-bit-vector 2) 0))

  ;; Test nconc
  (let ((x (list 0 1 2)))
    (Assert (eq (nconc) nil))
    (Assert (eq (nconc nil) nil))
    (Assert (eq (nconc nil x) x))
    (Assert (eq (nconc x nil) x))
    (let ((y (nconc x nil (list 3 4 5) nil)))
      (Assert (eq (length y) 6))
      (Assert (eq (nth 3 y) 3))
      ))
  )

;;; Old cruft
;;;(run-tests)

;(defmacro Assert (assertion)
;  `(condition-case error
;       (progn
;	 (assert ,assertion)
;	 (princ (format "Assertion passed: %S" (quote ,assertion)))
;	 (terpri)
;	 (incf Assert-successes))
;     (cl-assertion-failed
;      (princ (format "Assertion failed: %S" (quote ,assertion)))
;      (terpri)
;      (incf Assert-failures))
;     (t (princ (format "Test harness error: %S" error))
;	(terpri)
;	(incf Harness-failures)
;	)))


;(defun run-tests ()
;  (with-output-to-temp-buffer "*Test-Log*"
;    (let ((Assert-successes 0)
;	  (Assert-failures  0)
;	  (Harness-failures 0))
;      (basic-lisp-test)
;      (byte-compile 'basic-lisp-test)
;      (basic-lisp-test)
;      (print (format "%d successes, %d assertion failures, %d harness failures"
;		     Assert-successes
;		     Assert-failures
;		     Harness-failures)))))

;(defun the-test ()
