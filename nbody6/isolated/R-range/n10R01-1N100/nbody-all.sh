#!/bin/bash

echo "[`date`] Start"
cd ./results

for virialRadiusIndex in {2..20..1}
do
cd ./"VR-$virialRadiusIndex"
echo "running files in VR-$virialRadiusIndex"
	for filenumber in {50..5000..50}
	do
		echo ""
		echo "running file $filenumber"
	        cd "./run-$filenumber"
		echo "BEGIN: [`date`]"
	        timeout 300s nbody6 <ini.dat> output
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

