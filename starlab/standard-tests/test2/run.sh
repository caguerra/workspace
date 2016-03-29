#!/bin/bash
makeplummer -n 1024 -i | kira -u -D 1 -b 1 -t 1000  > dyn.dat 2> log.dat
