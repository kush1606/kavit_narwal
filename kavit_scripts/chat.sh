#!/bin/bash

lastmailid=`cat --number  /root/scripts/mail.log | awk '{ print $1 " " $2 }' | tail -1`

cat --number chat.log | grep -o '@[a-zA-Z]*' | awk -F@ '{ print $2 }' > mail.log

grep -o $lastmailid mail.log


#while read line

#do 

#mailid=`grep  $line mailid.txt`

#if [ -z "$mailid" ] ;
#then
#echo $maild
#else 
#mail -s "hello" $mailid <<EOF
#hello
#$mailid
#EOF
#fi
#done < mail.log



