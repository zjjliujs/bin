#!/bin/bash
if [ $# -ne 1 ]
then
  echo "usage: kill_by_ip <partial-ip>"
  exit 1
fi

ip_part=$1

ttys=$(who|grep -e "${ip_part})"|awk '{print $2}')

#echo $ttys
#exit 1

for tty in ${ttys}
do
  ps aux|grep "@${tty}"|grep -v grep|awk '{print $2}'|xargs kill
done
