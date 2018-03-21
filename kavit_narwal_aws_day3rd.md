First of create a ec2 instance.

Mention public ip of ec2 instance in hosts file of ansible.

Now open below mention file in ec2 instance.

vim /etc/ssh/sshd\_config

uncomment PermitRootLogin yes

Now create a role for nginx installation.

Run nginx role from ansible control machine.

It will install nginx on ec2 instance.



Execute this role in user data script while launching another instance :-

Run below mention commands on user data script.

yum install nginx

echo &quot;Hi i am ninja and my name is kavit&quot; &gt; /usr/share/nginx/html/index.html

write a jobDsl to start stop this instance through jenkins :-

Run below mention command for start and stop ec2 instance.

First of all create a user on aws.

Give ec2 full access to user.

Run aws configure command on server.

aws ec2 stop-instances --instance-ids i-0db40c3e20e6c2293

aws ec2 start-instances --instance-ids i-0db40c3e20e6c2293



DSL job for same is following.

For stop instance.

freeStyleJob(&#39;AWS\_instance\_stop&#39;) {

    steps {

  shell {

command(&#39;&#39;&#39;\

#!/bin/bash

aws ec2 stop-instances --instance-ids i-0f380075e1f06fc41

&#39;&#39;&#39;.stripIndent())

}

  }

}

For start instance.

freeStyleJob(&#39;AWS\_instance\_start&#39;) {

    steps {

  shell {

command(&#39;&#39;&#39;\

#!/bin/bash

aws ec2 start-instances --instance-ids i-0f380075e1f06fc41

&#39;&#39;&#39;.stripIndent())

}

  }

}
