AC_DEFUN(XE_EMACS, [
	dnl
	dnl Apparently, if you run a shell window in Emacs, it sets the EMACS
	dnl environment variable to 't'.  Lets undo the damage.
	dnl
	if test "${EMACS}" = "t"; then
		EMACS=""
	fi

	AC_ARG_WITH(xemacs,           --with-xemacs             Use XEmacs to build, [ if test "${withval}" = "yes"; then EMACS=xemacs; else EMACS=${withval}; fi ])
	AC_ARG_WITH(emacs,            --with-emacs              Use Emacs to build, [ if test "${withval}" = "yes"; then EMACS=emacs; else EMACS=${withval}; fi ])
	AC_CHECK_PROG(EMACS, xemacs, xemacs, emacs)
	AC_SUBST(EMACS)
])

AC_DEFUN(XE_CONFIG_VALUE, [
	OUTPUT=./conftest-$$
	rm -f ${OUTPUT}
	${EMACS} -batch -eval "
(let ((hash (config-value-hash-table))
      (desired (split-string \"$1\")))
  (mapcar
     (lambda (key)
       (message \"Checking for %S\" (intern key))
       (if (config-value (intern key))
          (progn
	    (write-region (format \"%s=\\\"%s\\\"\n\" key (config-value (intern key)))
		  	  nil \"${OUTPUT}\" t))))
	desired))
" 2> /dev/null > /dev/null
	test -f ${OUTPUT} && . ${OUTPUT}
	rm -f ${OUTPUT}
	for ac_func in $1; do
                :
	done
])
