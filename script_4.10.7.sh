#!/bin/bash

if [ -z $1 ]; then
    echo "Script usage: $0 <filename>"
    exit -1
fi

FILE=$1

OLD_COUNT=`cat /etc/passwd | wc -l`
`cat /etc/passwd | awk -F ":" '{print "New username is "$1", UID="$3}' > ${FILE}`

while :
do
    NEW_COUNT=`cat /etc/passwd | wc -l`

    if [[ $NEW_COUNT -gt $OLD_COUNT ]]; then
        LINES_ADD=$(( $NEW_COUNT - $OLD_COUNT ))
        LOG=`tail -n ${LINES_ADD} /etc/passwd | awk -F ":" '{print "New username is "$1", UID="$3}' >> ${FILE}`
    fi
    OLD_COUNT=$NEW_COUNT
    sleep 1
done