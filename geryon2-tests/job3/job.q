#!/bin/sh
#PBS -t 1-5 
#PBS -l nodes=1:ppn=1,walltime=5:00
#PBS -N arraytest
 
cd ${PBS_O_WORKDIR}

./array.sh

