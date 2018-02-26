Install ansible by using pip, apt-get, Yum :-



By Using apt-get

$ sudo apt-get update

$ sudo apt-get install software-properties-common

$ sudo apt-add-repository ppa:ansible/ansible

$ sudo apt-get update

$ sudo apt-get install ansible

By ussing pip

$ sudo easy\_install pip

$ sudo pip install ansible

By  using yum/rpm

$ git clone https://github.com/ansible/ansible.git

$ cd ./ansible

$ make rpm

$ sudo rpm -Uvh ./rpm-build/ansible-\*.noarch.rpm

Configuration file basics :-

ask\_pass

This controls whether an Ansible playbook should prompt for a password by default. The default behavior is no:

ask\_pass = True

If using SSH keys for authentication, it&#39;s probably not needed to change this setting.

ask\_sudo\_pass

Similar to ask\_pass, this controls whether an Ansible playbook should prompt for a sudo password by default when sudoing. The default behavior is also no:

ask\_sudo\_pass = True

Users on platforms where sudo passwords are enabled should consider changing this setting.

ask\_vault\_pass

This controls whether an Ansible playbook should prompt for the vault password by default. The default behavior is no:

ask\_vault\_pass = True

force\_handlers

This option causes notified handlers to run on a host even if a failure occurs on that host:

force\_handlers = True

The default is False, meaning that handlers will not run if a failure has occurred on a host. This can also be set per play or on the command line. See Handlers and Failure for more details.



forks

This is the default number of parallel processes to spawn when communicating with remote hosts. Since Ansible 1.3, the fork number is automatically limited to the number of possible hosts at runtime, so this is really a limit of how much network and CPU load you think you can handle. Many users may set this to 50, some set it to 500 or more. If you have a large number of hosts, higher values will make actions across all of those hosts complete faster. The default is very very conservative:

forks = 5

fact\_caching

This option allows you to configure fact caching. When a fact cache is enabled and there is valid data for a host, Ansible will use that rather than running an implicit setup job on a remote host.

The value of this option should be the name of a cache plugin. Current versions of Ansible include redis and jsonfile:

fact\_caching = jsonfile

fact\_caching\_connection

This option tells Ansible where to cache facts. The value is plugin dependent. For the jsonfile plugin, it should be a path to a local directory. For the redis plugin, the value is a host:port:database triplet:

fact\_caching\_connection = localhost:6379:0

fact\_caching\_timeout

This option tells Ansible when to expire values from the cache. Setting this value to 0 effectively disables expiry, and a positive value is a TTL in seconds:

fact\_caching\_timeout = 86400

fact\_path

This option allows you to globally configure a custom path for Local Facts (Facts.d) for the implied setup task when using implied fact gathering.

fact\_path = /home/centos/ansible\_facts.d

The default is to use the default from the setup module: /etc/ansible/facts.d This ONLY affects fact gathering triggered by a play when gather\_facts: True.

gathering

 the &#39;gathering&#39; setting controls the default policy of facts gathering (variables discovered about remote systems).

The value &#39;implicit&#39; is the default, which means that the fact cache will be ignored and facts will be gathered per play unless &#39;gather\_facts: False&#39; is set. The value &#39;explicit&#39; is the inverse, facts will not be gathered unless directly requested in the play. The value &#39;smart&#39; means each new host that has no facts discovered will be scanned, but if the same host is addressed in multiple plays it will not be contacted again in the playbook run. This option can be useful for those wishing to save fact gathering time. Both &#39;smart&#39; and &#39;explicit&#39; will use the fact cache:

gathering = smart

You can specify a subset of gathered facts, via the play&#39;s gather\_facts directive, using the following option:

gather\_subset = all

local\_tmp

When Ansible gets ready to send a module to a remote machine it usually has to add a few things to the module: Some boilerplate code, the module&#39;s parameters, and a few constants from the config file. This combination of things gets stored in a temporary file until ansible exits and cleans up after itself. The default location is a subdirectory of the user&#39;s home directory. If you&#39;d like to change that, you can do so by altering this setting:

local\_tmp = ~/.ansible/tmp

Ansible will then choose a random directory name inside this location.

log\_path

If present and configured in ansible.cfg, Ansible will log information about executions at the designated location. Be sure the user running Ansible has permissions on the logfile:

log\_path=/var/log/ansible.log

This behavior is not on by default. Note that ansible will, without this setting, record module arguments called to the syslog of managed machines. Password arguments are excluded.

For Enterprise users seeking more detailed logging history, you may be interested in Ansible Tower.

lookup\_plugins

This is a developer-centric feature that allows low-level extensions around Ansible to be loaded from different locations:

lookup\_plugins = ~/.ansible/plugins/lookup\_plugins/:/usr/share/ansible\_plugins/lookup\_plugins

remote\_port

This sets the default SSH port on all of your systems, for systems that didn&#39;t specify an alternative value in inventory. The default is the standard 22:

remote\_port = 22

remote\_tmp

Ansible works by transferring modules to your remote machines, running them, and then cleaning up after itself. In some cases, you may not wish to use the default location and would like to change the path. You can do so by altering this setting:

remote\_tmp = ~/.ansible/tmp

The default is to use a subdirectory of the user&#39;s home directory. Ansible will then choose a random directory name inside this location.

remote\_user

This is the default username ansible will connect as for /usr/bin/ansible-playbook. Note that /usr/bin/ansible will always default to the current user if this is not defined:

remote\_user = root

retry\_files\_enabled

This controls whether a failed Ansible playbook should create a .retry file. The default setting is True:

retry\_files\_enabled = False

retry\_files\_save\_path

The retry files save path is where Ansible will save .retry files when a playbook fails and retry\_files\_enabled is True (the default). The default location is adjacent to the play (~/ in versions older than 2.0) and can be changed to any writeable path:

retry\_files\_save\_path = ~/.ansible/retry-files

The directory will be created if it does not already exist.

roles\_path

The roles path indicate additional directories beyond the &#39;roles/&#39; subdirectory of a playbook project to search to find Ansible roles. For instance, if there was a source control repository of common roles and a different repository of playbooks, you might choose to establish a convention to checkout roles in /opt/mysite/roles like so:

roles\_path = /opt/mysite/roles

Additional paths can be provided separated by colon characters, in the same way as other pathstrings:

roles\_path = /opt/mysite/roles:/opt/othersite/roles

Roles will be first searched for in the playbook directory. Should a role not be found, it will indicate all the possible paths that were searched.



sudo\_exe

If using an alternative sudo implementation on remote machines, the path to sudo can be replaced here provided the sudo implementation is matching CLI flags with the standard sudo:

sudo\_exe = sudo

sudo\_flags

Additional flags to pass to sudo when engaging sudo support. The default is &#39;-H -S -n&#39; which sets the HOME environment variable, prompts for passwords via STDIN, and avoids prompting the user for input of any kind. Note that &#39;-n&#39; will conflict with using password-less sudo auth, such as pam\_ssh\_agent\_auth. In some situations you may wish to add or remove flags, but in general most users will not need to change this setting::

sudo\_flags=-H -S -n

sudo\_user

This is the default user to sudo to if --sudo-user is not specified or &#39;sudo\_user&#39; is not specified in an Ansible playbook. The default is the most logical: &#39;root&#39;:

sudo\_user = root

become

The equivalent of adding sudo: or su: to a play or task, set to true/yes to activate privilege escalation. The default behavior is no:

become = True

become\_method

Set the privilege escalation method. The default is sudo, other options are su, pbrun, pfexec, doas, ksu:

become\_method = su

become\_user

The equivalent to ansible\_sudo\_user or ansible\_su\_user, allows to set the user you become through privilege escalation. The default is &#39;root&#39;:

become\_user = root

become\_ask\_pass

Ask for privilege escalation password, the default is False:

become\_ask\_pass = True

become\_allow\_same\_user

Most of the time, using sudo to run a command as the same user who is running sudo itself is unnecessary overhead, so Ansible does not allow it. However, depending on the sudo configuration, it may be necessary to run a command as the same user through sudo, such as to switch SELinux contexts. For this reason, you can set become\_allow\_same\_user to True and disable this optimization.

Ansible inventory Usage :-

Ansible works against multiple systems in your infrastructure at the same time. It does this by selecting portions of systems listed in Ansible&#39;s inventory, which defaults to being saved in the location /etc/ansible/hosts. You can specify a different inventory file using the -i &lt;path&gt; option on the command line.

Not only is this inventory configurable, but you can also use multiple inventory files at the same time and pull inventory from dynamic or cloud sources or different formats (YAML, ini, etc), as described in Dynamic Inventory. Introduced in version 2.4, Ansible has inventory plugins to make this flexible and customizable.



Use pip to install the ansible package and its dependencies to your control machine. :-



 easy\_install pip

 pip install ansible

Display the Ansible version and man page to STDOUT. :-

root@197NODNB:~# ansible --version

ansible 2.4.3.0

  config file = /etc/ansible/ansible.cfg

  configured module search path = [u&#39;/root/.ansible/plugins/modules&#39;, u&#39;/usr/share/ansible/plugins/modules&#39;]

  ansible python module location = /usr/lib/python2.7/dist-packages/ansible

  executable location = /usr/bin/ansible

  python version = 2.7.12 (default, Dec  4 2017, 14:50:18) [GCC 5.4.0 20160609]

root@197NODNB:~#



Check all the possible parameters you need to know in ansible.cfg file. :-



ask\_pass

This controls whether an Ansible playbook should prompt for a password by default. The default behavior is no:

ask\_pass = True

If using SSH keys for authentication, it&#39;s probably not needed to change this setting.

ask\_sudo\_pass

Similar to ask\_pass, this controls whether an Ansible playbook should prompt for a sudo password by default when sudoing. The default behavior is also no:

ask\_sudo\_pass = True

Users on platforms where sudo passwords are enabled should consider changing this setting.

ask\_vault\_pass

This controls whether an Ansible playbook should prompt for the vault password by default. The default behavior is no:

ask\_vault\_pass = True



force\_handlers

This option causes notified handlers to run on a host even if a failure occurs on that host:

force\_handlers = True

The default is False, meaning that handlers will not run if a failure has occurred on a host. This can also be set per play or on the command line. See Handlers and Failure for more details.



forks

This is the default number of parallel processes to spawn when communicating with remote hosts. Since Ansible 1.3, the fork number is automatically limited to the number of possible hosts at runtime, so this is really a limit of how much network and CPU load you think you can handle. Many users may set this to 50, some set it to 500 or more. If you have a large number of hosts, higher values will make actions across all of those hosts complete faster. The default is very very conservative:

forks = 5

fact\_caching

This option allows you to configure fact caching. When a fact cache is enabled and there is valid data for a host, Ansible will use that rather than running an implicit setup job on a remote host.

The value of this option should be the name of a cache plugin. Current versions of Ansible include redis and jsonfile:

fact\_caching = jsonfile

fact\_caching\_connection

This option tells Ansible where to cache facts. The value is plugin dependent. For the jsonfile plugin, it should be a path to a local directory. For the redis plugin, the value is a host:port:database triplet:

fact\_caching\_connection = localhost:6379:0

fact\_caching\_timeout

This option tells Ansible when to expire values from the cache. Setting this value to 0 effectively disables expiry, and a positive value is a TTL in seconds:

fact\_caching\_timeout = 86400

fact\_path

This option allows you to globally configure a custom path for Local Facts (Facts.d) for the implied setup task when using implied fact gathering.

fact\_path = /home/centos/ansible\_facts.d

The default is to use the default from the setup module: /etc/ansible/facts.d This ONLY affects fact gathering triggered by a play when gather\_facts: True.

gathering

 the &#39;gathering&#39; setting controls the default policy of facts gathering (variables discovered about remote systems).

The value &#39;implicit&#39; is the default, which means that the fact cache will be ignored and facts will be gathered per play unless &#39;gather\_facts: False&#39; is set. The value &#39;explicit&#39; is the inverse, facts will not be gathered unless directly requested in the play. The value &#39;smart&#39; means each new host that has no facts discovered will be scanned, but if the same host is addressed in multiple plays it will not be contacted again in the playbook run. This option can be useful for those wishing to save fact gathering time. Both &#39;smart&#39; and &#39;explicit&#39; will use the fact cache:

gathering = smart

You can specify a subset of gathered facts, via the play&#39;s gather\_facts directive, using the following option:

gather\_subset = all

local\_tmp

When Ansible gets ready to send a module to a remote machine it usually has to add a few things to the module: Some boilerplate code, the module&#39;s parameters, and a few constants from the config file. This combination of things gets stored in a temporary file until ansible exits and cleans up after itself. The default location is a subdirectory of the user&#39;s home directory. If you&#39;d like to change that, you can do so by altering this setting:

local\_tmp = ~/.ansible/tmp

Ansible will then choose a random directory name inside this location.

log\_path

If present and configured in ansible.cfg, Ansible will log information about executions at the designated location. Be sure the user running Ansible has permissions on the logfile:

log\_path=/var/log/ansible.log

This behavior is not on by default. Note that ansible will, without this setting, record module arguments called to the syslog of managed machines. Password arguments are excluded.

For Enterprise users seeking more detailed logging history, you may be interested in Ansible Tower.

lookup\_plugins

This is a developer-centric feature that allows low-level extensions around Ansible to be loaded from different locations:

lookup\_plugins = ~/.ansible/plugins/lookup\_plugins/:/usr/share/ansible\_plugins/lookup\_plugins

remote\_port

This sets the default SSH port on all of your systems, for systems that didn&#39;t specify an alternative value in inventory. The default is the standard 22:

remote\_port = 22

remote\_tmp

Ansible works by transferring modules to your remote machines, running them, and then cleaning up after itself. In some cases, you may not wish to use the default location and would like to change the path. You can do so by altering this setting:

remote\_tmp = ~/.ansible/tmp

The default is to use a subdirectory of the user&#39;s home directory. Ansible will then choose a random directory name inside this location.

remote\_user

This is the default username ansible will connect as for /usr/bin/ansible-playbook. Note that /usr/bin/ansible will always default to the current user if this is not defined:

remote\_user = root

retry\_files\_enabled

This controls whether a failed Ansible playbook should create a .retry file. The default setting is True:

retry\_files\_enabled = False

retry\_files\_save\_path

The retry files save path is where Ansible will save .retry files when a playbook fails and retry\_files\_enabled is True (the default). The default location is adjacent to the play (~/ in versions older than 2.0) and can be changed to any writeable path:

retry\_files\_save\_path = ~/.ansible/retry-files

The directory will be created if it does not already exist.

roles\_path

The roles path indicate additional directories beyond the &#39;roles/&#39; subdirectory of a playbook project to search to find Ansible roles. For instance, if there was a source control repository of common roles and a different repository of playbooks, you might choose to establish a convention to checkout roles in /opt/mysite/roles like so:

roles\_path = /opt/mysite/roles

Additional paths can be provided separated by colon characters, in the same way as other pathstrings:

roles\_path = /opt/mysite/roles:/opt/othersite/roles

Roles will be first searched for in the playbook directory. Should a role not be found, it will indicate all the possible paths that were searched.



sudo\_exe

If using an alternative sudo implementation on remote machines, the path to sudo can be replaced here provided the sudo implementation is matching CLI flags with the standard sudo:

sudo\_exe = sudo

sudo\_flags

Additional flags to pass to sudo when engaging sudo support. The default is &#39;-H -S -n&#39; which sets the HOME environment variable, prompts for passwords via STDIN, and avoids prompting the user for input of any kind. Note that &#39;-n&#39; will conflict with using password-less sudo auth, such as pam\_ssh\_agent\_auth. In some situations you may wish to add or remove flags, but in general most users will not need to change this setting::

sudo\_flags=-H -S -n

sudo\_user

This is the default user to sudo to if --sudo-user is not specified or &#39;sudo\_user&#39; is not specified in an Ansible playbook. The default is the most logical: &#39;root&#39;:

sudo\_user = root

become

The equivalent of adding sudo: or su: to a play or task, set to true/yes to activate privilege escalation. The default behavior is no:

become = True

become\_method

Set the privilege escalation method. The default is sudo, other options are su, pbrun, pfexec, doas, ksu:

become\_method = su

become\_user

The equivalent to ansible\_sudo\_user or ansible\_su\_user, allows to set the user you become through privilege escalation. The default is &#39;root&#39;:

become\_user = root

become\_ask\_pass

Ask for privilege escalation password, the default is False:

become\_ask\_pass = True

become\_allow\_same\_user

Most of the time, using sudo to run a command as the same user who is running sudo itself is unnecessary overhead, so Ansible does not allow it. However, depending on the sudo configuration, it may be necessary to run a command as the same user through sudo, such as to switch SELinux contexts. For this reason, you can set become\_allow\_same\_user to True and disable this optimization.

Ansible Inventory: Check the default inventory file for ansible control master and use inventory, run ansible ping commands on various inventory groups. Try this on minimum of two virtual machines.(You can use any of these Docker/Vagrant) :-

vim /etc/ansible/hosts

[web-servers]

127.0.0.1 ansible\_ssh\_pass=Kathura@0987 ansible\_ssh\_user=kavitnarwal

192.168.33.10

ansible all -m ping



In ~/.ansible.cfg file (create the file if it doesn&#39;t exist already) do the following: :-

Create a new directory ~/.ansible/retry-files and set retry\_files\_save\_path to it. :-

Set the Ansible system forks to 10 :-

mkdir ~/.ansible/retry-files

vim ansible.cfg change forks          = 10 and retry\_files\_save\_path = ~/.ansible/retry-files



Host a static website on minimum three hosts using inventory, content of static website is &quot;Index page of Ansible assignment&quot;

Document root /opt/html :-

- hosts: all

  sudo: yes

  tasks:

  - name: install nginx on Ubuntu

    apt:

      name: nginx

      state: present

    when: ansible\_os\_family == &quot;Debian&quot;

  - name: install nginx on Centos

    yum:

      name: &quot;{{ item.name }}&quot;

      state: present

    with\_items:

    - {name: epel-release}

    - {name: nginx}

    when: ansible\_os\_family == &quot;RedHat&quot;

  - copy: src={{ item.src }} dest={{ item.dest }}

    with\_items:

    - { src: &#39;/etc/ansible/nginx.cfg&#39;, dest: &#39;/etc/nginx/nginx.conf&#39; }

    - { src: &#39;/etc/ansible/index.html&#39;, dest: &#39;/opt/html/&#39; }

  - name: Creates directory

    file:

      path: /opt/html

      state: directory

      owner: root

      group: root

      mode: 0775

      recurse: yes

  - name: start nginx

    service:

      name: nginx

      state: started



First do this manually and then with jenkins using ansible plugin or execute shell.

- only use ansible modules. :-



Create a new jenkins job.

In build section select Invoke ansible playbook

Give playbook path.

After that run the build.
