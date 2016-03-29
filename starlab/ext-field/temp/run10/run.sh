#!/bin/bash
makesphere -n 10 -i -s 42 | add_tidal -F 1 -J 40 | scale -m 10 -r 0.1 -q 0.5 | kira -n 1 -u -D 1 -b 1 -t 100 > dyn.dat 2> log.dat


