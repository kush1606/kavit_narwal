Create Ansible Roles for Nginx, Tomcat, Java. :-

Roles should run on at least two different OS - For Ex - Ubuntu and Centos.:-



Roles for Nginx :-

root@197NODNB:/etc/ansible#

root@197NODNB:/etc/ansible# cd roles/nginx/

root@197NODNB:/etc/ansible/roles/nginx# lll

^C

root@197NODNB:/etc/ansible/roles/nginx#

root@197NODNB:/etc/ansible/roles/nginx#

root@197NODNB:/etc/ansible/roles/nginx# ll

total 44

drwxr-xr-x 10 root root 4096 Mar 11 16:09 ./

drwxr-xr-x  5 root root 4096 Mar 12 12:27 ../

drwxr-xr-x  2 root root 4096 Mar 11 16:09 defaults/

drwxr-xr-x  2 root root 4096 Mar 11 16:09 files/

drwxr-xr-x  2 root root 4096 Mar 11 16:09 handlers/

drwxr-xr-x  2 root root 4096 Mar 11 16:09 meta/

-rw-r--r--  1 root root 1328 Mar 11 16:09 README.md

drwxr-xr-x  2 root root 4096 Mar 12 12:45 tasks/

drwxr-xr-x  2 root root 4096 Mar 11 16:09 templates/

drwxr-xr-x  2 root root 4096 Mar 11 16:09 tests/

drwxr-xr-x  2 root root 4096 Mar 11 16:09 vars/

root@197NODNB:/etc/ansible/roles/nginx#

root@197NODNB:/etc/ansible/roles/nginx#

root@197NODNB:/etc/ansible/roles/nginx# cd tasks/

root@197NODNB:/etc/ansible/roles/nginx/tasks# ll

total 20

drwxr-xr-x  2 root root 4096 Mar 12 12:45 ./

drwxr-xr-x 10 root root 4096 Mar 11 16:09 ../

-rw-r--r--  1 root root   44 Mar 12 12:11 debian.yml

-rw-r--r--  1 root root  201 Mar 12 12:45 main.yml

-rw-r--r--  1 root root   45 Mar 12 12:10 redhat.yml

root@197NODNB:/etc/ansible/roles/nginx/tasks#

root@197NODNB:/etc/ansible/roles/nginx/tasks#

root@197NODNB:/etc/ansible/roles/nginx/tasks# cat main.yml

---

# tasks file for nginx

- name: install nginx on centos or ubuntu

  import\_tasks: redhat.yml

  when: ansible\_os\_family == &#39;RedHat&#39;

- import\_tasks: debian.yml

  when: ansible\_os\_family == &#39;Debian&#39;

root@197NODNB:/etc/ansible/roles/nginx/tasks# cat debian.yml

- apt:

    name: &quot;nginx&quot;

    state: present

root@197NODNB:/etc/ansible/roles/nginx/tasks# cat redhat.yml

- yum:

    name: &quot;nginx&quot;

    state: present

root@197NODNB:/etc/ansible/roles/nginx/tasks#

root@197NODNB:/etc/ansible/roles/nginx/tasks# cat /etc/ansible/nginx\_roles.yml

---

- hosts: all

  roles:

     - nginx

root@197NODNB:/etc/ansible/roles/nginx/tasks#



Roles for java :-



root@197NODNB:/etc/ansible/roles/java# ll

total 44

drwxr-xr-x 10 root root 4096 Mar 12 12:27 ./

drwxr-xr-x  5 root root 4096 Mar 12 12:27 ../

drwxr-xr-x  2 root root 4096 Mar 12 12:27 defaults/

drwxr-xr-x  2 root root 4096 Mar 12 12:27 files/

drwxr-xr-x  2 root root 4096 Mar 12 12:27 handlers/

drwxr-xr-x  2 root root 4096 Mar 12 12:27 meta/

-rw-r--r--  1 root root 1328 Mar 12 12:27 README.md

drwxr-xr-x  2 root root 4096 Mar 12 12:46 tasks/

drwxr-xr-x  2 root root 4096 Mar 12 12:27 templates/

drwxr-xr-x  2 root root 4096 Mar 12 12:27 tests/

drwxr-xr-x  2 root root 4096 Mar 12 12:27 vars/

root@197NODNB:/etc/ansible/roles/java# cat tasks/main.yml

---

# tasks file for nginx

- name: install java on centos or ubuntu

  import\_tasks: redhat.yml

  when: ansible\_os\_family == &#39;RedHat&#39;

- import\_tasks: debian.yml

  when: ansible\_os\_family == &#39;Debian&#39;

root@197NODNB:/etc/ansible/roles/java# cat tasks/debian.yml

- apt: name={{item.name}} state=present

  with\_items:

  - { name: update }

  - { name: default-jre }

  - { name: openjdk-7-jre }

root@197NODNB:/etc/ansible/roles/java# cat tasks/redhat.yml

- yum: name={{item.name}} state=present

  with\_items:

  - { name: java-1.8.0-openjdk }

  - { name: java-1.8.0-openjdk-devel }

root@197NODNB:/etc/ansible/roles/java# cat /etc/ansible/java\_roles.yml

---

- hosts: all

  roles:

     - java

root@197NODNB:/etc/ansible/roles/java#



Roles for tomcat :-



root@197NODNB:/etc/ansible/roles/tomcat# ll

total 44

drwxr-xr-x 10 root root 4096 Mar 12 12:27 ./

drwxr-xr-x  5 root root 4096 Mar 12 12:27 ../

drwxr-xr-x  2 root root 4096 Mar 12 12:27 defaults/

drwxr-xr-x  2 root root 4096 Mar 12 12:27 files/

drwxr-xr-x  2 root root 4096 Mar 12 12:27 handlers/

drwxr-xr-x  2 root root 4096 Mar 12 12:27 meta/

-rw-r--r--  1 root root 1328 Mar 12 12:27 README.md

drwxr-xr-x  2 root root 4096 Mar 12 12:54 tasks/

drwxr-xr-x  2 root root 4096 Mar 12 12:27 templates/

drwxr-xr-x  2 root root 4096 Mar 12 12:27 tests/

drwxr-xr-x  2 root root 4096 Mar 12 12:27 vars/

root@197NODNB:/etc/ansible/roles/tomcat# cat tasks/main.yml

---

# tasks file for nginx

- name: install tomcat on centos or ubuntu

  import\_tasks: redhat.yml

  when: ansible\_os\_family == &#39;RedHat&#39;

- import\_tasks: debian.yml

  when: ansible\_os\_family == &#39;Debian&#39;

root@197NODNB:/etc/ansible/roles/tomcat# cat tasks/debian.yml

- apt:

    name: &quot;tomcat7&quot;

    state: present

root@197NODNB:/etc/ansible/roles/tomcat# cat tasks/redhat.yml

- yum:

    name: &quot;tomcat&quot;

    state: present

root@197NODNB:/etc/ansible/roles/tomcat# cat /etc/ansible/tomcat\_roles.yml

---

- hosts: all

  roles:

     - java

     - tomcat

root@197NODNB:/etc/ansible/roles/tomcat#



It should include Templates for the configuration files with all the dynamic value that needs to be updated. :-

root@197NODNB:/etc/ansible/roles/nginx/vars# cat main.yml

---

# vars file for nginx

nginx\_port: 8081

root@197NODNB:/etc/ansible/roles/nginx/vars#



root@197NODNB:/etc/ansible/roles/nginx/templates# cat nginx\_conf.j2

#user  nobody;

worker\_processes  1;

#error\_log  logs/error.log;

#error\_log  logs/error.log  notice;

#error\_log  logs/error.log  info;

#pid        logs/nginx.pid;



events {

    worker\_connections  1024;

}

http {

    include       mime.types;

    default\_type  application/octet-stream;

    #log\_format  main  &#39;$remote\_addr - $remote\_user [$time\_local] &quot;$request&quot; &#39;

    #                  &#39;$status $body\_bytes\_sent &quot;$http\_referer&quot; &#39;

    #                  &#39;&quot;$http\_user\_agent&quot; &quot;$http\_x\_forwarded\_for&quot;&#39;;

    #access\_log  logs/access.log  main;

    sendfile        on;

    #tcp\_nopush     on;

    #keepalive\_timeout  0;

    keepalive\_timeout  65;

    #gzip  on;

    server {

        listen {{ nginx\_port }};

        server\_name  localhost;

        #charset koi8-r;

        #access\_log  logs/host.access.log  main;

        location / {

            root   /opt/html;

            index  index.html index.htm;

        }

        #error\_page  404              /404.html;

        # redirect server error pages to the static page /50x.html

        #

        error\_page   500 502 503 504  /50x.html;

        location = /50x.html {

            root   html;

        }

        # proxy the PHP scripts to Apache listening on 127.0.0.1:80

        #

        #location ~ \.html$ {

        #    proxy\_pass   http://127.0.0.1:80;

        #}

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000

        #

        #location ~ \.php$ {

        #    root           html;

        #    fastcgi\_pass   127.0.0.1:9000;

        #    fastcgi\_index  index.php;

        #    fastcgi\_param  SCRIPT\_FILENAME  /scripts$fastcgi\_script\_name;

        #    include        fastcgi\_params;

        #}

        # deny access to .htaccess files, if Apache&#39;s document root

        # concurs with nginx&#39;s one

        #

               #location ~ /\.ht {

        #    deny  all;

        #}

    }

#server {

#    listen 8080;

#    server\_name 192.168.33.10;

#

#    location / {

#        proxy\_pass http://192.168.33.10:80;

#        proxy\_set\_header Host $host;

#        proxy\_set\_header X-Real-IP $remote\_addr;

#        proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;

#        proxy\_set\_header X-Forwarded-Proto $scheme;

#    }

#}

#server {

#    listen 8081;

#    server\_name 192.168.33.10;

#    root /usr/local/apache-tomcat-8.5.27/webapps/Spring3HibernateApp/;

#    index index.jsp index.html index.htm;

#    location /usr/local/apache-tomcat-8.5.27/webapps/Spring3HibernateApp/ {

#        proxy\_pass http://192.168.33.10:8080;

#        proxy\_set\_header Host $host;

#        proxy\_set\_header X-Real-IP $remote\_addr;

#        proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;

#        proxy\_set\_header X-Forwarded-Proto $scheme;

#    }

#}

}

   # another virtual host using mix of IP-, name-, and port-based configuration

    #

    #server {

    #    listen       8000;

    #    listen       somename:8080;

    #    server\_name  somename  alias  another.alias;

    #    location / {

    #        root   html;

    #        index  index.html index.htm;

    #    }

    #}



    # HTTPS server

    #

    #server {

    #    listen       443 ssl;

    #    server\_name  localhost;

    #    ssl\_certificate      cert.pem;

    #    ssl\_certificate\_key  cert.key;

    #    ssl\_session\_cache    shared:SSL:1m;

    #    ssl\_session\_timeout  5m;

    #    ssl\_ciphers  HIGH:!aNULL:!MD5;

    #    ssl\_prefer\_server\_ciphers  on;

    #    location / {

    #        root   html;

    #        index  index.html index.htm;

    #    }

    #}

root@197NODNB:/etc/ansible/roles/nginx/templates#



root@197NODNB:/etc/ansible/roles/nginx/tasks# cat main.yml

---

# tasks file for nginx

- name: install nginx on centos or ubuntu

  import\_tasks: redhat.yml

  when: ansible\_os\_family == &#39;RedHat&#39;

- import\_tasks: debian.yml

  when: ansible\_os\_family == &#39;Debian&#39;

root@197NODNB:/etc/ansible/roles/nginx/tasks#



root@197NODNB:/etc/ansible/roles/nginx/tasks# cat debian.yml

- apt:

    name: &quot;nginx&quot;

    state: present

- template:

    src: nginx\_conf.j2

    dest: /etc/nginx/nginx.conf

    owner: root

    group: root

    mode: 0644

root@197NODNB:/etc/ansible/roles/nginx/tasks# cat redhat.yml

- yum:

    name: &quot;nginx&quot;

    state: present

- template:

    src: nginx\_conf.j2

    dest: /etc/nginx/nginx.conf

    owner: root

    group: root

    mode: 0644

root@197NODNB:/etc/ansible/roles/nginx/tasks#



It should include handlers , but not along with the task. :-

root@197NODNB:/etc/ansible/roles/nginx/tasks# cat debian.yml

- apt:

    name: &quot;nginx&quot;

    state: present

  ignore\_errors: yes

- template:

    src: nginx\_conf.j2

    dest: /etc/nginx/nginx.conf

    owner: root

    group: root

    mode: 0644

  notify: restart nginx

root@197NODNB:/etc/ansible/roles/nginx/tasks# cat redhat.yml

- yum:

    name: &quot;nginx&quot;

    state: present

- template:

    src: nginx\_conf.j2

    dest: /etc/nginx/nginx.conf

    owner: root

    group: root

    mode: 0644

  notify: restart nginx

root@197NODNB:/etc/ansible/roles/nginx/tasks#

root@197NODNB:/etc/ansible/roles/nginx# cd handlers/

root@197NODNB:/etc/ansible/roles/nginx/handlers# ll

total 12

drwxr-xr-x  2 root root 4096 Mar 12 16:11 ./

drwxr-xr-x 10 root root 4096 Mar 11 16:09 ../

-rw-r--r--  1 root root  101 Mar 12 16:00 main.yml

root@197NODNB:/etc/ansible/roles/nginx/handlers# cat main.yml

---

# handlers file for nginx

- name: restart nginx

  service:

    name: nginx

    state: restarted

root@197NODNB:/etc/ansible/roles/nginx/handlers#



At the end of Role, it should print the current state of Nginx and tomcat . :-

root@197NODNB:/etc/ansible#

root@197NODNB:/etc/ansible# cat roles/nginx/tasks/redhat.yml

- yum:

    name: &quot;nginx&quot;

    state: present

- template:

    src: nginx\_conf.j2

    dest: /etc/nginx/nginx.conf

    owner: root

    group: root

    mode: 0644

  notify: restart nginx

#- name: Check if Apache is running

#  command: systemctl status nginx

#  ignore\_errors: yes

#  changed\_when: false

#  register: service\_nginx\_status

#

#- name: Report status of Apache

#  fail:

#    msg: |

#     Service nginx is not running.

#     Output of `systemctl status nginx`:

#     {{ service\_nginx\_status.stdout }}

#     {{ service\_nginx\_status.stderr }}

#  when: service\_nginx\_status | failed



- name: Check if nginx is running

  shell: ps aux | grep nginx | grep -v grep

  ignore\_errors: yes

  changed\_when: false

  register: service\_nginx\_status

- name: Report status of nginx

  fail:

    msg: |

      Service nginx is not running.

      Return code from `grep`:

      {{ service\_nginx\_status.rc }}

  when: service\_nginx\_status.rc != 0

root@197NODNB:/etc/ansible#



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

Give path of folder. Like we give roles in path.

In Build select Invoke ansible playbook.

Give path of ansible play book Like roles/nginx\_roles.yml



User can select which role he/she want to execute from jenkins - tomcat/nginx/java . :-

Create a new project with name like roles\_with\_perameter

Select this job is parameterised.

Select choice parameter.

Give Name of parameter like test

Give choices like

nginx

tomcat

java

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





Java role should be available separately for tomcat&#39;s dependency and will be executed

when tomcat role executes using meta and also should have option to run separately from jenkins. :-



Create a new project with name like roles\_with\_perameter

Select this job is parameterised.

Select choice parameter.

Give Name of parameter like test

Give choices like

tomcat

java

Give discription like roles with parameter.

Select git in Source Code Management.

Give path of repository you want to clone.

Click on additional behaviours.

Click on Add in additional behaviours and select Sparse checkout paths.

Give path of folder. Like we give roles in path.

In Build select Invoke ansible playbook.

Give path of ansible play book Like roles/${test}\_roles.yml

Now, When we run this job with parameter ${test} will replace with parameter value you give.
