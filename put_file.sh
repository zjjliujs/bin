#!/bin/bash

if [ $# -lt 1 ]
then
	echo "Usage: put_file.sh <file_to_put>"
	exit 1
fi

src=/cygdrive/e/mg_workspace/magneto
dst=magneto@192.168.40.92:/home/magneto/tmp

scp -r $@ ${dst}
