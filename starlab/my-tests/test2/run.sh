#!/bin/bash
makeplummer -n 10 -i -s 1 | kira -u -D 1 -b 1 -t 10 > dyn1.dat 2> log1.dat
makeplummer -n 10 -i -s 1 | scale -s | kira -u -D 1 -b 1 -t 10 > dyn2.dat 2> log2.dat
makeplummer -n 10 -i -s 1 | add_star -R 1 -M 1 | scale -s | kira -u -D 1 -b 1 -t 10 > dyn3.dat 2> log3.dat
