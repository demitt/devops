LOGS_COUNT_TOTAL=60
LOGS_COUNT_WITH_POSITIVE_VALUE=2

LOGS_DIR=/tmp/jenkinsLogs


if [ ! -d "$LOGS_DIR" ]; then
    mkdir "$LOGS_DIR"
fi

cd "$LOGS_DIR"

rm -f *.log

for i in $(seq 1 $LOGS_COUNT_TOTAL); do
    if [ $i -le $(($LOGS_COUNT_TOTAL - $LOGS_COUNT_WITH_POSITIVE_VALUE)) ]; then
        out=false
    else
        out=true
    fi
    echo $out > "$baseName$i.log"
done
