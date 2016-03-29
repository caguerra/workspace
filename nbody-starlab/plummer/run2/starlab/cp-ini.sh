#!/bin/bash

for filenumber in {100..5000..100}
do
	mkdir "run-$filenumber"
	cp "../INI/ini-$filenumber.dat" "./run-$filenumber/ini.dat"
done

echo all done

