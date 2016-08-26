for i in {1..5}
do
	echo $PBS_O_HOST
	echo $PBS_SERVER
	echo $PBS_O_WORKDIR
	echo $PBS_JOBID >> jobid.dat
	echo $HOSTNAME > "hostname$i.dat"
	echo $(uname -a) > "uname$i.dat"
done
