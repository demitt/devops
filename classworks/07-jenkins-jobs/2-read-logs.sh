#!/bin/bash -x

LOGS_DIR=/tmp/jenkinsLogs
POSITIVE_VALUES_COUNT=2

# TODO: get latest logs
# TODO: process issue with digits in the end of base path

logsList=$(ls $LOGS_DIR)

firstLogName=$(echo "$logsList" | head -1)
baseNamePart=$(echo $firstLogName | grep -oP "^.+?(?=\d{1,}\.log$)")

status=0
logNumber=0

while [ $status -lt $POSITIVE_VALUES_COUNT ]; do
    logNumber=$(($logNumber+1))
    log="$LOGS_DIR/$baseNamePart${logNumber}.log"
    
    # Check if file exists:
    if [ ! -f "$log" ]; then
        echo "There is no stable logs"
        exit 0
    fi
    
    if [ $(cat "$log") == "true" ]; then
        status=$(($status+1))
    else
        status=0
    fi
done

echo 'Everything is OK'
