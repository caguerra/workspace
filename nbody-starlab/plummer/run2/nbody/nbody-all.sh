#!/bin/bash

echo "[`date`] Start"

for filenumber in {100..5000..100}
do
	echo ""
	echo "running file $filenumber"
        cd "run-$filenumber"
	echo "BEGIN: [`date`]"
        nbody6 <input> output
	echo "END: [`date`]"
        cd ..
done

echo "[`date`] End"
echo $SECONDS
echo all done

