#~/bin/bash

for f in $@
do
    echo $f
    sed -i 's/args/self.args/g' $f
    sed -i 's/cfg/self.cfg/g' $f
    sed -i 's/dataLoader/self.dataLoader/g' $f
    sed -i 's/iteration/self.iteration/g' $f
    sed -i 's/self\.self\./self./g' $f
done
