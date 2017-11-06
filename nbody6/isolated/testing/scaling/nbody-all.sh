#!/bin/bash

cd ./results/run-R01/
time  (timeout 120s nbody6 <input> output) 2>> timings &
cd ..

cd ./run-R1
time  (timeout 120s nbody6 <input> output) 2>> timings &
cd ../..

echo "DONE"
