#!/bin/bash

#echo "install gcc and librarys for apache by using yum"

#yum install gcc* lib*  --skip-broken -y

#echo "Download and install apr-1.4.6 for apache "

#cd /opt/

#wget http://www-eu.apache.org/dist//apr/apr-1.6.3.tar.gz

#tar -xvzf apr-1.6.3.tar.gz

#cd /opt/apr-1.6.3

#./configure --prefix=/usr/local/apr-1.6.3
#make
#make install

#echo "apr installation done"

#echo "start apr utils installation"

#cd /opt/

#wget http://www-us.apache.org/dist//apr/apr-util-1.6.1.tar.gz

#tar -xvzf apr-util-1.6.1.tar.gz

#cd /opt/apr-util-1.6.1

#./configure --prefix=/usr/local/apr-util-1.6.1 --with-apr=/usr/local/apr-1.6.3/

#make

#make install

#echo "apr-utils installation done"


#echo "start pcre installation "


#cd /opt

#wget https://sourceforge.net/projects/pcre/files/pcre/8.40/pcre-8.40.tar.gz

#tar -xvzf pcre-8.40.tar.gz

#cd /opt/pcre-8.40

#./configure --prefix=/usr/local/pcre-8.40
#make
#make install

#echo "pcre installation done"

#echo "start apache installation on linux server"

#cd /opt/

#wget https://archive.apache.org/dist/httpd/httpd-2.4.6.tar.bz2

#tar xjvf httpd-2.4.6.tar.bz2

#cd /opt/httpd-2.4.6

#./configure --prefix=/usr/local/apache-2.4.6 --enable-so --enable-rewrite --enable-unique-id --with-apr=/usr/local/apr-1.6.3 --with-apr-util=/usr/local/apr-util-1.6.1 --with-pcre=/usr/local/pcre-8.40 --with-mpm=prefork

#make

#make install

#echo "apache installation done on server"


#echo "start nginx installation "

#cd /opt/

#wget http://nginx.org/download/nginx-1.13.8.tar.gz

#tar -xvzf nginx-1.13.8.tar.gz

cd /opt/nginx-1.13.8

#./configure --prefix=/usr/local/nginx-1.13.8

make

make install

echo "nginx installation done"
