#!/bin/bash

echo "[`date`] Start"

for filenumber in {3800..5000..100}
do
        echo ""
        echo "running file $filenumber"
        cd "run-$filenumber"
        echo "BEGIN: [`date`]"
        kira -u -D 1 -b 1 -t 1000 -O restart.dat < ini.dat > dyn.dat 2> log.dat
        echo "END: [`date`]"
        cd ..
done

echo "[`date`] End"
echo $SECONDS
echo all done

