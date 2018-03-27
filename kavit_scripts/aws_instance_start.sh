#!/bin/bash

echo "Please enter instance tag you want to start."

read instance_tag
 
echo $instance_tag

if [ "$instance_tag" == "boot-order: 1" ]
then

echo "start $instance_tag"
 
aws ec2 start-instances --instance-ids i-045c5af85e063b175

aws ec2 start-instances --instance-ids i-046b0f6ff7625f877

aws ec2 start-instances --instance-ids i-06a80f39bb50f97c2

fi

if [ "$instance_tag" == "boot-order: 2" ]
then

echo "start $instance_tag"

aws ec2 start-instances --instance-ids i-046b0f6ff7625f877

aws ec2 start-instances --instance-ids i-06a80f39bb50f97c2

aws ec2 start-instances --instance-ids i-045c5af85e063b175

fi

if [ "$instance_tag" == "boot-order: 3" ]
then

echo "start $instance_tag"

aws ec2 start-instances --instance-ids i-06a80f39bb50f97c2

aws ec2 start-instances --instance-ids i-046b0f6ff7625f877

aws ec2 start-instances --instance-ids i-045c5af85e063b175

fi















