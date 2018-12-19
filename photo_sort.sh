#/bin/sh
function do_sort {
	if [ ! -d "$1" ]
	then
		mkdir "$1"
	fi

	if [ -d "$1" ]
	then
		mv -fv *${year}*$1*.jpg "$1" 2> /dev/null
		mv -fv *${year}*$1*.png "$1" 2> /dev/null
	else
		echo "$1 not found!"
	fi
}


if [ $# -ne 1 ]
then
	echo "Usage: $0 <year>"
	exit
fi

year="$1"

for i in 1 2 3 4 5 6 7 8 9
do
	do_sort "0$i"
done

for i in 10 11 12
do
	do_sort "$i"
done
