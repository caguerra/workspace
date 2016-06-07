#!/bin/bash
echo "[`date`] Start"
for count in {1..50..1}
do
 	echo $count
	sys_stats -n < "dyn-$count.dat" 2> "sys_stats_log-$count.dat"
done
echo "[`date`] End"
 
echo $SECONDS
 
echo all done




