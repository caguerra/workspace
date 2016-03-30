#!/bin/bash

echo "[`date`] Start"

cd "./results/starlab/" 

for randomseed in {100..5000..100}
do
	echo $randomseed
	mkdir "run-$randomseed"
	makeplummer -n 100 -i -s $randomseed |makemass -f 8 -l 0.1 -u 50 -s $randomseed | scale -s > "./run-$randomseed/ini-$randomseed.dat"
done

cd ../../

echo "[`date`] End"
echo $SECONDS
echo all done

