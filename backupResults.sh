#!/bin/bash
echo "backup results folders to tars server"

find -name "results" -print | while read dir; do
	echo "$dir"
done

read -p "press enter to continue ..."

find -name "results" -print | while read dir; do
    rsync -avuzP "$dir"/ cesarg@tars:/home/usr2/cesarg/git/workspace/"$dir"/
done


# c: cp by checksum
# u: cp by file timing
# -avzP copy anyway
