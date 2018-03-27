#!/bin/bash


#echo "Please enter your email id or name "

#read name


#if grep $name /root/kavit_scripts/student_mail_id.txt >> /dev/null; then

#echo  "$name is present" >> present.txt

#elif  [ $name == "finished_users" ] 

#then

#echo "..............finished users............."

#echo "Below mention members are present today"
#cat /root/kavit_scripts/present.txt

#else

#echo "$name is not in list" 

#fi


echo "Please enter your name"
read name 
while [ -z  "$name" ]
do
if  [ -z "$name" ] ; 
then
echo "Please enter your name"
read name
fi
done  
echo \n $name > /root/kavit_scripts/test.txt
