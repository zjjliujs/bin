#/bin/bash
ids=$( docker container ls -a -q |awk '/[0-9]+/{print $1}' )
if [ ${#ids} -lt 1 ]
then
    echo "No docker container found!"
    exit
fi
docker container stop ${ids}
docker container prune -f
