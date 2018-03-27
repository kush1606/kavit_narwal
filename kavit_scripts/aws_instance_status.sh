#!/bin/bash

#echo "Please enter date in YY-MM-DD formate only"

#read DATE

DATE=$1

#echo "Please enter no. of days"

#read DAYS_NUM

DAYS_NUM=$2

for i in $(seq 0 $DAYS_NUM)
do
#   NEXT_DATE=$(date +%Y-%m-%d -d "$DATE + $i day")
    NEXT_DATE=$(date +%Y-%m-%d -d "$DATE + $i day")
#   echo "$NEXT_DATE"
aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped" "Name=launch-time,Values=$NEXT_DATE*" --query 'Reservations[].Instances[][InstanceId,LaunchTime]' | grep i | tr -d '",' >> output_stopped_instances.txt
done
