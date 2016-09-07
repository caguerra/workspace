#!/bin/bash

echo "[`date`] Start"

if [ ! -d ./results ]; then
	mkdir results
fi

cd "./results" 

for randomseed in {1..50..1}
do
	echo "creating file number: $randomseed"
	mkdir "run-$randomseed"

# RUN 1, 2
	makeplummer -n 100 -i -s $randomseed | makemass -f 8 -l 0.1 -u 50 -s $randomseed | add_star -R 1 | scale -M 1 -R 0.1 -Q 0.5> "./run-$randomseed/ini.dat"

done

cd ../
echo `pwd`
echo "[`date`] End"
echo "time elapsed: $SECONDS"
echo "all done"

