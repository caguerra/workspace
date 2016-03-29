#!/bin/bash
makeplummer -n 100 -i -s 42 | kira -u -D 1 -b 1 -G 10000 -t 1000 > dyn.dat 2> log.dat
