#!/bin/bash
file=$1
tail -n1 ./results/$file/run*/output | grep END -B 2 | fgrep == 
