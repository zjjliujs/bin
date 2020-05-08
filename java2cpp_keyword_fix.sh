#!/bin/bash
#为每一行函数添加virtual关键字
if [ $# -eq 0 ]
then
	echo "Usage:cmd <fileName> [<fileName>...]"
	exit 1
fi

for f in $@
do
	echo "Process $f ..."
	echo "boolean -> bool ..."
	sed -i "s/\<boolean\>/bool/" $f
	echo "Done"
done
