#/bin/bash

for i in *
do
	f="$i"
	lower_f="${i,,*}"
	if [ "$f" != "${lower_f}" ]
	then
		mv -v "${f}" "${lower_f}"
	fi
done
