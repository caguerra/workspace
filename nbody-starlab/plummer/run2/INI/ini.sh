#!/bin/bash

echo "[`date`] Start"

if [ ! -d ./results ]; then
	mkdir results
fi

if [ ! -d ./results/starlab ]; then
	mkdir ./results/starlab 
fi

cd "./results/starlab/" 

for randomseed in {100..5000..100}
do
	echo "creating file number: $randomseed"
	mkdir "run-$randomseed"
	makeplummer -n 100 -i -s $randomseed |makemass -f 8 -l 0.1 -u 50 -s $randomseed | scale -s > "./run-$randomseed/ini-$randomseed.dat"
done

cd ../../
echo `pwd`
echo "[`date`] End"
echo "time elapsed: $SECONDS"
echo "all done"

