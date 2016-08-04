#!/bin/bash
cd results/
sys_stats -n < dyn.dat 2> sys_stats.dat
cd ..
