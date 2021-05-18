#!/bin/bash

# https://www.golinuxcloud.com/get-script-execution-time-command-bash-script/

# clean output file
OUT=out/times.out
echo "OWL API" > $OUT

# list of commands
commands=("o10.owx" "o100.owx" "o1000.owx" "o10000.owx" "o100000.owx" "o1000000.owx" "o2500000.owx" "o5000000.owx" "o10000000.owx" "o20000000.owx")

# for each command
for c in ${commands[@]}
do
    # get time
    start=$(date +%s.%N)

    # run make
    make $c

    # calc time
    duration=$(echo "$(date +%s.%N) - $start" | bc)
    execution_time=`printf "%.2f seconds" $duration`

    # output to file
    echo "Script Execution Time for $c: $execution_time" >> $OUT
done
