#!/bin/bash

NUM_PTRN="^[-]?[0-9]+$"

linear_eq() {
    typeset x
    a=$1
    b=$2
    c=$3

    let x=$(( (c - b)/a ))
    echo $x
    
    return
}


if [ $# -ne 3 ]; then
    echo "Script usage: ${0} <integer_A> <integer_B> <integer_C>"
    exit -1
fi

if [ ${1} -eq 0 ]; then
    echo "Parameter A couldn't be 0!"
    exit -1
fi

for n in ${@}; do
    if ! [[ $n =~ $NUM_PTRN ]]; then
        echo "Error! One of the parameter is not integer!"
        exit -1
    fi
done

X=`linear_eq ${1} ${2} ${3}`
echo "Result of simple linear equation ax+b=c is ${X}"