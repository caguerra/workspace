#!/bin/bash
makeplummer -n 100 -i -s 42 | kira -u -D 1 -b 1 -G 5000 -t 1000 -O restart.dat > dyn.dat 2> log.dat
