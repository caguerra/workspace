#!/bin/bash
cd "./results"
makeplummer -n 400 -i |makemass -f 8 -l 0.1 -u 50 | scale -s > ini.dat
cd ..

