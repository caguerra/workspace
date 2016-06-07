#!/bin/bash

jobwait() { while [ `jobs | wc -l` -gt $1 ]; do sleep .1; done }

echo "[`date`] Start"

cd "./results"

for count in {1..50..1}
do
 	echo $count
	sys_stats -n < "dyn-$count.dat" 2> "sys_stats_log-$count.dat" &
	jobwait 8
done

wait

cd ..

echo "[`date`] End" 
echo $SECONDS
echo all done




