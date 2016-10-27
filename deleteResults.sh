#!/bin/bash
find -name "results" -print | while read dir; do
	echo "$dir"
    rm -rf "$dir"/
done

# c: cp by checksum
# u: cp by file timing
# -avzP copy anyway
