#!/bin/bash
mkdir results/
cd results/
makeplummer -n 100 -i -s 123 | scale -R 0.01 -M 1 -Q 0.5 | kira -G 1000 -u -D 1 -b 1 -t 1000 > dyn.dat 2> log.dat
cd ..
