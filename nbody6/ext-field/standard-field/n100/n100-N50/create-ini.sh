#!/bin/bash

echo "[`date`] Start"

for randomseed in {100..5000..100}
do
	mkdir "./run-$randomseed/"
  	cat << EOF > ./run-$randomseed/ini.dat
1 20.0
100 1 10 $randomseed 20 1
0.01 0.01 0.3 2.0 1.0 500.0 1.0E-03 1.0 0.5
0 0 1 0 1 0 0 0 0 0
0 0 0 1 0 0 2 0 0 2
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0
2.0E-05 0.0001 0.2 1.0 1.0E-06 0.001
2.3 50.0 0.2 0 0 0.002 0 5.0
0.5 0 0 0 0.125
EOF
	echo $randomseed
done

cd ..
echo `pwd`
echo "[`date`] End"
echo "time elapsed: $SECONDS"
echo all done

