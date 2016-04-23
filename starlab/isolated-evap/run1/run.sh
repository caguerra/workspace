#!/bin/bash
mkdir results/
cd results/
makeplummer -n 100 -i -s 42 | scale -R 1 -M 1 | kira -u -D 1 -b 1 -G 10 -t 1000 > dyn.dat 2> log.dat
cd ..
