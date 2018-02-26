Fetch and display to STDOUT Ansible facts using the setup module. :-

ansible -i /etc/ansible/hosts -m setup all

Fetch and display only the &quot;virtual&quot; subset of facts for each host. :-

ansible  -m setup all | grep &quot;virtual&quot;

Fetch and display the value of fully qualified domain name (FQDN) of each host from their Ansible facts. :-

ansible  -m setup all | grep &quot;ansible\_fqdn&quot;

Display the uptime of all hosts using the command module. :-

ansible all -a w

Ping all hosts except the &#39;control&#39; host using the --limit option :-

ansible-playbook  install\_nginx.yml --limit &quot;192.168.33.10&quot;

ansible-playbook  install\_nginx.yml --limit &quot;group&quot;

ansible-playbook  install\_nginx.yml --limit &quot;all:!192.168.33.10&quot;

Setup Java8 on the hosts in the &quot;App&quot; group using the apt module. :-

- hosts: all

  sudo: yes

  tasks:

  - name: install java on Ubuntu

    apt:

      name: oracle-java8-installer

      state: present

    when: ansible\_os\_family == &quot;Debian&quot;

Setup and enable the EPEL package repository on the hosts in the &quot;web&quot; group using the yum module. :-



- hosts: all

  sudo: yes

  tasks:

  - name: install epel-release on centos

      yum:

      name: epel-release

      state: present

      when: ansible\_os\_family == &quot;RedHat&quot;



CentOS systems use the latest epel-release package :-

- hosts: all

  sudo: yes

  tasks:

  - name: create a directory and move .repo files.

    file:

      path: /opt/repo

      state: directory

      owner: root

      group: root

      mode: 0775

      recurse: yes

  - name: move all repo from /etc/yum.repos.d/

    command: mv /etc/yum.repos.d/\*.repo

  - name: install epel-release on centos

      yum:

      name: epel-release

      state: present

      when: ansible\_os\_family == &quot;RedHat&quot;

RHEL systems should use https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm :-

- hosts: all

  sudo: yes

  tasks:

  - name: download epel-repo

    get\_url:

      url: https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

      dest: /opt/

      mode: 0755

  - name: install epel-repo

    command: cd /opt/

    commman: yum install epel-release-latest-7.noarch.rpm

Create inventory groups app and web :-

vim /etc/ansible/hosts

 [App]

alpha.example.org

beta.example.org

192.168.1.100

192.168.1.110

[web]

10.0.128.50

10.0.128.51

10.0.128.75

192.168.0.43

192.168.33.10

10.0.128.48
