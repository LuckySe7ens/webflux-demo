#!/bin/sh
DEPLOY_DIR=`dirname $0`/..
DEPLOY_DIR=`(cd "$DEPLOY_DIR"; pwd)`

PIDPROC=`ps -ef | grep java | grep $DEPLOY_DIR |awk '{print $2}'`

if [ -z "$PIDPROC" ];then
 echo "$DEPLOY_DIR  is not running"
 exit 0
fi

echo "PIDPROC: "$PIDPROC
for PID in $PIDPROC
do
if kill  $PID
   then echo "process $DEPLOY_DIR (Pid:$PID) was force stopped at " `date`
fi
done
sleep 5
echo stop finished.
