#!/bin/bash
jobwait() { while [ `jobs | wc -l` -gt $1 ]; do sleep .1; done }

KERNELS=32

echo "[`date`] Start"
cd results/

for filenumber in {151..300..1}
do
	echo ""
	echo "running file $filenumber"
	cd "./run-$filenumber"
	time  (timeout 600s nbody6 <ini.dat> output) 2>> timings &
	jobwait $KERNELS
	cd ..
done
wait

cd ..

echo "[`date`] End"
echo "elapsed time: $SECONDS"
echo all done
