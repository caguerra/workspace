#!/bin/bash
#Create a 500-particle Plummer model, with numbered stars, scaled to standard dynamical units
makeplummer -n 500 -i > dyn.dat 2> log.dat
