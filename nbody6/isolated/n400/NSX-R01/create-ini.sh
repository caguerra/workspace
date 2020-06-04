#!/bin/bash
# first group 1-250

echo "[`date`] Start"

mkdir ./results/

cd results/
for filenumber in {1001..1800..1}
do
	mkdir "./run-$filenumber/"
  	cat << EOF > ./run-$filenumber/ini.dat
1 20.0
400 1 10 $RANDOM 45 1
0.02 0.01 0.22 2.0 10.0 16001.0 1.0E-03 0.1 0.5
0 0 1 0 1 0 0 0 2 0
0 0 0 0 0 0 0 0 0 6
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0
4.0E-05 0.001 0.2 1.0 1.0E-06 0.001
2.3 50.0 0.2 0 0 0.002 0 .0
0.5 0 0 0 0.5
EOF

done

cd ..
echo `pwd`
echo "[`date`] End"
echo "time elapsed: $SECONDS"
echo all done

