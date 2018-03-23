create a key pair using ansible :-

First of all install boto by using below mention command.

pip2.7 install boto

pip2.7 install boto3

root@197NODNB:/etc/ansible# cat aws\_new\_key\_pair.yml

- hosts: 127.0.0.1

  sudo: yes

  tasks:

  - name: example ec2 key

    ec2\_key:

      name: example

      state: present

      region: us-east-1

root@197NODNB:/etc/ansible#

create one security group that would allow you to ssh into the instance :-



root@197NODNB:/etc/ansible# cat aws\_new\_SG.yml

- hosts: 127.0.0.1

  sudo: yes

  tasks:

  - name: Create new SG

    ec2\_group:

       name: example

       description: an example EC2 group

       vpc\_id: vpc-dfb323a7

       region: us-east-1

       state: present


root@197NODNB:/etc/ansible#

root@197NODNB:/etc/ansible# cat aws\_new\_SG\_allow\_ssh.yml

- hosts: 127.0.0.1

  sudo: yes

  tasks:

  - name: Create SSH security group

    ec2\_group:

      name: &quot;example&quot;

      description: an example EC2 group (Use same description which we use in SG creation.)

      group\_id: sg-4a2f723c

      region: us-east-1

      rules:

        - proto: tcp

          ports: 22

          cidr\_ip: 0.0.0.0/0

root@197NODNB:/etc/ansible#



using the key that you created, launch an instance in default vpc of N.virginia region with tags of your choice :-



root@197NODNB:/etc/ansible# cat aws\_new\_instance.yml

- hosts: 127.0.0.1

  sudo: yes

  tasks:

  - name: Create a new instance

    ec2:

      key\_name: linux

      instance\_type: t2.micro

      image: ami-1853ac65

      count: 1

      region: us-east-1

      vpc\_subnet\_id: subnet-d373e298

      assign\_public\_ip: yes

      group\_id: sg-a2bae8d4

      instance\_tags:

       Name: linux5

root@197NODNB:/etc/ansible#
