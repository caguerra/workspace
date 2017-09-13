#!/bin/bash

echo "[`date`] START NBODY SIM"

mkdir ./results
cd ./results

stars1=({10..90..10});
stars2=({100..480..20});
stars3=({500..1000..50});
starsAll=("${stars1[@]}" "${stars2[@]}" "${stars3[@]}")

for numberOfStars in ${starsAll[@]}
do
	echo "Number of stars: $numberOfStars"
	mkdir ./stars-$numberOfStars
	cd ./stars-$numberOfStars
	if [ "$numberOfStars" -gt "250" ]; 
	then
		ETAI=0.02
		SMAX=1.0
	else
		ETAI=0.01
		SMAX=0.25
	fi 
	NNBMAX=$(echo "2 * sqrt ($numberOfStars)" | bc)
	totalTime=$(echo "37.4175 * sqrt($numberOfStars * 1.000000) / 1"| bc)
	for fileNumber in {1..70..1}
	do
		randomSeed=$RANDOM
		mkdir "./run-$fileNumber/"
	  	cat << EOF > ./run-$fileNumber/ini.dat
1 20.0
$numberOfStars 1 5 $randomSeed $NNBMAX 1
$ETAI 0.01 0.3 2.0 10.0 $totalTime 1.0E-03 0.1 0.5
0 0 1 0 1 0 0 0 2 0
0 0 0 0 0 1 0 0 0 6
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0
2.0E-05 0.001 0.2 1.0 1.0E-06 0.001
2.3 50.0 0.1 0 0 0.002 0 5.0
0.5 0 0 0 $SMAX
EOF
	done
	cd ..
done
cd ..

echo `pwd`
echo "[`date`] END"
echo "TIME ELAPSED: $SECONDS"
echo "ALL DONE!"
