#!/bin/bash

if [ -z $1 ]; then
    echo "Script usage: $0 <filename>"
    exit -1
fi

FILE=$1

while :
do
    REPORT="`date`: Number of running processes = `pgrep -c '^.*$'`"
    echo "${REPORT}" >> "${HOME}/${FILE}"
    sleep 1
done
