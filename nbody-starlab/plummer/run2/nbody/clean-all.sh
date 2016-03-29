#!/bin/bash

echo "[`date`] Start"

find results/input -type f -not -name 'fort.10' -not -name 'fort.1' -delete

#cd "./results/input/"
#for filenumber in {100..5000..100}
#do
#	echo $filenumber
#       cd "./run-$filenumber"
#	ls | egrep -v -E '^(fort.10|fort.1)$' | xargs -i rm -rf {}
#       cd ..
#done
#cd ../../
#echo pwd

echo "[`date`] End"
echo $SECONDS
echo all done

