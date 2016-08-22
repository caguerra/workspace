#!/bin/bash
mkdir results/
cd results/
makeplummer -n 100 -i -s 123 | add_star -M 1 -R 1 | scale -R 1 -M 1 -Q 0.5 | kira -u -D 1 -b 1 -t 100 > dyn.dat 2> log.dat
cd ..
