#!/bin/bash

echo "[`date`] Start"
cd "./results"

echo ""
echo "running file ${PBS_ARRAYID}"
cd "./run-${PBS_ARRAYID}"
#RUN4
kira -u -D 1 -b 1 -G 200 -t 1000 < ini.dat > dyn.dat 2> log.dat
#RUN3
#kira -u -D 1 -b 1 -G 20 -t 1000 < ini.dat > dyn.dat 2> log.dat
#RUN1-2
#kira -u -D 1 -b 1 -t 1000 < ini.dat > dyn.dat 2> log.dat
if [ $? -eq 124 ]; then
	echo "WARNING: timeout reached for file ${PBS_ARRAYID}"
fi
echo "END: [`date`]"

cd ../..

