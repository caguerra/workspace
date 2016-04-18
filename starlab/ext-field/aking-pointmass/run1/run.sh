#!/bin/bash
cd results

make_aniso_king -n 100 -w 3 -i -u -F 1 | makemass -f 1 -l 0.5 -u 50 | set_com -r 0. 8000. 0. -v 100. 0. 0. |scale -R 1 -M 1 | kira -u -D 1 -b 1 -t 1000 > dyn.dat 2> log.dat

cd ..
