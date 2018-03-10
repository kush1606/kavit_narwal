List All the open ports on the node machines and store the output in seprate files named with

the hostname of the machine on the ansible master. :-



 ansible 192.168.33.10 -m setup | grep hostname | awk &#39;{ print $2 }&#39; &gt; /tmp/running\_port.txt; ansible 192.168.33.10 -m shell -a &quot;netstat -tulnp&quot; &gt;&gt; /tmp/running\_port.txt



disable all ports other than 22 on the node machines. :-

- hosts: 192.168.33.10

  sudo: yes

  tasks:

  - name: install ufw on centos

    yum: name=ufw state=present

    when: ansible\_os\_family == &quot;RedHat&quot;

  - ufw:

      rule: allow

      port: 22



disable all ports other than 22 on the node machines.

Enable only port 8080 and 8081 on the node machines. :-

- hosts: 192.168.33.10

  sudo: yes

  tasks:

  - name: install ufw on centos

    yum: name=ufw state=present

    when: ansible\_os\_family == &quot;RedHat&quot;

  - ufw:

      rule: allow

      port: 22

  - ufw:

      rule: allow

      port: 8080

  - ufw:

      rule: allow

      port: 8081
