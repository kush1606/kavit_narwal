Create 5 users with password, and these five users should have same permissions for a directory named ninja.(Directory can be created with the 5 users permmission.) :-





- hosts: 192.168.33.10

  sudo: yes

  tasks:

  - name: Creates users

    user: name=&quot;{{item.username}}&quot; password=&quot;{{item.password}}&quot; home=/home/{{item.username}}

    with\_items:

     - { username: savi, password: &#39;sa2lur4NS1W76&#39; }

     - { username: ankit, password: &#39;anu30viuEYTUs&#39; }

     - { username: sahil, password: &#39;sa2lur4NS1W76&#39; }

     - { username: rohit, password: &#39;roiUJb25xffLA&#39; }

     - { username: mohit, password: &#39;mot5AYzM0o0PA&#39; }

Create ssh key for each user so that all those 5 users will be able to login through ssh. :-



- hosts: 192.168.33.10

  sudo: yes

  tasks:

  - name: Generate SSH keys

    shell: |

       mkdir /home/ankit/.ssh/

       su - ankit

       ssh-keygen -b 2048 -t rsa -f /home/ankit/.ssh/id\_rsa -q -N &quot;&quot;

       chown -R ankit:ankit /home/ankit/.ssh

  - name: Generate SSH keys

    shell: |

       mkdir /home/rohit/.ssh/

       su - rohit

       ssh-keygen -b 2048 -t rsa -f /home/rohit/.ssh/id\_rsa -q -N &quot;&quot;

       chown -R rohit:rohit /home/rohit/.ssh

  - name: Generate SSH keys

    shell: |

       mkdir /home/sahil/.ssh/

       su - sahil

       ssh-keygen -b 2048 -t rsa -f /home/sahil/.ssh/id\_rsa -q -N &quot;&quot;

       chown -R sahil:sahil /home/sahil/.ssh

  - name: Generate SSH keys

    shell: |

       mkdir /home/savi/.ssh/

       su - savi

       ssh-keygen -b 2048 -t rsa -f /home/savi/.ssh/id\_rsa -q -N &quot;&quot;

       chown -R savi:savi /home/savi/.ssh

  - name: Generate SSH keys

    shell: |

       mkdir /home/mohit/.ssh/

       su - mohit

       ssh-keygen -b 2048 -t rsa -f /home/mohit/.ssh/id\_rsa -q -N &quot;&quot;

       chown -R mohit:mohit /home/mohit/.ssh



Creat Logical Volume in any node machine. :-

need to installl lvm2 first using ansible.

Create ext4 type File System on the newly created logical volume.

Mount newly created file system.

- hosts: 127.0.0.1

  tasks:

  - parted:

     device: /dev/sdb

     number: 1

     flags: [lvm]

     state: present

     part\_end: 8GiB

  - lvg:

      vg: vg0

      pvs: /dev/sdb1

      pesize: 32

  - lvol:

       vg: vg0

       lv: lv01

       size: 5g

       pvs: /dev/sdb1

  - name: format the file for swap

    shell: mkfs.ext4 /dev/vg0/lv01

  - name: make swap space permanent

    mount: src=/dev/vg0/lv01 name=/lvm fstype=ext4 state=present opts=defaults passno=0 dump=0
