Create an Ansible playbook that targets members of the &quot;app&quot; group has the following state:

The tomcat7 is installed in all host

Has the war file in webapps folder specified in appwar.

Tomcat is started on each host.

While developing the playbook use the --syntax-check to check your work and debug problems. Run your playbook in verbose mode using the -v switch to get more information on what Ansible is doing. Try -vv and -vvv for added verbosity. Also consider running --check to do a dry-run as you are developing.



Playbook for tomcat installation.



- hosts: app

  sudo: yes

  tasks:

  - name: install tomcat on centos

    yum:

      name: tomcat

      state: present

    when: ansible\_os\_family == &quot;RedHat&quot;

  - name: install tomcat on Ubuntu

    apt:

      name: tomcat

      state: present

    when: ansible\_os\_family == &quot;Debian&quot;

  - name: start tomcat

    service:

      name: tomcat

      state: started

root@197NODNB:/etc/ansible# ansible-playbook install\_tomcat.yml --syntax-check

[DEPRECATION WARNING]: Instead of sudo/sudo\_user, use become/become\_user and make sure become\_method is &#39;sudo&#39; (default). This feature will be

 removed in version 2.6. Deprecation warnings can be disabled by setting deprecation\_warnings=False in ansible.cfg.

playbook: install\_tomcat.yml

root@197NODNB:/etc/ansible#

root@197NODNB:/etc/ansible# ansible-playbook install\_tomcat.yml --check

[DEPRECATION WARNING]: Instead of sudo/sudo\_user, use become/become\_user and make sure become\_method is &#39;sudo&#39; (default). This feature will be

 removed in version 2.6. Deprecation warnings can be disabled by setting deprecation\_warnings=False in ansible.cfg.

PLAY [app] \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

TASK [Gathering Facts] \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

ok: [192.168.33.10]

TASK [install tomcat on centos] \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

ok: [192.168.33.10]

TASK [install tomcat on Ubuntu] \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

skipping: [192.168.33.10]

TASK [start tomcat] \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

ok: [192.168.33.10]

PLAY RECAP \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

192.168.33.10              : ok=3    changed=0    unreachable=0    failed=0

root@197NODNB:/etc/ansible#



copy file module :-



root@197NODNB:/etc/ansible# ansible -m copy -a &quot;src=/etc/ansible/sample.war dest=/var/lib/tomcat/webapps/&quot; all
