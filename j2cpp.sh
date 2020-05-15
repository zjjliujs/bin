#!/bin/bash

if [ ! $# -ge 1 ]
then
        echo "Usage: $0 <file_name> [<class_name>] [static]"
        exit 0
fi

targetFile=$1


echo "Remove Math. ..."
sed -i "s/\<Math\.//g" ${targetFile}

for k in "@Override" 
do
    echo "Remove ${k} ..."
    sed -i "/${k}/d" ${targetFile}
done

for k in 'transient' 'abstract'
do
    echo "Remove ${k} ..."
    sed -i "s/\<${k}\>//" ${targetFile}
done

for k in public protected private
do
    echo "Remove ${k} synchronized ..."
    sed -i "s/${k}[^:]\+synchronized //" ${targetFile}
    echo "Remove ${k} ..."
    sed -i "s/${k}[ \t]\+//" ${targetFile}
done

function keyConv() {
    if [ $# -ne 2 ]
    then
        echo "Error: wrong param# $@"
        return
    fi
    o=$1
    n=$2
    echo "Convert ${o} --> ${n} ..."
    sed -i "s/\<${o}\>/${n}/g" ${targetFile}
}

keyConv boolean bool
keyConv null NULL
keyConv Integer int
keyConv Float float
keyConv Paint "QPainter *"
keyConv Bitmap "QImage *"
keyConv String "char *"
keyConv byte "unsigned char"


function staticCallConv() {
    k=$1
    if [ ${#k} -lt 3 ] #3是随便定的数字
    then
        echo "Seem wrong class name: ${k}"
        return
    fi
    echo "Convert ${k}. --> ${k}:: ..."
    sed -i "s/\(\<${k}\)\./\1::/g" ${targetFile}
}

staticCallConv GLMathUtils
staticCallConv MapUtils
staticCallConv ShapeUtils

echo "fix float literal..."
sed -i "s/\(\<[0-9]\+\)f\>/\1.f/g" ${targetFile}
#把0.5.f改回来
sed -i "s/\(\<[0-9]\+\)\.\([0-9]\+\)\.f\>/\1.\2f/g" ${targetFile}

echo "Array to pointer..."
for k in int float bool 
do
   sed -i "s/\(${k}\)\[\] /\1 * /g" ${targetFile}
done

if [[ "${targetFile}" =~ ".h" ]]
then
    echo "Remove = NULL..."
    sed -i "s/[ \t]*=[ \t]*NULL[ \t]*//g" ${targetFile}
    echo "Remove = false..."
    sed -i "s/[ \t]*=[ \t]*false[ \t]*//g" ${targetFile}
fi


if [[ "${targetFile}" =~ ".cpp" ]]
then
    sed -i "s/\<this\>\./this->/g" ${targetFile}

    if [ $# -gt 1 ]
    then
        #增加类限定
        targetFile=$1
        className=$2
        if [ $# -gt 2 ]
        then
            prefix=1
        else
            prefix=0
        fi

        for k in int float bool void double "unsigned char"
        do
            if [ ${prefix} -eq 1 ]
            then
                #sed -i "s/\(^[ \t]*\)\(static[ \t]\+\)\(${k}\) /\1\3 ${className}::/" ${targetFile}
                sed -i "s/\(^[ \t]*\)\(static[ \t]\+\)\(${k}\)\([ \t]\+\)\([^ \t(]\+(\)\+/\1\3 ${className}::\4/" ${targetFile}
            else
                echo "${k} ... -> ${k} ${className}:: ..."
                sed -i "s/\(^[ \t]*\)\(${k}\)\([ \t]\+\)\([^ \t(]\+(\)\+/\1\2 ${className}::\4/" ${targetFile}
            fi
            echo "${className}::${className} ..."
            sed -i "s/^${className}(/${className}::&/" ${targetFile}
        done

        for k in int float bool void double
        do
            echo "Fix issue ${k} ${className}::abcd = ..."
            sed -i "s/\(^[ \t]\+${k}\)[ \t]\+${className}::\([^=]\+=\)/\1 \2/" ${targetFile}
            echo "Fix issue ${k} ${className}::abcd, ..."
            sed -i "s/\(^[ \t]\+${k}\)[ \t]\+${className}::\([^=]\+,\)/\1 \2/" ${targetFile}
            echo "Fix issue ${k} ${className}::abcd; ..."
            sed -i "s/\(^[ \t]\+${k}\)[ \t]\+${className}::\([^=]\+;\)/\1 \2/" ${targetFile}
        done

        echo "Fix ${className}::${className}:: ..."
        sed -i "s/${className}::${className}::/${className}::/" ${targetFile}
    fi
fi


echo Done！
