#!/bin/bash

cd results/

#makeplummer -n 100 -i -s 42 | set_com -r 0 100 0 -v 1 0 0 | add_power_law -G | kira -u -D 1 -b 1     -t 200 -O restart.dat > dyn.dat 2> log.dat

makeplummer -n 100 -i -s 42 | set_com -r 10000 0 0 -v 0 1 0 | add_tidal -F 1 -J 1 | kira -u -D 1 -b 1 -t 200 -O restart.dat > dyn.dat 2> log.dat
cd ..


# Seems that velocity must be in the x direction.
# Seems that angular velocity is in the z direction.

