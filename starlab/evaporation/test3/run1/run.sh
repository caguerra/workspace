#!/bin/bash
makeplummer -n 100 -i -s 42 | scale -m 1 -r 0.1 -q 0.5 | kira -u -D 1 -b 1 -t 1000 > dyn.dat 2> log.dat
