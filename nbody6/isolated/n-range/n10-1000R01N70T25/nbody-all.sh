#!/bin/bash

echo "[`date`] Start"
cd ./results

stars1=({10..90..10});
stars2=({100..480..20});
stars3=({500..1000..50});
starsAll=("${stars1[@]}" "${stars2[@]}" "${stars3[@]}")

for starfilenumber in ${starsAll[@]}
do
cd ./"stars-$starfilenumber"
echo "running files in stars-$starfilenumber"
if [ $starfilenumber -lt 250 ] 
then
	timeInSeconds=180s
elif [ $starfilenumber -lt 600 ]
then
	timeInSeconds=480s 
else
	timeInSeconds=900s
fi
	for filenumber in {1..70..1}
	do
		echo ""
		echo "running file $filenumber"
	        cd "./run-$filenumber"
		echo "BEGIN: [`date`]"
	        timeout $timeInSeconds nbody6 <ini.dat> output
	        if [ $? -eq 124 ]; then
	                echo "WARNING: timeout reached"
	        fi
		echo "END: [`date`]"
	        tail -n1 output
		cd ..
	done
cd ..
done

cd ..

echo "[`date`] End"
echo "elapsed time: $SECONDS"
echo all done

