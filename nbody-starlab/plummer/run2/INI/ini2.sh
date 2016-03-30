#!/bin/bash

echo "[`date`] Start"

cd "./results/"

for randomseed in {100..5000..100}
do
	echo $randomseed
	mkdir "./nbody-tmp/run-$randomseed/"
	dumbp < "./starlab/run-$randomseed/ini-$randomseed.dat" > "./nbody-tmp/run-$randomseed/ini-$randomseed.dat"
done

cd ..

echo "[`date`] End"
echo $SECONDS
echo all done

