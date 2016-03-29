#!/bin/bash
makeplummer -n 30 -i -s 1 |makemass -f 8 -l 0.1 -u 50 | scale -s | add_tidal -F 1 -J 10 | kira -u -D 1 -b 1 -t 500 -O restart.dat > dyn.dat 2> log.dat

makeplummer -n 30 -i -s 1 |makemass -f 8 -l 0.1 -u 50 | scale -s | add_tidal -F 1 -J 10 | kira -u -D 1 -G 2 -b 1 -t 500 -O restart2.dat > dyn2.dat 2> log2.dat

