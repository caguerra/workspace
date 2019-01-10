#!/bin/bash
echo "delete results folders in current machine"

find -name "results" -print | while read dir; do
        echo "$dir"
done

read -p "press enter to continue ..."

find -name "results" -print | while read dir; do
	rm -rf "$dir"/
done


# c: cp by checksum
# u: cp by file timing
# -avzP copy anyway
