;;; DO NOT MODIFY THIS FILE
(if (featurep 'mule-autoloads) (error "Already loaded"))

;;;### (autoloads (ccl-execute-with-args check-ccl-program define-ccl-program declare-ccl-program ccl-dump ccl-compile ccl-program-p) "mule-ccl" "mule/mule-ccl.el")

(autoload 'ccl-program-p "mule-ccl" "\
T if OBJECT is a valid CCL compiled code." nil nil)

(autoload 'ccl-compile "mule-ccl" "\
Return a compiled code of CCL-PROGRAM as a vector of integer." nil nil)

(autoload 'ccl-dump "mule-ccl" "\
Disassemble compiled CCL-CODE." nil nil)

(autoload 'declare-ccl-program "mule-ccl" "\
Declare NAME as a name of CCL program.

To compile a CCL program which calls another CCL program not yet
defined, it must be declared as a CCL program in advance.
Optional arg VECTOR is a compiled CCL code of the CCL program." nil 'macro)

(autoload 'define-ccl-program "mule-ccl" "\
Set NAME the compiled code of CCL-PROGRAM.
CCL-PROGRAM is `eval'ed before being handed to the CCL compiler `ccl-compile'.
The compiled code is a vector of integers." nil 'macro)

(autoload 'check-ccl-program "mule-ccl" "\
Check validity of CCL-PROGRAM.
If CCL-PROGRAM is a symbol denoting a valid CCL program, return
CCL-PROGRAM, else return nil.
If CCL-PROGRAM is a vector and optional arg NAME (symbol) is supplied,
register CCL-PROGRAM by name NAME, and return NAME." nil 'macro)

(autoload 'ccl-execute-with-args "mule-ccl" "\
Execute CCL-PROGRAM with registers initialized by the remaining args.
The return value is a vector of resulting CCL registers." nil nil)

;;;***

(provide 'mule-autoloads)
