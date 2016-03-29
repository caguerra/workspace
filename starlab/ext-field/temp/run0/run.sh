#!/bin/bash
makeplummer -n 100 -i -s 42 | add_star -M 1 -R 1 | scale -s | add_tidal -F 1 -J 1000000 | kira -u -D 1 -b 1 -t 1000 -O restart.dat > dyn.dat 2> log.dat
