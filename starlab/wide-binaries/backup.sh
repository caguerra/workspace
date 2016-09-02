#PREVIOUS TESTS
#==============

#TEST1
#=====
#!/bin/bash
makeplummer -n 100 -i |makemass -f 8 -l 0.1 -u 50 | scale -s | add_tidal -F 1 -J 10 | kira -u -D 1 -b 1 -t 1000 -O restart.dat > dyn.dat 2> log.dat

#TEST2
#=====
#!/bin/bash
makeplummer -n 100 -i |makemass -f 8 -l 0.1 -u 50 | scale -s | add_tidal -F 1 -J 10 | kira -u -D 1 -G 20 -b 1 -t 1000 -O restart.dat > dyn.dat 2> log.dat

#TEST3
#=====
#!/bin/bash
echo "START: [`date`]"
for randomseed in {1..50..1}
do
    echo $randomseed
    echo "TIME: [`date`]"
    (makeplummer -n 100 -i -s $randomseed | makemass -f 8 -l 0.1 -u 50 | scale -s | add_tidal -F 1 -J 10 |(kira -u -D 1 -b 1 -t 1000 > "dyn-$randomseed.dat" 2> "log-$randomseed.dat")) 2> stderr.dat 
done 
echo "END: [`date`]"
echo $SECONDS
echo all done


#!/bin/bash
echo "[`date`] Start"
for count in {1..50..1}
do
 	echo $count
	sys_stats -n < "dyn-$count.dat" 2> "sys_stats_log-$count.dat"
done
echo "[`date`] End"
echo $SECONDS
echo all done

#TEST4
#=====
#!/bin/bash
makeplummer -n 30 -i -s 1 |makemass -f 8 -l 0.1 -u 50 | scale -s | add_tidal -F 1 -J 10 | kira -u -D 1 -b 1 -t 500 -O restart.dat > dyn.dat 2> log.dat

makeplummer -n 30 -i -s 1 |makemass -f 8 -l 0.1 -u 50 | scale -s | add_tidal -F 1 -J 10 | kira -u -D 1 -G 2 -b 1 -t 500 -O restart2.dat > dyn2.dat 2> log2.dat

#TEST5
#=====
#!/bin/bash
jobwait() { while [ `jobs | wc -l` -gt $1 ]; do sleep .1; done }
echo "START: [`date`]"
cd "./results"
for randomseed in {1..50..1} 
do
    echo $randomseed
    echo "TIME: [`date`]"
	makeking -n 200 -w 3 -i -u -s $randomseed | makemass -f 1 -l 0.5 -u 50 -s $randomseed | scale -R 0.1 -M 1 | add_power_law -G | set_com -r 8000. 0. 0. -v 0 1.0 0  | (kira -u -D 1 -b 1 -t 1000 > "dyn-$randomseed.dat" 2> "log-$randomseed.dat") &
	jobwait 8
done 
wait
cd ..
echo "END: [`date`]"
echo $SECONDS
echo all done


#!/bin/bash
jobwait() { while [ `jobs | wc -l` -gt $1 ]; do sleep .1; done }
echo "[`date`] Start"
cd "./results"
for count in {1..50..1}
do
 	echo $count
	sys_stats -n < "dyn-$count.dat" 2> "sys_stats_log-$count.dat" &
	jobwait 8
done
wait
cd ..
echo "[`date`] End" 
echo $SECONDS
echo all done