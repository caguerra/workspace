(tail -n1 ./run*/output | grep "END RUN" -B 2 | grep "==>") > goodRuns.log
