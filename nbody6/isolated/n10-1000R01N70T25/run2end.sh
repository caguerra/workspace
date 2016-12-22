#!/bin/bash
cd ./results
for numberStars in {1000..1000..100}
do
	if [ -d "stars-$numberStars" ]; then
		cd ./stars-$numberStars
		(tail -n1 ./run*/output | grep "END RUN" -B 2 | grep "==>") > goodRuns.log
		cd ..
	fi
done

cd ..

#file=$1
#tail -n1 ./results/$file/run*/output | grep END -B 2 | fgrep == 
