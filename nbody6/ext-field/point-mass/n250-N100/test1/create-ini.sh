#!/bin/bash

echo "[`date`] Start"

cd results/
for filenumber in {1..100..1}
do
	mkdir "./run-$filenumber/"
  	cat << EOF > ./run-$filenumber/ini.dat
1 20.0
250 1 10 $RANDOM 60 1
0.01 0.01 0.3 2.0 1.0 1500.0 1.0E-02 0.1 0.5
0 0 1 0 1 0 0 0 0 0
0 0 0 2 0 0 0 0 0 2
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0
2.0E-05 0.0001 0.2 1.0 1.0E-06 0.001
2.3 50.0 0.2 0 0 0.002 0 5.0
0.5 0 0 0 0.125
4.D+6 8
EOF
	echo $filenumber
done

cd ..
echo `pwd`
echo "[`date`] End"
echo "time elapsed: $SECONDS"
echo all done

