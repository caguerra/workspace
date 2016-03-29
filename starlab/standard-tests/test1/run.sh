#!/bin/bash
makeplummer -n 1000 -i | kira -u -D 1 -b 1 -t 1000 -O restart.dat > dyn.dat 2> log.dat
