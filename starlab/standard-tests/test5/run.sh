#!/bin/bash
echo "[`date`] Start"
for randomseed in {1..50..1}
do
    echo $randomseed
    makeplummer -n 1024 -i -s $randomseed | kira -u -D 1 -b 1 -t 1000 > "dyn-$randomseed.dat" 2> "log-$randomseed.dat"
done
echo "[`date`] End"

echo $SECONDS

echo all done
