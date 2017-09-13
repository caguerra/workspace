#!/bin/bash

echo "[`date`] Start"

mkdir ./results
cd ./results

for virialRadiusIndex in {2..20..1}
do
	mkdir ./VR-$virialRadiusIndex
	cd ./VR-$virialRadiusIndex
	virialRadius=$(echo "scale=2; ($virialRadiusIndex)/20" | bc -l)
	for randomseed in {50..5000..50}
	do
		mkdir "./run-$randomseed/"
	  	cat << EOF > ./run-$randomseed/ini.dat
1 20.0
10 1 5 $randomseed 7 1
0.02 0.01 0.3 2.0 1.0 200.0 1.0E-03 $virialRadius 0.5
0 0 1 0 1 0 0 0 2 0
0 0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0
2.0E-05 0.001 0.2 1.0 1.0E-06 0.001
2.3 10.0 0.2 0 0 0.002 0 5.0
0.5 0 0 0 0.25
EOF
		echo $randomseed
	done
	cd ..
done
cd ..

echo `pwd`
echo "[`date`] End"
echo "time elapsed: $SECONDS"
echo all done
