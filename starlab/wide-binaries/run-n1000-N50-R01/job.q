#!/bin/bash 
#PBS -V 
#PBS -N cesar 
#PBS -t 1-50%50
#PBS -k o  
#PBS -l nodes=1:ppn=1 
#PBS -l walltime=10:00:00 
################################# 
 
### Switch to the working directory; 
cd $PBS_O_WORKDIR

./run.sh

echo "done"
