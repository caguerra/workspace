#!/bin/bash 
#PBS -V 
#PBS -N cesar 
#PBS -t 1-50%20
#PBS -k eo  
#PBS -l nodes=1:ppn=20 
#PBS -l walltime=02:00:00 
################################# 
 
### Switch to the working directory; 
cd $PBS_O_WORKDIR

./run.sh

echo "done"
