#!/bin/bash

makeplummer -n 10000 -i -s 42 | scale -m 1 -r 10 -q 0.5 | kira -u -D 1 -b 1 -G 5000 -t 100 -O restart1.dat > dyn1.dat 2> log1.dat

for i in {1..9}
do
	i2=$((i+1))
	kira -u -D 1 -b 1 -G 5000 -t 100 -O restart$i2.dat < restart$i.dat > dyn$i2.dat 2> log$i2.dat
done

