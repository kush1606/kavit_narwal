All needs to be done using ansible modules with jenkins There will be three jenkins jobs, Provisioning, Build, Deployment.

Provisioning:-

Provision application servers, for example - java, tomcat are required for a java project.

This job will be a separate job and can be executed to any machine on requirement.



First of all create playbooks for java and tomcat installation.

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

- hosts: all

  sudo: yes

  tasks:

  - name: install java on centos

    yum:

      name: java

      state: present

    when: ansible\_os\_family == &quot;RedHat&quot;

  - name: install java on Ubuntu

    apt:

      name: java

      state: present

    when: ansible\_os\_family == &quot;Debian&quot;

After that create a new job in jenkins.

Select Build and invoke ansible playbook

Give path of playbooks you  want to run.



Build and Deployment Job will be in downstream relationship.

Build:-

Build any Project - can be java or any other language using jenkins. :-



create a new item. clone code from github. run mvn compile.



Deployment:-

Create a down stream deployment job to the build job .

In the deployment job , deploy the artifact (war in case of java) to the application server (tomcat/joboss)

using ansible in the downstream job. :-

Ansible play book will include health check also, (status code == 200) , if health check fails, job should also fail. :-



create a new ansible playbook :-

- hosts: all

  sudo: yes

  tasks:

  - copy: src={{ item.src }} dest={{ item.dest }}

    with\_items:

    - { src: &#39;/etc/ansible/sample.war&#39;, dest: &#39;/var/lib/tomcat/webapps/&#39; }

  - name: restart tomcat

    service:

      name: tomcat

      state: restarted

  - name: health-check

    uri:

      get\_url: &quot;{{ item.name }}&quot;

    with\_items:

      - { name: &#39;http://192.168.33.11:8080&#39; }

      - { name: &#39;http://192.168.33.12:8080&#39; }

    status\_code: 200
