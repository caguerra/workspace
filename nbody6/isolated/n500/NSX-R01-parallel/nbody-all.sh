#!/bin/bash
jobwait() { while [ `jobs | wc -l` -gt $1 ]; do sleep .1; done }

echo "[`date`] Start"

cd results/

for filenumber in {1..32..1}
do
	echo ""
	echo "running file $filenumber"
    cd "./run-$filenumber"
    timeout 120s nbody6 <ini.dat> output &
    jobwait 8
	cd ..
done
wait

cd ..

echo "[`date`] End"
echo "elapsed time: $SECONDS"
echo all done