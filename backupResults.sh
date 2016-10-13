#!/bin/bash
find -name "results" -print | while read dir; do
	echo "$dir"
    rsync -avuzP "$dir"/ cesarg@tars:/home/usr2/cesarg/git/workspace/"$dir"/
done

# c: cp by checksum
# u: cp by file timing
# -avzP copy anyway