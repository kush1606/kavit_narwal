#!/bin/bash

path=/root/same_files/

files=`find $path -type f`

#for file in `ls -1 /root/same_files/`
#do
#   echo $file
#   diff /root/same_files/test1.txt $file
#done > output.txt

#cmp --silent /root/same_files/test1.txt /root/same_files/test2.txt


diff /root/same_files/test1.txt /root/same_files/test2.txt >/dev/null
if [  `echo $?` -eq 0 ]
then
   echo Same
rm -rf /root/same_files/test2.txt
ln /root/same_files/test1.txt /root/same_files/test2.txt
else
   echo Different
   #rm -f filename2
fi
