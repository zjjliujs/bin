#!/bin/bash

src=/cygdrive/e/mg_workspace/magneto
dst=magneto@192.168.40.92:/home/magneto/dev-magneto

scp -r ${src}/src/mgemlimport/* ${dst}/src/mgemlimport
