#!/bin/bash

echo "[`date`] Start"

cd results/
for filenumber in {151..300..1}
do
	mkdir "./run-$filenumber/"
  	cat << EOF > ./run-$filenumber/ini.dat
1 20.0
1500 1 10 $RANDOM 78 1
0.02 0.02 0.34 2.0 10.0 5700.0 1.0E-03 0.1 0.5
0 0 1 0 1 0 0 0 0 0
0 0 0 0 0 0 0 0 0 2
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
4.0E-05 0.001 0.2 1.0 1.0E-06 0.001
2.3 50.0 0.2 0 0 0.002 0 5.0
0.5 0 0 0 0.5
EOF
	echo $filenumber
done

cd ..
echo `pwd`
echo "[`date`] End"
echo "time elapsed: $SECONDS"
echo all done

