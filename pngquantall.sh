#!/bin/bash
Echo "Will overwrite all .png file!!"
Echo "Y to continue, others exit"

read answer
if [ "Y" != "$answer" ]
then
	exit 0
fi

tmpf="temp_file"
if [ -e $tmpf ]
then
	echo "Temprary file $tmpf exist!"
	exit 2
fi

for file in *.png
do 
	pngquant --strip -f -o "${tmpf}" "${file}"
	new_size=$( du -b ${tmpf}|awk '{print $1}' )
	old_size=$( du -b ${file}|awk '{print $1}' )
	if [ -f "${tmpf}" -a "${tmpf}" -nt "${file}" ]
	then
		if [ ${new_size} -lt ${old_size} ]
		then
			echo "$file be compressed successfully :)"
			rm -f "${file}"
			mv "${tmpf}" "${file}"
		else
			echo "$file size not compressed :("
		fi
	fi
done

rm -f $tmpf
echo "Done"
