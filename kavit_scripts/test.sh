#!/bin/bash
#if $# -eq 0
#then
#echo "fail"
#echo "hello "$1

#var="Kavit"
#var2="Narwal"
#if [ $var = "Kavit" ]
#then
#echo "pass"

#elif [ $var2 = "Narwal" ] 
#then
#echo "its narwal"

#else

#echo "fail"

#fi

#var1=2
#var2=5

#sum=`expr $var1 + $var2`


#echo $sum

#how to add 10 user in linux

#path="path of user files"

#while read line

#do 

#useradd $line

#done < $path ##jb tak file ka contant khtm na hojaye tab tak while loop chlega


#a=0

#while [ $a -lt 10 ]
#do
#   echo $a
#   a=`expr $a + 1`
#done

a="/root/scripts/user.txt"

while read user

do
echo $user >>user2.txt

done < $a





