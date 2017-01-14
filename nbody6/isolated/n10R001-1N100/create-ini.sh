#!/bin/bash

echo "[`date`] Start"

mkdir ./results
cd ./results

for virialRadiusIndex in {1..21..1}
do
	mkdir ./VR-$virialRadiusIndex
	cd ./VR-$virialRadiusIndex
	virialRadius=$(echo "scale=7; e((($virialRadiusIndex-21)/10)*l(10))" | bc -l)
	for runNumber in {1..100..1}
	do
		randomNumber=$RANDOM
		mkdir "./run-$runNumber/"
	  	cat << EOF > ./run-$runNumber/ini.dat
1 5.0
10 1 5 $randomNumber 7 1
0.01 0.01 0.3 2.0 1.0 200.0 1.0E-03 $virialRadius 0.5
0 0 1 0 1 0 0 0 2 0
0 0 0 0 0 1 0 0 0 6
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0
2.0E-05 0.001 0.2 1.0 1.0E-06 0.001
2.3 50.0 0.1 0 0 0.002 0 5.0
0.5 0 0 0 0.25
EOF
	done
	cd ..
done
cd ..

echo `pwd`
echo "[`date`] End"
echo "time elapsed: $SECONDS"
echo all done
