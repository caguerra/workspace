#!/bin/bash

echo "[`date`] Start"

for filenumber in {100..5000..100}
do
	echo ""
	echo "running file $filenumber"
        cd "./run-$filenumber"
	echo "BEGIN: [`date`]"
        timeout 5m nbody6 <ini.dat> output
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

