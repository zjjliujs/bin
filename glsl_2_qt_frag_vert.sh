#/bin/bash

for f in *.glsl
do
    #echo process ${f} ...
    
    newName=""
    if [[ $f =~ "_vertex_" ]]
    then
        newName=${f/_vertex_/_}
        newName=${newName/.glsl/.vert}
    elif [[ $f =~ "_fragment_" ]]
    then
        newName=${f/_fragment_/_}
        newName=${newName/.glsl/.frag}
    fi
    if [ ${#newName} -gt 0 ]
    then
        cp -v ${f} ${newName}        
    else
        echo "Unknown file name patter:${f}"
    fi
done
