#!/bin/bash
dir=./nbody6/isolated/n250/NS100-R01/results
rsync -avuzP "$dir"/ cesarg@tars:/home/usr2/cesarg/git/workspace/"$dir"/

# c: cp by checksum
# u: cp by file timing
# -avzP copy anyway
