#!/bin/bash

echo "[`date`] Start"

cd results/

for filenumber in {1..100..1}
do
	echo ""
	echo "running file $filenumber"
        cd "./run-$filenumber"
	echo "BEGIN: [`date`]"
        timeout 240s nbody6 <ini.dat> output
        if [ $? -eq 124 ]; then
                echo "WARNING: timeout reached"
        fi
	echo "END: [`date`]"
        tail -n1 output
	cd ..
done

cd ..

echo "[`date`] End"
echo "elapsed time: $SECONDS"
echo all done

