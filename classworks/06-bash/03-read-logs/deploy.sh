#!/bin/bash


LOGS_DIR=nomod


logsList=$(ls $LOGS_DIR)

firstLogName=$(echo "$logsList" | head -1)
baseNamePart=$(echo $firstLogName | grep -oP "^.+(?=\d{1,}\.log$)")

# Getting base part: something about teacher's solution:
# ... | awk -F'.' '{print $1}' | tr -d '[:digit:]'


status=0
logNumber=0
while [ $status -ne 2 ]; do
    logNumber=$(($logNumber+1))
    echo "log number = $logNumber"
    log="$LOGS_DIR/$baseNamePart${logNumber}.log"
    # TODO: check if file exists
    if [ $(cat $log) == "true" ]; then
        status=$(($status+1))
        # echo "status=$status"
    else
        status=0
    fi
done

echo 'Everything is OK'
