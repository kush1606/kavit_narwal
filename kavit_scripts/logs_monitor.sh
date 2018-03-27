#!/bin/bash
# tail -10 /usr/local/apache-2.4.6/logs/access_log > /usr/local/apache-2.4.6/logs/access_latest_log.txt
#if 

#cmp -s /usr/local/apache-2.4.6/logs/access_latest_log.txt /usr/local/apache-2.4.6/logs/access_old_log.txt

#then

#cat /usr/local/apache-2.4.6/logs/access_latest_log.txt | mail -s "New access logs for apache " kavit.narwal@paytm.com

#cp /usr/local/apache-2.4.6/logs/access_latest_log.txt /usr/local/apache-2.4.6/logs/access_old_log.txt 

#fi

#if 


#cat /root/logs/log.txt | grep "GET" >> /root/logs/log2.txt

#output=`tail -1 /root/logs/log2.txt | awk '{ print $4 }'`

output=`tail -1 /root/logs/log2.txt | awk '{ print $4 }' | cut -d '[' -f2`

linenumber=`cat --number /root/logs/log.txt | grep $output | awk '{ print $1 }'`

tail -n +$linenumber /root/logs/log.txt >> /root/logs/log2.txt 

#if 

#grep $output = 

#I have 2 files and I want to print the records which are common to both.

#We can use “comm” command as follows:

#comm -12 file1 file2               … 12 will suppress the content which are

#unique to 1st and 2nd  file respectively.


 
