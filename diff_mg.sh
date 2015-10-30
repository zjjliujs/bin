#!/bin/bash

src=~/magneto
dst=/cygdrive/e/mg_workspace/magneto

pattern_file=~/bin/exclude.diff_mg 

diff -r --brief -x"*.sh" -x"*.thrift" -X${pattern_file} ${src}/src/ ${dst}/src/
