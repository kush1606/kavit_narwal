freeStyleJob('AWS_stopped_state_filter_2') {
   parameters {
stringParam('time', '', 'give launch time of instance')
}
    steps {
  shell {
command('''\
#!/bin/bash
aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped" "Name=launch-time,Values=$time" --query 'Reservations[].Instances[][InstanceId,LaunchTime]'
'''.stripIndent()) 
}
  }
}
