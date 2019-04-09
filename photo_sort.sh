#/bin/sh
function do_sort {
	dir="$1/$2"

	if [ ! -d "${dir}" ]
	then
		mkdir -p "${dir}"
	fi

	if [ -d "${dir}" ]
	then
		mv -fv *$1$2*.jpg "${dir}" 2> /dev/null
		mv -fv *$1$2*.JPG "${dir}" 2> /dev/null
		mv -fv *$1$2*.jpeg "${dir}" 2> /dev/null
		mv -fv *$1$2*.png "${dir}" 2> /dev/null
		mv -fv *$1$2*.PNG "${dir}" 2> /dev/null
		mv -fv *$1$2*.mp4 "${dir}" 2> /dev/null
		mv -fv *$1$2*.MP4 "${dir}" 2> /dev/null
		mv -fv *$1$2*.3gp "${dir}" 2> /dev/null

		mv -fv *$1_$2*.jpg "${dir}" 2> /dev/null
		mv -fv *$1_$2*.JPG "${dir}" 2> /dev/null
		mv -fv *$1_$2*.jpeg "${dir}" 2> /dev/null
		mv -fv *$1_$2*.png "${dir}" 2> /dev/null
		mv -fv *$1_$2*.PNG "${dir}" 2> /dev/null
		mv -fv *$1_$2*.mp4 "${dir}" 2> /dev/null
		mv -fv *$1_$2*.MP4 "${dir}" 2> /dev/null
		mv -fv *$1_$2*.3gp "${dir}" 2> /dev/null

		mv -fv *$1-$2*.jpg "${dir}" 2> /dev/null
		mv -fv *$1-$2*.JPG "${dir}" 2> /dev/null
		mv -fv *$1-$2*.jpeg "${dir}" 2> /dev/null
		mv -fv *$1-$2*.png "${dir}" 2> /dev/null
		mv -fv *$1-$2*.PNG "${dir}" 2> /dev/null
		mv -fv *$1-$2*.mp4 "${dir}" 2> /dev/null
		mv -fv *$1-$2*.MP4 "${dir}" 2> /dev/null
		mv -fv *$1-$2*.3gp "${dir}" 2> /dev/null
	else
		echo "${dir} not found!"
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
	do_sort "$year" "0$i"
done

for i in 10 11 12
do
	do_sort "$year" "$i"
done
