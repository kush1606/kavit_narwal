#!/bin/bash

#directory=/usr/local/kavit_test2

#if [ ! -d "$directory" ];
#then
#echo "Directory does not exist"
#fi
ls -la /root/kavit 2> /dev/null
if [ $? -eq 2 ]
then
echo "permission denied"
fi

