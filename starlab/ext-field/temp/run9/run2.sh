#!/bin/bash
makeking -n 100 -w 5 -u -i -s 42 | add_tidal -F 1 -J 100000 | kira -u -D 1 -b 1 -t 100 -O restart2.dat > dyn2.dat 2> log2.dat
