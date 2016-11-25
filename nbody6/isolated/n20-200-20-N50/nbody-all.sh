#!/bin/bash

echo "[`date`] Start"
cd ./results

for starfilenumber in {20..200..20}
do
cd ./"stars-$starfilenumber"
echo "running files in stars-$starfilenumber"
	for filenumber in {100..5000..100}
	do
		echo ""
		echo "running file $filenumber"
	        cd "./run-$filenumber"
		echo "BEGIN: [`date`]"
	        timeout 20s nbody6 <ini.dat> output
	        if [ $? -eq 124 ]; then
	                echo "WARNING: timeout reached"
	        fi
		echo "END: [`date`]"
	        tail -n1 output
		cd ..
	done
cd ..
done

cd ..

echo "[`date`] End"
echo "elapsed time: $SECONDS"
echo all done

