#!/bin/bash
tail -n1 ./results/input*/run*/output | grep "END RUN" -B 2 | grep "==>"

#file=$1
#tail -n1 ./results/$file/run*/output | grep END -B 2 | fgrep == 
