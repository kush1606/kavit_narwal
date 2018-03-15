Role Name
=========

Installing Sonarqube in RHEL/CentOS and Ubuntu

Requirements
------------
For Sonarqube we need below package
java
mysql

Role Variables
--------------
I used below mention variables in my role

mysql_root_pass: XXXXX
dbname: XXX
dbuserpassword: XXXX
dbusername: XXX

in vars/main.yml u can change the value

Dependencies
------------

No need to run others roles.

Example Playbook
----------------

site.yml

- hosts: Centos (Mention servers group or IP on which you want to execute this roles)
  sudo: yes ( If you want to run this role with normal user.)
  roles:
   - role: osm_sonarqube (Mention role name here.)

