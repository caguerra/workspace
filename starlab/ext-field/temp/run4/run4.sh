#!/bin/bash
makeplummer -n 100 -i -s 42 | add_tidal -F 1 -J 100 | kira -u -D 1 -b 1 -t 1000 -O restart4.dat > dyn4.dat 2> log4.dat
