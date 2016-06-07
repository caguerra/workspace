#!/bin/bash

jobwait() { while [ `jobs | wc -l` -gt $1 ]; do sleep .1; done }

echo "START: [`date`]"

cd "./results"

for randomseed in {1..50..1} 
do
    echo $randomseed
    echo "TIME: [`date`]"
	makeking -n 200 -w 3 -i -u -s $randomseed | makemass -f 1 -l 0.5 -u 50 -s $randomseed | scale -R 0.1 -M 1 | add_power_law -G | set_com -r 8000. 0. 0. -v 0 1.0 0  | (kira -u -D 1 -b 1 -t 1000 > "dyn-$randomseed.dat" 2> "log-$randomseed.dat") &
	jobwait 8
done 

wait

cd ..

echo "END: [`date`]"
echo $SECONDS
echo all done
