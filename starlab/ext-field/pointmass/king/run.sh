#!/bin/bash

# RUN 1
mkdir results/
cd results/
make_aniso_king -n 100 -w 3 -i -u -F 1 -s 642378 | makemass -f 1 -l 0.5 -u 50 -s 4233 | add_star -R 1 |  set_com -r 0. 8000. 0. -v 0.0 0.0 1.0 | scale -R 0.1 -M 1 -Q 0.5 | kira -u -D 1 -b 1 -t 500 > dyn.dat 2> log.dat
cd ..

#

