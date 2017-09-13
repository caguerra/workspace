#!/bin/bash
cd ./results
for virialRadiusIndex in {1..21..1}
do
	if [ -d "VR-$virialRadiusIndex" ]; then
		cd ./VR-$virialRadiusIndex
		(tail -n1 ./run*/output | grep "END RUN" -B 2 | grep "==>") > goodRuns.log
		cd ..
	fi
done

cd ..

#file=$1
#tail -n1 ./results/$file/run*/output | grep END -B 2 | fgrep == 
