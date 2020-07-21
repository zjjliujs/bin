#!/bin/bash
currentPath=$(pwd | sed 's$\/$\\\/$g')
echo $currentPath
find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp"| sed "s/^\./$currentPath/"> cscope.files
cscope -bkq -i cscope.files
ctags -R
