#!/bin/sh
# update-elc.sh --- recompile all missing or out-of-date .elc files

# Author:	Jamie Zawinski, Ben Wing, Martin Buchholz
# Maintainer:	Martin Buchholz
# Keywords:	recompile byte-compile .el .elc

# This file is part of XEmacs.

# XEmacs is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# XEmacs is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with XEmacs; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA.

### Commentary:
##  Recompile all .elc files that need recompilation.  Requires a
##  working version of "xemacs".  Correctly handles the case where the
##  .elc files are missing; thus you can execute "rm lisp/*/*.elc"
##  before running this script.  Run this from the parent of the
##  "lisp" directory, or another nearby directory.

set -e

# Try to find the lisp directory in several places.
# (Sun workspaces have an "editor" directory)
for dir in  .  ..  ../..  editor  ../editor  ; do
  if test -d $dir/lisp/. ; then cd $dir ; break ; fi
done

if test ! -d lisp/. ; then
  echo "$0: Cannot find the \"lisp\" directory."
  exit 1
fi

if test -z "$EMACS"; then EMACS="./src/xemacs"; fi
export EMACS

echo " (using $EMACS)"

# fuckin' sysv, man...
if [ "`uname -r | sed 's/[^0-9]*\([0-9]*\).*/\1/'`" -gt 4 ]; then
  echon()
  {    
    /bin/echo $* '\c'
  }
else
  echon()
  {
    echo -n $*
  }
fi

REAL=`cd \`dirname $EMACS\` ; pwd | sed 's|^/tmp_mnt||'`/`basename $EMACS`
BYTECOMP="$REAL -batch -vanilla "
echo "Recompiling in `pwd|sed 's|^/tmp_mnt||'`"
echo "          with $REAL..."

$EMACS -batch -vanilla -l `pwd`/lisp/cleantree -f batch-remove-old-elc lisp

prune_vc="( -name '.*' -o -name SCCS -o -name RCS -o -name CVS ) -prune -o"

# $els  is a list of all .el  files
# $elcs is a list of all .elc files
els=/tmp/update-elc-1.$$ elcs=/tmp/update-elc-2.$$
rm -f $els $elcs
trap "rm -f $els $elcs" 0 1 2 3 15
find lisp/. $prune_vc -name '*.el'  -print                    | sort > $els
find lisp/. $prune_vc -name '*.elc' -print | sed 's/elc$/el/' | sort > $elcs


echon "Deleting .elc files without .el files..."
comm -13 $els $elcs | sed -e '\!/vm.el!d' -e 's/el$/elc/' | \
 while read file ; do echo rm "$file" ; rm "$file" ; done
echo done.


# Compute patterns to ignore when searching for files
ignore_dirs=""
ignore_pattern=''

# Only use Mule XEmacs to compile Mule-specific elisp dirs
echon "Checking for Mule support..."
lisp_prog='(princ (featurep (quote mule)))'
mule_p="`$EMACS -batch -vanilla -eval \"$lisp_prog\"`"
if test "$mule_p" = nil ; then
	echo No
	ignore_dirs="$ignore_dirs its egg mule language leim skk"
	ignore_pattern='\!/tl/char-table.el$!d
\!/tl/chartblxmas.el$!d
\!/mu/latex-math-symbol.el$!d
'
else
  echo Yes
fi

# first recompile the byte-compiler, so that the other compiles take place
# with the latest version (assuming we're compiling the lisp dir of the emacs
# we're running, which might not be the case, but often is.)
#echo "Checking the byte compiler..."
#$BYTECOMP -f batch-byte-recompile-directory lisp/bytecomp

# Prepare for byte-compiling directories with directory-specific instructions
# Not necessary any more, but I want to keep the text current to cut & paste
# into the package lisp maintenance tree.
#make_special_commands=''
#make_special () {
#  dir="$1"; shift;
#  ignore_dirs="$ignore_dirs $dir"
#  make_special_commands="$make_special_commands \
#echo \"Compiling in lisp/$dir\"; \
#(cd \"lisp/$dir\" && ${MAKE:-make} EMACS=$REAL ${1+$*}); \
#echo \"lisp/$dir done.\";"
#}

#if test "$mule_p" != nil; then
#	make_special skk all
#fi

## AUCTeX is a package now
# if test "$mule_p" = nil ; then
# 	make_special auctex some
# else
# 	make_special auctex some MULE_ELC=tex-jp.elc
# fi
#make_special cc-mode all
# EFS is now packaged
# make_special efs x20
#make_special eos -k		# not strictly necessary...
## make_special gnus  some	# Now this is a package.
# hyperbole is now packaged
# make_special hyperbole elc
# We're not ready for the following, yet.
#make_special ilisp XEmacsELC=custom-load.elc elc
# ilisp is now packaged
# make_special ilisp elc
# oobr is now packaged
# make_special oobr HYPB_ELC='' elc
## W3 is a package now.
#make_special w3 xemacs-w3

for dir in $ignore_dirs ; do
  ignore_pattern="${ignore_pattern}/\\/$dir\\//d
/\\/$dir\$/d
"
done

# Other special-case filenames that don't get byte-compiled
ignore_pattern="$ignore_pattern"'
\!/,!d
\!/paths.el$!d
\!/loadup.el$!d
\!/loadup-el.el$!d
\!/update-elc.el$!d
\!/dumped-lisp.el$!d
\!/make-docfile.el$!d
\!/site-start.el$!d
\!/site-load.el$!d
\!/site-init.el$!d
\!/version.el$!d
\!/very-early-lisp.el$!d
\!/Installation.el$!d
'

echo "Compiling files without .elc..."
NUMTOCOMPILE=20			# compile this many files with each invocation
comm -23 $els $elcs | \
 sed "$ignore_pattern" | \
 xargs -t -n$NUMTOCOMPILE $BYTECOMP -f batch-byte-compile
echo "Compiling files without .elc... Done"

#if test "$mule_p" != nil; then
#	eval "$make_special_commands"
#fi
