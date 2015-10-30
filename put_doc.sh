#!/bin/bash

if [ $# -lt 1 ]
then
	echo "Usage: put_doc.sh <file_to_put>"
	exit 1
fi

src=/cygdrive/e/mg_workspace/magneto
dst=magneto@192.168.40.51:/home/magneto/doc

scp -r $@ ${dst}
