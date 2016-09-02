#!/bin/bash
# IMPORTANT : add_tidal --help says that this should be used before scale and after add_star
# I guess this is the same thing with add_power_law, at least in this order the log file
# has the correct initial value for the virial_ratio.

#RUN-4
mkdir results/
cd results/
makeking -n 100 -w 3 -i -u -s 642378 | makemass -f 1 -l 0.5 -u 50 -s 4233 | add_star -R 1 | scale -R 0.1 -M 1 -Q 0.5 | add_power_law -G | set_com -r 8000. 0. 0. -v 0 1.0 0 | kira -u -D 1 -b 1 -t 500 > dyn.dat 2> log.dat
cd .. 

#RUN-3
# mkdir results/
# cd results/
# makeking -n 100 -w 3 -i -u -s 642378 | makemass -f 1 -l 0.5 -u 50 -s 4233 | scale -R 0.1 -M 1 -Q 0.5 | add_power_law -G | set_com -r 8000. 0. 0. -v 0 1.0 0 | kira -u -D 1 -b 1 -t 500 > dyn.dat 2> log.dat
# cd .. 


#RUN-2
# mkdir results/
# cd results/
# makeking -n 100 -w 3 -i -u -s 642378 | makemass -f 1 -l 0.5 -u 50 -s 4233 | add_power_law -G | set_com -r 8000. 0. 0. -v 0 1.0 0 | scale -R 0.1 -M 1 -Q 0.5 | kira -u -D 1 -b 1 -t 500 > dyn.dat 2> log.dat
# cd .. 


#RUN-1
# mkdir results/
# cd results/
# makeking -n 100 -w 3 -i -u -s 642378 | makemass -f 1 -l 0.5 -u 50 -s 4233 | add_star -R 1 | add_power_law -G | set_com -r 8000. 0. 0. -v 0 1.0 0 | scale -R 0.1 -M 1 -Q 0.5 | kira -u -D 1 -b 1 -t 500 > dyn.dat 2> log.dat
# cd ..
