#!/bin/bash
path=.
if [ $# -gt 0 ]
then
  path=$@
fi

currentPath=$(pwd | sed 's$\/$\\\/$g')
echo $currentPath
find $path -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp"| sed "s/^\./$currentPath/"> cscope.files
cscope -bkq -i cscope.files
ctags -R
