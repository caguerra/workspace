#!/bin/bash
#makeplummer -n 100 -i -s 42 | kira -u -D 1 -b 1 -t 1000 -O restart1.dat > dyn1.dat 2> log1.dat
#makeking -n 100 -w 3 -i -u | makemass -f 1 -l 0.5 -u 50 | add_power_law -G | set_com -r 100000 0 0 -v 0 0.1 0 | scale -R 1 -M 1 | kira -u -D 1 -b 1 -t 1000 > dyn1.dat 2> log1.dati
makeplummer -n 100 -i | add_power_law -G | set_com -n -r 100000 0 0 -v 0 0.1 0 | scale -R 1 -M 1 | kira -u -D 1 -b 1 -t 1000 > dyn1.dat 2> log1.dat
