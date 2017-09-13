#!/bin/bash
cd ./results
stars1=({10..90..10});
stars2=({100..480..20});
stars3=({500..1000..50});
starsAll=("${stars1[@]}" "${stars2[@]}" "${stars3[@]}")

for numberStars in ${starsAll[@]}
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
