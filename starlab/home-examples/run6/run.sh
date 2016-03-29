#!/bin/bash
#!Create a 500-particle W0 = 5 King model with a Miller-Scalo mass spectrum between 0.1 and 20 solar masses, add in a 10 percent 1-10 kT binary population, then rescale to unit total mass, total energy (top-level nodes) -0.25, and virial ratio (top-level nodes) 0.5, and finally verify the results by analyzing the final snapshot
makeking -n 500 -w 5 -i -u \
	| makemass -f 2 -l 0.1 -u 20 \
	| makesecondary -f 0.1 -l 0.25 \
	| makebinary -l 1 -u 10 \
	| scale -m 1 -E -0.25 -q 0.5 | tee dyn.dat \
	| (sys_stats -n 2> sys_stats.dat)

#Questions:
#the order of 6 and 7 matters?
