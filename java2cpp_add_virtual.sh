#!/bin/bash
#为每一行函数添加virtual关键字
if [ $# -eq 0 ]
then
	echo "Usage:cmd <fileName> [<fileName>...]"
	exit 1
fi

rts=(int float double void bool byte[] \
	MapShape UpwardRect UpwardRect MapSegment \
	LinkedList String MapDataInfoI MapConfigI \
	MapResMgrI List Integer GLLocateRect MapPathInfoI \
	MapType) 

for f in $@
do
	for k in ${rts[@]}
	do
		echo "$k --> virtual $k ... at file $f"
		sed -i "s/\(^[ \t]*\)\($k\)/\1virtual \2/" $f
		echo "Completed"
	done	
	echo "Done"
done
