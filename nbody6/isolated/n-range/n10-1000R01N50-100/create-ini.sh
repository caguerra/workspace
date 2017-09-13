#!/bin/bash

echo "[`date`] Start"

mkdir ./results
cd ./results

for numberStars in {500..1000..100}
do
	mkdir ./stars-$numberStars
	cd ./stars-$numberStars
	num=$(echo "2 * sqrt ($numberStars )" | bc)
	for randomseed in {100..5000..100}
	do
		mkdir "./run-$randomseed/"
	  	cat << EOF > ./run-$randomseed/ini.dat
1 20.0
$numberStars 1 5 $randomseed $num 1
0.02 0.01 0.3 2.0 1.0 500.0 1.0E-03 0.1 0.5
0 0 1 0 1 0 0 0 2 0
0 0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0
2.0E-05 0.001 0.2 1.0 1.0E-06 0.001
2.3 10.0 0.2 0 0 0.002 0 5.0
0.5 0 0 0 1.0
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
