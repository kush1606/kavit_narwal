Create Ansible Roles for Mysql , Postgres sql. :-

Roles should run on at least two different OS - For Ex - Ubuntu and Centos. :-



Roles for Mysql :-

root@197NODNB:/etc/ansible/roles# cd mysql/

root@197NODNB:/etc/ansible/roles/mysql# ll

total 44

drwxr-xr-x 10 root root 4096 Mar 13 15:48 ./

drwxr-xr-x  7 root root 4096 Mar 13 15:48 ../

drwxr-xr-x  2 root root 4096 Mar 13 15:48 defaults/

drwxr-xr-x  2 root root 4096 Mar 13 15:48 files/

drwxr-xr-x  2 root root 4096 Mar 13 15:48 handlers/

drwxr-xr-x  2 root root 4096 Mar 13 15:48 meta/

-rw-r--r--  1 root root 1328 Mar 13 15:48 README.md

drwxr-xr-x  2 root root 4096 Mar 13 16:03 tasks/

drwxr-xr-x  2 root root 4096 Mar 13 15:48 templates/

drwxr-xr-x  2 root root 4096 Mar 13 15:48 tests/

drwxr-xr-x  2 root root 4096 Mar 13 15:48 vars/

root@197NODNB:/etc/ansible/roles/mysql#

root@197NODNB:/etc/ansible/roles/mysql# cd tasks/

root@197NODNB:/etc/ansible/roles/mysql/tasks# ll

total 20

drwxr-xr-x  2 root root 4096 Mar 13 16:03 ./

drwxr-xr-x 10 root root 4096 Mar 13 15:48 ../

-rw-r--r--  1 root root   90 Mar 13 15:51 debian.yml

-rw-r--r--  1 root root  201 Mar 13 15:49 main.yml

-rw-r--r--  1 root root   92 Mar 13 16:03 redhat.yml

root@197NODNB:/etc/ansible/roles/mysql/tasks#

root@197NODNB:/etc/ansible/roles/mysql/tasks#

root@197NODNB:/etc/ansible/roles/mysql/tasks#

root@197NODNB:/etc/ansible/roles/mysql/tasks# cat main.yml

---

# tasks file for mysql

- name: install mysql on centos or ubuntu

  import\_tasks: redhat.yml

  when: ansible\_os\_family == &#39;RedHat&#39;

- import\_tasks: debian.yml

  when: ansible\_os\_family == &#39;Debian&#39;

root@197NODNB:/etc/ansible/roles/mysql/tasks# cat debian.yml

- apt:

    name: &quot;mysql-server&quot;

    state: present

- shell:

    mysql\_secure\_installation

root@197NODNB:/etc/ansible/roles/mysql/tasks# cat redhat.yml

- yum:

    name: &quot;mysql-server&quot;

    state: present

- shell:

    mysql\_secure\_installation

root@197NODNB:/etc/ansible/roles/mysql/tasks#

root@197NODNB:/etc/ansible/roles/mysql/tasks# cat /etc/ansible/mysql\_and\_postgresql\_role.yml

---

- hosts: all

  roles:

     - mysql

root@197NODNB:/etc/ansible/roles/mysql/tasks#

Roles for Postgresql :-

root@197NODNB:/etc/ansible/roles/postgresql# ll

total 44

drwxr-xr-x 10 root root 4096 Mar 13 17:24 ./

drwxr-xr-x  8 root root 4096 Mar 13 17:24 ../

drwxr-xr-x  2 root root 4096 Mar 13 17:24 defaults/

drwxr-xr-x  2 root root 4096 Mar 13 17:24 files/

drwxr-xr-x  2 root root 4096 Mar 13 17:24 handlers/

drwxr-xr-x  2 root root 4096 Mar 13 17:24 meta/

-rw-r--r--  1 root root 1328 Mar 13 17:24 README.md

drwxr-xr-x  2 root root 4096 Mar 13 17:24 tasks/

drwxr-xr-x  2 root root 4096 Mar 13 17:24 templates/

drwxr-xr-x  2 root root 4096 Mar 13 17:24 tests/

drwxr-xr-x  2 root root 4096 Mar 13 17:24 vars/

root@197NODNB:/etc/ansible/roles/postgresql#

root@197NODNB:/etc/ansible/roles/postgresql/tasks# cat main.yml

---

# tasks file for postgresql

- name: install postgresql on centos or ubuntu

  import\_tasks: redhat.yml

  when: ansible\_os\_family == &#39;RedHat&#39;

- import\_tasks: debian.yml

  when: ansible\_os\_family == &#39;Debian&#39;

root@197NODNB:/etc/ansible/roles/postgresql/tasks#

root@197NODNB:/etc/ansible/roles/postgresql/tasks# cat debian.yml

- apt: name={{item.name}} state=present

  with\_items:

  - { name: postgresql }

  - { name: postgresql-contrib }

root@197NODNB:/etc/ansible/roles/postgresql/tasks# cat redhat.yml

- yum: name={{ item.name }} state=present

  with\_items:

  - { name: postgresql-server }

  - { name: postgresql-contrib }

- shell:

    postgresql-setup initdb

root@197NODNB:/etc/ansible/roles/postgresql/tasks#

root@197NODNB:/etc/ansible/roles/postgresql/tasks# cat /etc/ansible/postgresql\_roles.yml

---

- hosts: all

  roles:

     - postgresql

root@197NODNB:/etc/ansible/roles/postgresql/tasks#

It should include Templates for the configuration files with all the dynamic value that needs to be updated. :-

root@197NODNB:/etc/ansible/roles/mysql#

root@197NODNB:/etc/ansible/roles/mysql# cat templates/my.j2

[client]

port = 3306

socket = /tmp/mysql.sock



[mysqld]

port = {{ mysql\_port }}

socket = /tmp/mysql\_&lt;port&gt;.sock

tmpdir = data\_dir/tmp

tmp\_table\_size = 16M

default\_storage\_engine=MyISAM

performance\_schema

skip-name-resolve

##MyISAM Parameters##

key\_buffer\_size = 2G

sort\_buffer\_size = 4M

net\_buffer\_length = 4M

read\_buffer\_size = 16M

myisam\_sort\_buffer\_size = 8M

join\_buffer\_size=8M

##########################

max\_allowed\_packet = 32M

thread\_cache\_size = 128

open\_files\_limit = 4096

wait\_timeout = 28800

connect\_timeout=10

max\_connections = 500

group\_concat\_max\_len=1024

thread\_concurrency = 8

table\_open\_cache = 64



###Query Cache###

query\_cache\_type=1

query\_cache\_size=256M



##Slow Query Logs##

long\_query\_time = 1

log-slow-queries

slow\_query\_log=&lt;hostname&gt;&lt;appname&gt;.slow



##Replication Param###

server-id= 1

skip-slave-start

#log-bin=&lt;servername&gt;\_&lt;appname&gt;.01

log-slave-updates

binlog\_format=MIXED

report-host = node&lt;hostname&gt;&lt;last2 port number digit&gt;

###Circular Replication ###

#replicate-same-server-id = 0

#auto\_increment\_increment = 2

#auto\_increment\_offset = 1



###Innodb###

innodb\_data\_home\_dir = data\_&lt;appname&gt;&lt;port&gt;

innodb\_data\_file\_path = ibdata1:100M:autoextend

innodb\_buffer\_pool\_instances = 20

innodb\_buffer\_pool\_size = 40G

innodb\_additional\_mem\_pool\_size = 8M

# Set ..\_log\_file\_size to 25 % of buffer pool size

innodb\_log\_file\_size = 1G

innodb\_additional\_mem\_pool\_size = 128M

innodb\_log\_buffer\_size = 8M

innodb\_flush\_log\_at\_trx\_commit = 2

innodb\_lock\_wait\_timeout = 100

innodb\_file\_per\_table

innodb\_flush\_method=O\_DIRECT

[mysqldump]

quick

max\_allowed\_packet = 16M

[myisamchk]

key\_buffer = 20M

sort\_buffer\_size = 20M

read\_buffer = 8M

write\_buffer = 2M



root@197NODNB:/etc/ansible/roles/mysql#

root@197NODNB:/etc/ansible/roles/mysql# cat vars/main.yml

---

# vars file for mysql

mysql\_port: 3306

root@197NODNB:/etc/ansible/roles/mysql#

root@197NODNB:/etc/ansible/roles/mysql# cat tasks/main.yml

---

# tasks file for mysql

- name: install mysql on centos or ubuntu

  import\_tasks: redhat.yml

  when: ansible\_os\_family == &#39;RedHat&#39;

- import\_tasks: debian.yml

  when: ansible\_os\_family == &#39;Debian&#39;

root@197NODNB:/etc/ansible/roles/mysql# cat tasks/redhat.yml

- yum:

    name: &quot;mysql-server&quot;

    state: present

  ignore\_errors: yes

- shell:

    mysql\_secure\_installation

  ignore\_errors: yes

- template:

    src: my.j2

    dest: /etc/mysql/my.cnf

    owner: root

    group: root

    mode: 0644



root@197NODNB:/etc/ansible/roles/mysql# cat tasks/debian.yml

- apt:

    name: &quot;mysql-server&quot;

    state: present

  ignore\_errors: yes

- shell:

    mysql\_secure\_installation

  ignore\_errors: yes

- template:

    src: my.j2

    dest: /etc/mysql/my.cnf

    owner: root

    group: root

    mode: 0644

root@197NODNB:/etc/ansible/roles/mysql#





It should include handlers , but not along with the task. :-

root@197NODNB:/etc/ansible/roles/mysql# cat handlers/main.yml

---

# handlers file for mysql

- name: restart mysql

  service:

    name: mysqld

    state: restarted

root@197NODNB:/etc/ansible/roles/mysql#

root@197NODNB:/etc/ansible/roles/mysql# cat tasks/redhat.yml

- yum:

    name: &quot;mysql-server&quot;

    state: present

  ignore\_errors: yes

- shell:

    mysql\_secure\_installation

  ignore\_errors: yes

- template:

    src: my.j2

    dest: /etc/mysql/my.cnf

    owner: root

    group: root

    mode: 0644

  notify: restart mysql

root@197NODNB:/etc/ansible/roles/mysql# cat tasks/debian.yml

- apt:

    name: &quot;mysql-server&quot;

    state: present

  ignore\_errors: yes

- shell:

    mysql\_secure\_installation

  ignore\_errors: yes

- template:

    src: my.j2

    dest: /etc/mysql/my.cnf

    owner: root

    group: root

    mode: 0644

  notify: restart mysql

root@197NODNB:/etc/ansible/roles/mysql#



Roles for postgresql :-

root@197NODNB:/etc/ansible/roles/postgresql# cat tasks/redhat.yml

- yum: name={{ item.name }} state=present

  with\_items:

  - { name: postgresql-server }

  - { name: postgresql-contrib }

- shell:

    postgresql-setup initdb

- template:

    src: postgresql.j2

    dest: /var/lib/pgsql/data/postgresql.conf

    owner: root

    group: root

    mode: 0644

  notify: restart mysql

root@197NODNB:/etc/ansible/roles/postgresql# cat tasks/debian.yml

- apt: name={{item.name}} state=present

  with\_items:

  - { name: postgresql }

  - { name: postgresql-contrib }

- template:

    src: postgresql.j2

    dest: /var/lib/pgsql/data/postgresql.conf

    owner: root

    group: root

    mode: 0644

  notify: restart mysql

root@197NODNB:/etc/ansible/roles/postgresql# cat vars/main.yml

---

# vars file for mysql

max\_connections: 100

root@197NODNB:/etc/ansible/roles/postgresql# cat handlers/main.yml

---

# handlers file for mysql

- name: restart postgresql

  service:

    name: postgresql

    state: restarted

root@197NODNB:/etc/ansible/roles/postgresql#



Roles execution should be only through jenkins . :-

Create a new item.

select invoke ansible playbook.

Give exact playbook path.

Run the job.



Jenkins will pull the updated role every time from Git only. :-

Create a new project with name like clone\_roles\_from\_git.

Select git in Source Code Management.

Give path of repository you want to clone.

Click on additional behaviours.

Click on Add in additional behaviours and select Sparse checkout paths.

Give path of folder. Like we give roles/mysql, roles/postgresql, roles/mysql\_roles.yml, roles/postgresql\_roles.yml in path.

In Build select Invoke ansible playbook.

Give path of ansible play book Like roles/mysql\_roles.yml



User can select which role he/she want to execute from jenkins - tomcat/nginx/java/mysql/postgres sql . :-

Create a new project with name like roles\_with\_perameter

Select this job is parameterised.

Select choice parameter.

Give Name of parameter like test

Give choices like

nginx

tomcat

java

mysql

postgresql

Give discription like roles with parameter.

Select git in Source Code Management.

Give path of repository you want to clone.

Click on additional behaviours.

Click on Add in additional behaviours and select Sparse checkout paths.

Give path of folder. Like we give roles in path.

In Build select Invoke ansible playbook.

Give path of ansible play book Like roles/${test}\_roles.yml

Now, When we run this job with parameter ${test} will replace with parameter value you give.

User should have the options to execute the role on centos or ubuntu or together on both. :-



Create a new project with name like roles\_with\_perameter

Select this job is parameterised.

Select choice parameter.

Give Name of parameter like test

Give choices like

centos

ubuntu

all

Give discription like roles with parameter.

Select git in Source Code Management.

Give path of repository you want to clone.

Click on additional behaviours.

Click on Add in additional behaviours and select Sparse checkout paths.

Give path of folder. Like we give roles\_all in path.

In Build select Invoke ansible playbook.

Give path of ansible play book Like roles\_all/${test}\_nginx\_roles.yml

Now, When we run this job with parameter ${test} will replace with parameter value you give.
