#!/bin/bash 
#PBS -V 
#PBS -N job1 
#PBS -k eo  
#PBS -o /home/cguerra/git/workspace/geryon2-tests
#PBS -e /home/cguerra/git/workspace/geryon2-tests 
#PBS -M caguerra@gmail.com  
#PBS -m abe 
#PBS -l nodes=1:ppn=5 
#PBS -l walltime=00:10:00 
################################# 
 
### Switch to the working directory; 

cd $PBS_O_WORKDIR

module purge 
module load mpich2-1.5

echo $PBS_O_HOST
echo $PBS_O_WORKDIR
echo $PBS_JOBID
mpirun -np 5 echo $PBS_O_HOST

echo

