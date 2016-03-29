#!/bin/bash
#Create a King model with a power-law mass spectrum and a binary population, then evolve it with stellar and binary evolution
makeking -n 500 -w 5 -i -u \
	| makemass -f 1 -x -2.0 -l 0.1 -u 20 \
	| makesecondary -f 0.1 -l 0.1 \
	| add_star -Q 0.5 -R 5 \
	| scale -M 1 -E -0.25 -Q 0.5 \
	| makebinary -f 1 -l 1 -u 1000 -o 2 \
	| kira -t 100 -d 1 -D 10 -f 0.3 \
                      -n 10 -q 0.5 -Q -G 2 -B
