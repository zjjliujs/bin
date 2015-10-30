#!/bin/bash

rsync -av /cygdrive/e/mg_workspace/magneto/src/mgemlimport/* /cygdrive/e/mg_workspace/mg_emlparse/src/mgemlimport/
rsync -av /cygdrive/e/mg_workspace/magneto/test/mgemlimport/* /cygdrive/e/mg_workspace/mg_emlparse/test/mgemlimport/
cp /cygdrive/e/mg_workspace/magneto/lib/jargs.2_0.jar /cygdrive/e/mg_workspace/mg_emlparse/lib
