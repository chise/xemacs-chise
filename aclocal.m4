dnl aclocal.m4 --- Dynamically linked library support for XEmacs
dnl Copyright (C) 1998 Free Software Foundation, Inc.
dnl Author: William Perry <wmperry@aventail.com>
dnl This file is part of XEmacs

AC_DEFUN(XE_MAKE_SHAREDLIB, [
dll_ld="ld"
dll_lflags="-shared"
dll_cflags="-r"
dll_oflags="-o "

AC_MSG_CHECKING(how to build a shared library)
case `uname -rs` in
	UNIX_SV*|UNIX_System_V*)
		dll_lflags="-G"
		dll_cflags=-Kpic
		dll_ld="ld"
		;;
	BSD/OS*)
		dll_cflags=
		dll_lflags="-r"
		dll_ld="shlicc2"
		;;
	FreeBSD*2*)
		dll_lflags="-Bshareable"
		dll_cflags="-fPIC -DPIC"
		dll_ld=ld
		;;
	SunOS*4.*)
 		dll_cflags="-P"
		dll_lflags="-dp -assert pure-text -assert nodefinitions"
		;;
	SunOS*5.*)
		dll_ld="cc"
		dll_cflags="-KPIC"
		dll_lflags="-G"
		dll_oflags="-W0,-y-o -W0,-y"
		;;	
	IRIX*5.*|IRIX*6.*)
		dll_cflags="-KPIC"
		;;
	OSF1*)
		;;
	HP-UX*)
		dll_ld="ld"
		dll_lflags="-b"
		dll_cflags="+z"
		;;
	SCO_SV*)
		dll_ld="ld"
		dll_lflags="-G"
		dll_cflags="-Kpic"
		;;
	AIX*)
		dll_lflags="-H512 -T512 -bhalt:4 -bM:SRE -bE:\${@:.ell=.exp} -b noentry -lc"
		dll_ld="ld"
		;;
	*)
		;;
	esac

	if test "$GCC" = "yes" ; then
		dll_cflags="-fPIC"
		case `uname -rs` in
		SunOS*5.*)
			dll_ld="ld"
			dll_oflags="-o "
			dll_lflags="-G"
			;;
		SCO_SV*)
			dll_ld="ld"
			dll_lflags="-G"
			dll_cflags="-b elf"
			;;
		FreeBSD*)
			dll_cflags="-DDLSYM_NEEDS_UNDERSCORE -DPIC -fPIC"
			dll_lflags="-Bshareable"
			dll_ld=ld
			;;
		BSD/OS*)
			dll_cflags=
			dll_lflags="-r"
			dll_ld="shlicc2"
			;;
		UNIX_SV*)
			dll_cflags="-fPIC"
			;;
		*)
			dll_ld="$CC"
			dll_lflags="-shared"
		esac
	fi

	AC_MSG_RESULT("lflags: $dll_lflags cflags: $dll_cflags")
AC_SUBST(dll_ld)
AC_SUBST(dll_cflags)
AC_SUBST(dll_oflags)
AC_SUBST(dll_lflags)
])dnl
