#!/bin/bash

src=/cygdrive/e/mg_workspace/mg_deploy
dst=magneto@192.168.40.36:/home/magneto/dev-magneto

scp  ${src}/src/mgdeploy/*.java ${dst}/src/mgdeploy
scp  ${src}/src/mgdeploy/exception/*.java ${dst}/src/mgdeploy/exception
scp  ${src}/src/mgdeploy/intf/*.java ${dst}/src/mgdeploy/intf
scp  ${src}/src/mgdeploy/jargs/*.java ${dst}/src/mgdeploy/jargs
scp  ${src}/src/mgdeploy/jsch/*.java ${dst}/src/mgdeploy/jsch
scp  ${src}/data/mgdeploy.json ${dst}/src/mgdeploy/data
