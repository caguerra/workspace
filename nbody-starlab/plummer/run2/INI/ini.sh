#!/bin/bash

echo "[`date`] Start"

for randomseed in {100..5000..100}
do
	echo $randomseed
	makeplummer -n 100 -i -s $randomseed |makemass -f 8 -l 0.1 -u 50 -s $randomseed | scale -s > "ini-$randomseed.dat"
done

echo "[`date`] End"
echo $SECONDS
echo all done

