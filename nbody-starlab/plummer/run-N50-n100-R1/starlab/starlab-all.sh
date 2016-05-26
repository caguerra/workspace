#!/bin/bash

echo "[`date`] Start"

cd "./results"

for filenumber in {3700..5000..100}
do
        echo ""
        echo "running file $filenumber"
        cd "./run-$filenumber"
        echo "BEGIN: [`date`]"
        timeout 5m kira -u -D 1 -b 1 -t 1000 -O restart.dat < ini.dat > dyn.dat 2> log.dat
	if [ $? -eq 124 ]; then
		echo "WARNING: timeout reached"
	fi
        echo "END: [`date`]"
        cd ..
done

cd ..

echo `pwd`
echo "[`date`] End"
echo "time elapsed: $SECONDS"
echo all done

