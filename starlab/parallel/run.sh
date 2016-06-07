#!/bin/bash
echo "[`date`] Start"
cd "./results"

(mpirun -np 4 kira -u -D 1 -b 1 -t 1 -R ini.dat) > dyn.dat 2> log.dat 
#mpirun -np 4 kira -u -D 1 -b 1 -t 1000 -R ini.dat > dyn.dat 2> log.dat
#kira -u -D 1 -b 1 -t 1000 -R ini.dat > dyn.dat 2> log.dat

cd ..
echo "[`date`] End"
echo "time elapsed: $SECONDS"
echo all done
