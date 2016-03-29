#!/bin/bash
makeplummer -n 1000 -i -s 42 | scale -s | kira -u -D 1 -b 1 -t 1000 > dyn.dat 2> log.dat
