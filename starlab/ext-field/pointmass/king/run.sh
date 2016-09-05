#!/bin/bash

# RUN 1
mkdir results/
cd results/
makeking -n 100 -w 3 -i -u -s 642378 | makemass -f 1 -l 0.5 -u 50 -s 4233 | set_com -r 0. 2463. 0. -v 1 0 0 | add_tidal -F 1 -J 1 | scale -R 1 -M 1 -Q 0.5 | kira -u -D 1 -b 1 -t 500 > dyn.dat 2> log.dat
cd ..

#

