#!/bin/bash

BASEDIR=$(dirname "$0")

cd "$BASEDIR"/results

(tail -n1 ./run*/output | grep "END RUN" -B 2 | grep "==>") > goodRuns.log

cd ..

#file=$1
#tail -n1 ./results/$file/run*/output | grep END -B 2 | fgrep == 
