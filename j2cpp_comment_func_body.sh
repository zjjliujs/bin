#!/bin/bash

function commentFuncBody() {
    funcType=$1

    echo "Comment out ${funcType} body!"
    if [ "${funcType}" == "void" ]
    then
        #void 函数没有return语句
        sed -i "s/^${funcType} .*(.*{/&\n\tassert(false);\n\t\/*/" ${targetFile}
    else
        sed -i "s/^${funcType} .*(.*{/&\n\tassert(false);\n\treturn 0;\n\t\/*/" ${targetFile}
    fi
}

if [ ! $# -eq 1 ]
then
   echo "Usage: $0 <file_name>"
   echo 'Convert such as "MapShape mapShape" to "MapShape * mapShape"'
   exit 0
fi

targetFile=$1

ks=(int float "unsigned\\ char" QImage void QPainter bool MapPathInfoI GLLocateRect MapShape MapInfoI)
ks=(${ks[@]} ScaleRulerObject)
ks=(${ks[@]} ShapeInfoObject)
ks=(${ks[@]} PointObject)
for i in "${ks[@]}"
do 
    commentFuncBody "$i"
done



echo "^} --> \*/}"
sed -i "s/^}$/\*\/}/" ${targetFile}
