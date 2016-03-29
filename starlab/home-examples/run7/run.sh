#!/bin/bash
#Evolve this model without stellar evolution for 100 dynamical times, with log output every dynamical time and snapshot output every 10 dynamical times, with a self-consistent tidal field, removing escapers when they are more than two Jacobi radii from the cluster center
    makeking -n 500 -w 5 -i -u \
	| makemass -f 2 -l 0.1 -u 20 \
	| makesecondary -f 0.1 -l 0.25 \
	| makebinary -l 1 -u 10 \
	| scale -m 1 -e -0.25 -q 0.5 \
	| kira -t 100 -d 1 -D 10 -Q -G 2
