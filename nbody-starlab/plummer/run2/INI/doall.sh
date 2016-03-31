#!/bin/bash
echo "creating starlab ini files ..."
./ini.sh > ini.log 2>&1
echo "converting starlab init to nbody ..."
./ini2.sh > ini2.log 2>&1
echo "fixing nbody ini files ..."
./ini3.m > ini3.log
echo "moving files to run dir ..."
./mv-ini.sh
echo "all done!"

