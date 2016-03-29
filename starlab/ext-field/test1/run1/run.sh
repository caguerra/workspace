#!/bin/bash

# tidal_center = 10000 0 0 (in starlab)

makeplummer -n 10 -i -s 42 | add_tidal -F 1 -J 8 | set_com -r 0 0 10000 -v 1 0 0  | kira -n 1 -u -D 1 -b 1 -t 1000 > dyn.dat 2> log.dat

# | scale -r 1 -m 10 -q 0.5 