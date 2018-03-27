#!/bin/bash

path=/root/kavit_scripts/user.txt

while read line;
do
echo "$line;" >> update_user.txt 
done <$path

paste - - - < update_user.txt >> update_colum_user.txt

