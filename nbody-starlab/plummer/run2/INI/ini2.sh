#!/bin/bash

echo "[`date`] Start"

cd "./results/"

if [ ! -d ./nbody-tmp ]; then
	mkdir ./nbody-tmp
fi

for randomseed in {100..5000..100}
do
	echo $randomseed
	mkdir "./nbody-tmp/run-$randomseed/"
	dumbp < "./starlab/run-$randomseed/ini-$randomseed.dat" > "./nbody-tmp/run-$randomseed/ini-$randomseed.dat"
done

cd ..

echo "[`date`] End"
echo "time elapsed: $SECONDS"
echo all done

