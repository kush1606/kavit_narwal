First of all create a user on AWS.

Provide full access of ec2 instances to user.

Run aws configure command on your sysytem.

Give secrate key and access key.

Run below mention command on your system.

aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped" "Name=launch-time,Values=2018-03-26*" --query 'Reservations[].Instances[][InstanceId,LaunchTime]'

It will show instances which stopped on 26th.

Now integrate same with jenkins.

Create a new freestyle job.

Select This project is parameterised in General section.

Select a string parameter. 

Give name = time

In Build section select Execute shell.

Give below mention command.

aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped" "Name=launch-time,Values=$time" --query 'Reservations[].Instances[][InstanceId,LaunchTime]'

Now save job.

Build this job with parameter.

Give time value like 2018-03-26*

It will show instances which stopped on 26th.


