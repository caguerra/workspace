#!/bin/bash
#Create a 500-particle W0 = 5 King model, with numbered stars, unscaled
makeking -n 500 -w 5 -i -u > dyn.dat 2> log.dat &
