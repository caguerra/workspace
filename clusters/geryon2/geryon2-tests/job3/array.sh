#!/bin/bash
cat input.${PBS_ARRAYID} > output.${PBS_ARRAYID}
echo "Job Name is ${PBS_JOBNAME}" >> output.${PBS_ARRAYID}

sleep 30

exit 0;
