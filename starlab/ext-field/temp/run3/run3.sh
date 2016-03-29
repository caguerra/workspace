#!/bin/bash
makeplummer -n 100 -i -s 42 | add_tidal -F 1 -J 1000 | kira -u -D 1 -b 1 -t 1000 -O restart3.dat > dyn3.dat 2> log3.dat
