#5 command line arguments 
#echo $1
#echo $2
#echo $3
#echo $4
#echo $5
##################################################

#print 1st and 5th command line arguments

#echo $1
#echo $5

##################################################

#print "INDIA" if 2nd argument equal to 10 else it will print "india"

#if [ "$2" -eq 10 ]

#then

#echo "INDIA"

#else 

#echo "india"

#fi

##################################################

#print addition of all arguments

#sum=`expr $1 + $2 + $3 + $4 + $5`

#echo $sum

#################################################

#print the table of command line argument if value is less 10

#count=1

#if [ "$1" -lt 10 ]

#then

#while [ $count -le 10 ]

#do

#multi=`expr $1 "*" $count`
#echo $multi
#count=`expr $count + 1`

#done

#else

#while [ $count -le 5 ]

#do

#echo "INDIA"
#count=`expr $count + 1`

#done

#fi

#############################################################


#Make a script and print your name 10 times(use fuction to print your name)

#count=1

#while [ $count -le 10 ]

#do

#echo "Kavit Narwal"

#count=`expr $count + 1`

#done

############################################################

#groupadd zabbix
#useradd -g zabbix zabbix

#cd /opt/
#wget http://freefr.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/3.0.3/zabbix-3.0.3.tar.gz
#tar -zxvf zabbix-3.0.3.tar.gz
#cd /opt/zabbix-3.0.3
#./configure --prefix=/usr/local/zabbix --enable-agent
#make install
#sed -i '/Hostname=Zabbix server/c\Hostname=192.168.22.10-zabbixagent'  /usr/local/zabbix/etc/zabbix_agentd.conf
#sed -i '/Server=127.0.0.1/c\Server=zabbix.opstree.com'  /usr/local/zabbix/etc/zabbix_agentd.conf


#############################################################

#Make a script in which you will pass a git repo path and it will generate a html report of last 5 days commits.


#echo "Please enter git repo path"

#read git_repo

#cd /root/test/

#git init

#git clone $git_repo

#git log --since="5 days"  > test.html






