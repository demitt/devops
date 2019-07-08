#!/bin/bash -x

LOGS_COUNT_TOTAL=60
LOGS_DIR=/tmp/jenkinsLogs


if [ ! -d "$LOGS_DIR" ]; then
    mkdir "$LOGS_DIR"
fi

cd "$LOGS_DIR"

rm -f *.log

for i in $(seq 1 $LOGS_COUNT_TOTAL); do echo $i; done | \
    xargs -P 5 -I % bash -c "echo 'false' > $BASE_NAME%.log"

echo 'true' > "$BASE_NAME$(($LOGS_COUNT_TOTAL - 1)).log"
echo 'true' > "$BASE_NAME$LOGS_COUNT_TOTAL.log"
