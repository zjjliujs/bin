#!/bin/bash

src=/cygdrive/e/mg_workspace/magneto
dst=magneto@192.168.40.36:/home/magneto/dev-magneto

scp -r ${src}/test_data/* ${dst}/test_data/
