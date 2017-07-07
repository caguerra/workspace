#!/bin/bash

echo "[`date`] Start"

cd results/
for randomseed in {1..120..1}
do
	mkdir "./run-$randomseed/"
  	cat << EOF > ./run-$randomseed/ini.dat
1 20.0
250 1 10 $randomseed 60 1
0.01 0.01 0.3 2.0 10.0 1500.0 1.0E-03 0.1 0.5
0 0 1 0 1 0 0 0 0 0
0 0 0 0 0 0 0 0 0 2
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
4.0E-05 0.001 0.2 1.0 1.0E-06 0.001
2.3 50.0 0.2 0 0 0.002 0 5.0
0.5 0 0 0 0.25
EOF
	echo $randomseed
done

cd ..
echo `pwd`
echo "[`date`] End"
echo "time elapsed: $SECONDS"
echo all done

