#!/bin/bash

echo "[`date`] Start"

cd "./results"


echo ""
echo "running file ${PBS_ARRAYID}"
cd "./run-${PBS_ARRAYID}"
# RUN 2
kira -u -D 1 -G 20 -b 1 -t 1000 < ini.dat > dyn.dat 2> log.dat
# RUN 1
# kira -u -D 1 -b 1 -t 1000 < ini.dat > dyn.dat 2> log.dat
if [ $? -eq 124 ]; then
	echo "WARNING: timeout reached for file ${PBS_ARRAYID}"
fi
echo "END: [`date`]"

cd ../..

