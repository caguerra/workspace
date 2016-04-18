#!/bin/bash
cd results

#makeking -n 100 -w 3 -i -u | makemass -f 1 -l 0.5 -u 50 | scale -R 1 -M 1 | add_power_law -G | set_com -r 8000. 0. 0. -v 0 1 0  | kira -u -D 1 -b 1 -t 500 > dyn.dat 2> log.dat

makeking -n 100 -w 3 -i | makemass -f 1 -l 0.5 -u 50 |scale -R 1 -M 1| add_tidal -F 1 -J 1 | set_com -r 900 900 0 -v 0 1 0 | kira -u -D 1 -b 1 -t 200 > dyn.dat 2> log.dat

cd ..
