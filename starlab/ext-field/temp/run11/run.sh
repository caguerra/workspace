#!/bin/bash

makeplummer -n 20 -i -s 42 -r 1 | add_tidal -F 1 -J 8 | set_com -r 1000 0 0 -v 0 0 0 | kira -n 1 -u -D 1 -b 1 -t 1000 > dyn.dat 2> log.dat

# makeplummer -n 100 -i -s 42 | add_tidal -F 1 -J 8 | scale -r 1 -m 100 -q 0.5 | kira -n 1 -u -D 1 -b 1 -t 2 > dyn.dat 2> log.dat

#  | set_com -r 10000 0 0