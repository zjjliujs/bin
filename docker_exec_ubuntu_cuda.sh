#!/bin/bash
if [ $# -ne 1 ]
then
    echo "Usage: <command> <container_id>"
    exit
fi

container_id=$1

docker exec  -w /root -it ${container_id} "/bin/bash"
    
