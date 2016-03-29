#!/bin/bash

echo "[`date`] Start"

for randomseed in {100..5000..100}
do
	echo $randomseed
	dumbp < "../INI/ini-$randomseed.dat" > "ini-$randomseed-nb6.dat"
done

echo "[`date`] End"
echo $SECONDS
echo all done

