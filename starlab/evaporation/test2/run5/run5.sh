#!/bin/bash
makeplummer -n 100 -i -s 42 | kira -u -D 1 -b 1 -G 700 -t 1000 -O restart5.dat > dyn5.dat 2> log5.dat
