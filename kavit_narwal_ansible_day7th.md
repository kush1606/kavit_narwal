Using Ansible Modules, Create Swap memory using swap File if Swap does not exist in the node machine ,

if it exists increase the swap Size. :-





- hosts: 192.168.33.10

  tasks:

  - name: create the file to be used for swap

    command: dd if=/dev/zero of=/mnt/swapfile count=4096 bs=1MiB

    when: ansible\_swaptotal\_mb == &quot;0&quot;

  - name: format the file for swap

    command: mkswap /mnt/swapfile

    when: ansible\_swaptotal\_mb == &quot;0&quot;

  - name: change swap file permissions

    file: path=/mnt/swapfile owner=root group=root mode=0600

    when: ansible\_swaptotal\_mb == &quot;0&quot;

  - name: add the file to the system as a swap file

    command: swapon /mnt/swapfile

    when: ansible\_swaptotal\_mb == &quot;0&quot;

  - name: create the file to be used for swap

    command: dd if=/dev/zero of=/mnt/swapfile count=4096 bs=1MiB

    when: ansible\_swaptotal\_mb != &quot;0&quot;

  - name: format the file for swap

    command: mkswap /mnt/swapfile

    when: ansible\_swaptotal\_mb != &quot;0&quot;

  - name: change swap file permissions

    file: path=/mnt/swapfile owner=root group=root mode=0600

    when: ansible\_swaptotal\_mb != &quot;0&quot;

  - name: add the file to the system as a swap file

    command: swapon /mnt/swapfile

    when: ansible\_swaptotal\_mb != &quot;0&quot;

  - name: make swap space permanent

    mount: src=/mnt/swapfile name=swap fstype=swap state=present opts=defaults passno=0 dump=0

    when: ansible\_swaptotal\_mb != &quot;0&quot;
