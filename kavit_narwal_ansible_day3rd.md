Create and delete ninja directory on host machine :-

- hosts: all

  sudo: yes

  tasks:

  - name: Create directory

    file:

      path: /opt/ninja

      state: directory

      owner: root

      group: root

      mode: 0775

      recurse: yes



- hosts: all

  sudo: yes

  tasks:

  - name: Delete directory

    file:

      path: /opt/ninja

      state: absent

Set hostname on all nodes from remote machine :-

- hosts: 192.168.10.35

  sudo: yes

  tasks:

  - name: manage host name

    hostname:

      name: web01



Fetch os of all nodes and store o/p into a file, use min two different machine of different flavour of os. :-

ansible all -m setup | grep &quot;ansible\_os\_family&quot; &gt; os\_details.txt



Add three group into hosts file through ansible module.

          Debian ( ip of debian machine)

          Centos ( ip of centos machine)

          All ( ip of all nodes )

- hosts: 127.0.0.1

  tasks:

    - name:

      blockinfile:

         path: /etc/ansible/hosts

         block: |

            [Debian]

            127.0.0.1

            [Centos]

            192.168.33.10

            [All]

            127.0.0.1

            192.168.33.10

Step 1:

    \* Install apache on Debian machine

    \* Cross check apache isntalled or not from remote machine

    \* Apache runn  on 8082 port

    \* Create two virtual host

    \* Restart apache from remote machine



ansible Debian   -a &quot;apt-get install apache&quot; ----&gt; Install apache on Debian machine.

ansible Debian -m lineinfile -a &quot;dest=/etc/apache2/httpd.conf regexp=&#39;^#Listen 80&#39; replace=&#39;Listen 8082&#39;&quot;

ansible Debian -m copy -a &quot;src=/etc/ansible/virtualhost.conf dest=/etc/apache2/conf.d/&quot;

ansible Debian -m service -a &quot;name=httpd state=restarted&quot;

   \* Install nginx on centos machine

   \* Nginx run on 8080 port.

Step3:

   \* Configure Nginx - configure it to run as reverse proxy to apache



ansible Centos -m yum  -a &quot;name=nginx state=present&quot; ----&gt; Install nginx on centos.

ansible Centos -m lineinfile -a &quot;dest=/etc/nginx/nginx.conf regexp=&#39;listen       80 default\_server&#39; line=&#39;listen       8080 default\_server&#39;&quot; -----&gt; Nginx run on 8080 port.

ansible Centos -m copy -a &quot;src=/etc/ansible/reverse\_proxy.conf dest=/etc/nginx/&quot; -------&gt; configure it to run as reverse proxy to apache
