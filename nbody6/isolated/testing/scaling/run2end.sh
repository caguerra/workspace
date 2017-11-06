#!/bin/bash
tail -n1 ./results/run*/output | grep "END RUN" -B 2 | grep "==>"

