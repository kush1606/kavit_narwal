Create an Ansible playbook to rotate ssh keys. Explaination - Replacing the keys you&#39;re currently using with new keys, and removing the ability for old keys to be used to log into your systems.

Create a new key :-

- hosts: 127.0.0.1

   sudo: yes

   tasks:

   - name: Generate SSH keys

     shell: ssh-keygen -b 2048 -t rsa -f /root/.ssh/id\_rsa\_root -q -N &quot;&quot;

     args:

       creates: /root/.ssh/id\_rsa\_root



Add new key to authorized\_keys files on your nodes :-



 - hosts: 192.168.33.10

   sudo: yes

   tasks:

   - name: copy ssh public key

     lineinfile:

       path: /root/.ssh/authorized\_keys

       insertafter: EOF

       line: &#39;ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpenIPbyI9AV0QrfEDU7GTy4RB4MWlPPh/372AxE2daEbOJp3gBXrnI4EaSp25KjGsvlKJGcFc89O/Xzin/u8jqaPhGLuSJqUFIPjrbfY68le0otE2GKR76hL92diixHpbgxJ17RrnsFZAC1c1rbzwrpVJILpyIRpNZ0xVrPHrYGvI2vffWex4ZQ1JZjzlbNXHH/nL9Fr2TB3fH5RoyVhMwsfwR6hto+bJKSy7hhP4VIeIjwvir9jSYRj2SPgmOGSkrz/n5Se0SKrHqKYgmPS01WTPGH5HGGT1qMjnzDNEEZ5VxgplfWztKmdWPEQKgYqDfSflei6e3j0pB8uOmZnp root@197NODNB&#39;

       backup: yes



- hosts: 192.168.33.10

   sudo: yes

   tasks:

   - name: copy ssh public key

     copy:

       src: /root/.ssh/id\_rsa\_root.pub

       dest: /root/.ssh/authorized\_keys

       follow: true

       owner: root

       group: root

       mode: 0600

       backup: yes



Rotate ssh key :-



- name: Rotate SSH Keys

  hosts: all

  vars:

    - new\_pub\_key: ~/.ssh/id\_rsa\_new.pub

    - new\_priv\_key: ~/.ssh/id\_rsa\_new

  tasks:

    - name: Add new key to authorized\_keys

      authorized\_key: key=&quot;{{ lookup(&#39;file&#39;, new\_pub\_key) }}&quot;

                      user=root state=present

    - name: Make use of new private key when connecting

      set\_fact: ansible\_private\_ssh\_key={{ new\_priv\_key }}

    - name: Make our new key exclusive

      authorized\_key: key=&quot;{{ lookup(&#39;file&#39;, new\_pub\_key) }}&quot;

                      user=root state=present exclusive=yes

    - name: Create new ssh key-pair

      command: ssh-keygen -t rsa -N &quot;&quot; -q

               -f {{ new\_priv\_key }}

      when: inventory\_hostname == play\_hosts[0]

      delegate\_to: localhost



complete rotation playbookYAML

---

- name: Rotate SSH Keys

  hosts: all

  vars:

    - new\_pub\_key: ~/.ssh/id\_rsa\_new.pub

    - new\_priv\_key: ~/.ssh/id\_rsa\_new

  tasks:

    - name: Create new ssh key-pair

      command: ssh-keygen -t rsa -N &quot;&quot; -q

               -f {{ new\_priv\_key }}

      when: inventory\_hostname == play\_hosts[0]

      delegate\_to: localhost

    - name: Add new key to authorized\_keys

      authorized\_key: key=&quot;{{ lookup(&#39;file&#39;, new\_pub\_key) }}&quot;

                      user=root state=present

    - name: Make use of new private key when connecting

      set\_fact: ansible\_private\_ssh\_key={{ new\_priv\_key }}

    - name: Make our new key exclusive

      authorized\_key: key=&quot;{{ lookup(&#39;file&#39;, new\_pub\_key) }}&quot;

                      user=root state=present exclusive=yes

    - name: Move new key into default location

      command: mv {{ new\_priv\_key }} ~/.ssh/id\_rsa

      when: inventory\_hostname == play\_hosts[0]

      delegate\_to: localhost



Test new key :-

Add below mention line in hosts file.

192.168.33.10 ansible\_ssh\_private\_key\_file=/root/.ssh/id\_rsa\_root

Now it will ssh by using new ssh key pair.



Remove previous keys from authorized\_keys files on your nodes. :-

- hosts: 192.168.33.10

   sudo: yes

   tasks:

   - name: remove old ssh public key

     lineinfile:

       path: /root/.ssh/authorized\_keys

       state: absent

       line: &#39;ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVZT6Hy/t9ZvkAiut1X/H5ISb7QVKerCXbDyfEbfcUH5p5rKy3Jv35zNlbPwDXGh+B1ryr/BUeF8w7VGw2NffAXuTWZlqazupGz5kFF53MHAS2a+mnyDyW9rrjv5hTyUHf3zvNLXRj886akcR+DNST9Oy5QwPirmtel6820AjIVL4mR+PV/bXtKmkVPUZdkHihrKhotWm5XgCLJ3pjryqmwGzeNjC575cvdMdITHNBTIK9A1iht6STLqU/jRCKh2cExOLEdMcPU9B2a2BkghuVKGOGS7lxO2EFREOpwRi2zmtxpk0PkUSyvAIrs9m7eCzNDRs6rfdeUBV6vyt8kITx root@197NODNB18405&#39;

       backup: yes

again test the connectivity with the new keys. :-



First of all we will move /root/.ssh/id\_rsa\_root into /root/.ssh/id\_rsa

Now try  to ssh with new ssh key pair.
