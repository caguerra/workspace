#!/bin/bash

echo "[`date`] Start"

for filenumber in {100..5000..100}
do
	echo $filenumber
        cd "run-$filenumber"
        rm -rf ini.dyn
        cd ..
done

echo "[`date`] End"
echo $SECONDS
echo all done

