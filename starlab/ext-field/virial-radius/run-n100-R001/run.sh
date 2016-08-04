#!/bin/bash
mkdir results/
cd results/
makeking -n 100 -w 3 -i -u -s 123 | makemass -f 1 -l 0.5 -u 50 | scale -R 0.01 -M 1 -Q 0.5 | add_power_law -G | set_com -r 8000. 0. 0. -v 0 1.0 0 | kira -u -D 1 -b 1 -t 1000 > dyn.dat 2> log.dat
cd ..
