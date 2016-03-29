#!/bin/bash
echo "START: [`date`]"
for randomseed in {1..50..1}
do
    echo $randomseed
    echo "TIME: [`date`]"
    (makeplummer -n 100 -i -s $randomseed | makemass -f 8 -l 0.1 -u 50 | scale -s | add_tidal -F 1 -J 10 |(kira -u -D 1 -b 1 -t 1000 > "dyn-$randomseed.dat" 2> "log-$randomseed.dat")) 2> stderr.dat 
done 

echo "END: [`date`]"

echo $SECONDS

echo all done
