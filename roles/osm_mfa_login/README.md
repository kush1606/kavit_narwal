Role Name
=========

osm_mfa_login is roles which  enable Multi-Factor Authentication for SSH. By using this role you  can enable Multi-Factor Authentication on Centos and Ubuntu OS. 

Requirements
------------

Please change hosts file according to your IP or hostname. Like mention IP address or hostname of machine in hosts file on which you want to enable Multi-Factor Authentication for SSH.  

Role Variables
--------------

Define nothing in var and default folder for this role.

Dependencies
------------

No need to run others roles.

Example Playbook
----------------

site.yml

- hosts: Centos (Mention servers group or IP on which you want to execute this roles)
  sudo: yes ( If you want to run this role with normal user.)
  roles:
   - role: osm_mfa_login (Mention role name here.)

