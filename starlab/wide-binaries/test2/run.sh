#!/bin/bash
makeplummer -n 100 -i |makemass -f 8 -l 0.1 -u 50 | scale -s | add_tidal -F 1 -J 10 | kira -u -D 1 -G 20 -b 1 -t 1000 -O restart.dat > dyn.dat 2> log.dat
