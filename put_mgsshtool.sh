#!/bin/bash

src=/cygdrive/e/mg_workspace/mg_sshtool/
dst=magneto@192.168.40.92:/home/magneto/dev-magneto

scp -r ${src}/src/mgsshtool/* ${dst}/src/mgsshtool
