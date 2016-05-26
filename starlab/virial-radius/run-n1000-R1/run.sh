#!/bin/bash
mkdir results/
cd results/
makeplummer -n 1000 -i -s 42 | scale -R 1 -M 1 -Q 0.5| kira -u -D 1 -b 1 -t 1000 > dyn.dat 2> log.dat
cd ..
