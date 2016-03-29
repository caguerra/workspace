#!/bin/bash
echo "[`date`] Start"
for randomseed in {3200..5000..100}
do
    echo $randomseed
    makeplummer -n 1000 -i -s $randomseed | kira -u -D 1 -b 1 -t 1000 -O "restart-$randomseed.dat" > "dyn-$randomseed.dat" 2> "log-$randomseed.dat"
done
echo "[`date`] End"

echo $SECONDS

echo all done
