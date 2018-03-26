freeStyleJob(&#39;AWS\_stopped\_state\_filter\_2&#39;) {

   parameters {

stringParam(&#39;time&#39;, &#39;&#39;, &#39;give launch time of instance&#39;)

}

    steps {

  shell {

command(&#39;&#39;&#39;\

#!/bin/bash

aws ec2 describe-instances --filters &quot;Name=instance-state-name,Values=stopped&quot; &quot;Name=launch-time,Values=$time&quot; --query &#39;Reservations[].Instances[][InstanceId,LaunchTime]&#39;

&#39;&#39;&#39;.stripIndent())

}

  }

}
