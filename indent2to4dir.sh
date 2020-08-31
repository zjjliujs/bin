#!/bin/bash
for i in *.py
do
    if [ $i != "sparse.py" -a $i != "__init__.py" ]
    then 
        echo $i
        indent2to4.sh $i
    fi
done
