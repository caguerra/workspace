#!/bin/bash
#Create a system of 100 nodes with a Salpeter mass spectrum with masses in the range 0.5 to 10
makenode -n 100 | makemass -f 1 -x -2.35 -l 0.5 -u 10 > dyn.dat
