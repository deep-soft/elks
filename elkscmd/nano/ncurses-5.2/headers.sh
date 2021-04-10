#! /bin/sh
# This shell script is generated by the 'configure' script.  It is invoked in a
# subdirectory of the build tree.  It generates a sed-script in the parent
# directory that is used to adjust includes for header files that reside in a
# subdirectory of /usr/include, etc.
PRG=""
while test $# != 3
do
PRG="$PRG $1"; shift
done
DST=$1
REF=$2
SRC=$3
TMPSRC=${TMPDIR-/tmp}/`basename $SRC`$$
TMPSED=${TMPDIR-/tmp}/headers.sed$$
echo installing $SRC in $DST
case $DST in
/*/include/*)
	END=`basename $DST`
	for i in `cat $REF/../*/headers |fgrep -v "#"`
	do
		NAME=`basename $i`
		if test "$NAME" = "curses.h"
		then
			echo "s/<curses.h>/<ncurses.h>/" >> $TMPSED
			NAME=ncurses.h
		fi
		echo "s/<$NAME>/<$END\/$NAME>/" >> $TMPSED
	done
	;;
*)
	echo "s/<curses.h>/<ncurses.h>/" >> $TMPSED
	;;
esac
rm -f $TMPSRC
sed -f $TMPSED $SRC > $TMPSRC
NAME=`basename $SRC`
test "$NAME" = "curses.h" && NAME=ncurses.h
eval $PRG $TMPSRC $DST/$NAME
rm -f $TMPSRC $TMPSED
