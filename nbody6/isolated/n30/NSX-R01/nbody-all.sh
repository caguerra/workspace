#!/bin/bash

# Run in parallel
# ===============

jobwait() { while [ `jobs | wc -l` -gt $1 ]; do sleep .1; done }

KERNELS=32

echo "[`date`] Start"
cd results/

for filenumber in {651..1300..1}
do
	echo ""
	echo "running file $filenumber"
	cd "./run-$filenumber"
	time  (timeout 10m nbody6 <ini.dat> output) 2>> timings &
	jobwait $KERNELS
	cd ..
done
wait

cd ..

echo "[`date`] End"
echo "elapsed time: $SECONDS"
echo all done

# Run in series
# =============

# echo "[`date`] Start"

# cd results/

# for filenumber in {221..250..1}
# do
# 	echo ""
# 	echo "running file $filenumber"
# 	cd "./run-$filenumber"
# 	echo "BEGIN: [`date`]"
#         timeout 120s nbody6 <ini.dat> output
#         if [ $? -eq 124 ]; then
#                 echo "WARNING: timeout reached"
#         fi
# 	echo "END: [`date`]"
#         tail -n1 output
# 	cd ..
# done
#
# cd ..
#
# echo "[`date`] End"
# echo "elapsed time: $SECONDS"
# echo all done
