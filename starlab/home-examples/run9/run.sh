#!/bin/bash
#256-body, W0 = 12 King model, equal masses 
makeking -w 12 -n 256 -i \
	| kira -t 10 -D -5 \
	| snap_to_image -s 400 -g -a -d -f king12_simple 
