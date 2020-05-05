#!/bin/bash

NUM_PTRN="^[-]?[0-9]+$"

if [ $# -eq 0 ]; then
    echo "Script usage: ${0} [integer_1]...[integer_N]"
    exit -1
fi

for n in ${@}; do
    if ! [[ $n =~ $NUM_PTRN ]]; then
        echo "Error! One of the parameter is not integer!"
        exit -1
    fi
done

declare -a RES
for n in ${@}; do
    RES+=$(( n*n ))
    RES+=" "
done

echo "Result is: ${RES[@]}"