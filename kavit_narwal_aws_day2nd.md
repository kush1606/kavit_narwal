First you neet to create VPC

Then attach 1 IGW to VPC

Then Create one NAT GW alon with elastic Ip

Not create 2 public 2 private and 2 protected subnets

Attach the IGW to public and NAT GW to private

Now create 2 instance in Private and 1 in public

Security group settiings should open the port

ICMP IPV4 SSH HTTP HTTPS

Now you will be able to ping the public instance from localhost and also able to SSH but not to private

you need to ssh public EC2

$ ssh -i Ninja\_key.pem ec2-user@52.90.21.26 Last login: Tue Mar 20 13:02:37 2018 from 196.207.114.106

   \_\_|  \_\_|\_  )

   \_|  (     /   Amazon Linux AMI

  \_\_\_|\\_\_\_|\_\_\_|

https://aws.amazon.com/amazon-linux-ami/2017.09-release-notes/

then you can ssh to private

[ec2-user@ip-10-0-1-184 ~]$ ssh -i /home/ec2-user/Ninja\_key.pem ec2-user@10.0.3.242 Last login: Tue Mar 20 12:16:34 2018 from 10.0.1.184

   \_\_|  \_\_|\_  )

   \_|  (     /   Amazon Linux AMI

  \_\_\_|\\_\_\_|\_\_\_|

https://aws.amazon.com/amazon-linux-ami/2017.09-release-notes/ [ec2-user@ip-10-0-3-242 ~]$

Now set up LAMP Server ( and follow the same on both the private server )

[ec2-user@ip-10-0-1-184 ~]$ sudo yum update Loaded plugins: priorities, update-motd, upgrade-helper Resolving Dependencies --&gt; Running transaction check ---&gt; Package hwdata.noarch 0:0.233-14.1.18.amzn1 will be updated ---&gt; Package hwdata.noarch 0:0.233-14.1.19.amzn1 will be an update ---&gt; Package kernel.x86\_64 0:4.9.85-38.58.amzn1 will be installed --&gt; Finished Dependency Resolution

Dependencies Resolved

================================================================================================================================================================================================ Package Arch

[ec2-user@ip-10-0-1-184 ~]$ sudo yum install httpd Loaded plugins: priorities, update-motd, upgrade-helper Resolving Dependencies --&gt; Running transaction check ---&gt; Package httpd.x86\_64 0:2.2.34-1.16.amzn1 will be installed --&gt; Processing Dependency: httpd-tools = 2.2.34-1.16.amzn1 for package: httpd-2.2.34-1.16.amzn1.x86\_64 --&gt; Processing Dependency: apr-util-ldap for package: httpd-2.2.34-1.16.amzn1.x86\_64 --&gt; Processing Dependency: libaprutil-1.so.0()(64bit) for package: httpd-2.2.34-1.16.amzn1.x86\_64 --&gt; Processing Dependency: libapr-1.so.0()(64bit) for package: httpd-2.2.34-1.16.amzn1.x86\_64 --&gt; Running transaction check ---&gt; Package apr.x86\_64 0:1.5.2-5.13.amzn1 will be installed ---&gt; Package apr-util.x86\_64 0:1.5.4-6.18.amzn1 will be installed ---&gt; Package apr-util-ldap.x86\_64 0:1.5.4-6.18.amzn1 will be installed ---&gt; Package httpd-tools.x86\_64 0:2.2.34-1.16.amzn1 will be installed --&gt; Finished Dependency Resolution

Dependencies Resolved

================================================================================================================================================================================================ Package Arch Version Repository Size

Installing: httpd x86\_64 2.2.34-1.16.amzn1 amzn-updates 1.2 M Installing for dependencies: apr x86\_64 1.5.2-5.13.amzn1 amzn-updates 118 k apr-util x86\_64 1.5.4-6.18.amzn1 amzn-updates 99 k apr-util-ldap x86\_64 1.5.4-6.18.amzn1

[ec2-user@ip-10-0-1-184 ~]$ sudo yum install php php-mysql Loaded plugins: priorities, update-motd, upgrade-helper Resolving Dependencies --&gt; Running transaction check ---&gt; Package php.x86\_64 0:5.3.29-1.8.amzn1 will be installed --&gt; Processing Dependency: php-cli(x86-64) = 5.3.29-1.8.amzn1 for package: php-5.3.29-1.8.amzn1.x86\_64 --&gt; Processing Dependency: php-common(x86-64) = 5.3.29-1.8.amzn1 for package: php-5.3.29-1.8.amzn1.x86\_64 --&gt; Processing Dependency: libgmp.so.3()(64bit) for package: php-5.3.29-1.8.amzn1.x86\_64 ---&gt; Package php-mysql.x86\_64 0:5.3.29-1.8.amzn1 will be installed --&gt; Processing Dependency: php-pdo(x86-64) = 5.3.29-1.8.amzn1 for package: php-mysql-5.3.29-1.8.amzn1.x86\_64 --&gt; Processing Dependency: libmysqlclient.so.18(libmysqlclient\_18)(64bit) for package: php-mysql-5.3.29-1.8.amzn1.x86\_64 --&gt; Processing Dependency: libmysqlclient.so.18(libmysqlclient\_16)(64bit) for package: php-mysql-5.3.29-1.8.amzn1.x86\_64

[ec2-user@ip-10-0-1-184 ~]$ cd /var/www/html/ [ec2-user@ip-10-0-1-184 html]$ ll total 0 [ec2-user@ip-10-0-1-184 html]$ vi index.html [ec2-user@ip-10-0-1-184 html]$ sudo vi index.html [ec2-user@ip-10-0-1-184 html]$ sudo service httpd restart Stopping httpd: [OK] Starting httpd: httpd: apr\_sockaddr\_info\_get() failed for ip-10-0-1-184 httpd: Could not reliably determine the server&#39;s fully qualified domain name, using 127.0.0.1 for ServerName [OK] [ec2-user@ip-10-0-1-184 html]$ curl curl http://10.0.1.184/index.html curl: (6) Could not resolve host: curl

Hi I am server 1

[ec2-user@ip-10-0-1-184 html]$

Result &gt;&gt;&gt;.

[ec2-user@ip-10-0-1-184 ~]$ cd /var/www/html/ [ec2-user@ip-10-0-1-184 html]$ sudo vi index.html [ec2-user@ip-10-0-1-184 html]$ Display all 1861 possibilities? (y or n)^C [ec2-user@ip-10-0-1-184 html]$ curl curl http://10.0.4.160/index.html curl: (6) Could not resolve host: curl

Hi I am server 2

[ec2-user@ip-10-0-1-184 html]$ curl curl http://10.0.3.242/index.html curl: (6) Could not resolve host: curl

Hi I am server 1

[ec2-user@ip-10-0-1-184 html]$

Now we need to create the load balancer in our VPC to server thse two web pages

After attaching load balacer with atleast two subnets

[ec2-user@ip-10-0-1-184 ~]$ curl curl http://10.0.4.160/index.html curl: (6) Could not resolve host: curl

Hi I am server 2

[ec2-user@ip-10-0-1-184 ~]$ curl curl http://10.0.3.242/index.html curl: (6) Could not resolve host: curl

Hi I am server 1

[ec2-user@ip-10-0-1-184 ~]$ curl curl http://10.0.7.48/index.html curl: (6) Could not resolve host: curl

Hi I am server 3



aws elbv2 create-load-balancer --name my-load-balancer

aws elb attach-load-balancer-to-subnets --load-balancer-name my-load-balancer --subnets subnet-0ecac448



[root@ip-10-0-4-7 ~]# history

    1  yum install apache2

    2  cd /etc/yum

    3  ll

    4  cd ..

    5  cd

    6  cd /etc/yum.repos.d/

    7  ll

    8  vim epel.repo

    9  yum install apache2

   10  yum install apache

   11  yum install http

   12  yum install httpd

   13  cd

   14  cd /var/www/html/

   15  ll

   16  vim index.html

   17  /etc/init.d/httpd start

   18  netstat -tulnp | grep 80

   19  ifconfig

   20  yum install elink

   21  curl http://127.0.0.1/index.html

   22  curl http://10.0.4.7/index.html

   23  cd

   24  ifconfig

   25  cd .ssh/

   26  ll

   27  vim authorized\_keys

   28  ssh-keygen

   29  ll

   30  cat id\_rsa.pub

   31  yum install mysql-server

   32  service mysql start

   33  service mysqld start

   34  mysql

   35  yum install php php-mysql php-httpd

   36  yum install php php-mysql

   37  /etc/init.d/httpd restart

   38  php -m

   39  history

   40  w



