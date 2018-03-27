#!/bin/bash
star=$1
linenum=$2
chracter=$3
i=1
if [ $star -eq 1 ]
then
while [ $i -le $linenum ]
do
j=1
while [  $j -le $i ]
do
echo -n "$chracter"
j=`expr $j + 1`
done
echo "\n"
i=`expr $i + 1`
done
fi

#if [ $startype -eq 1 ]
#then
#while [ $i -le $no_of_line ]
#do
#  k=1
#  while [ $k -le $i ]
#  do
#  echo -n "$charcter"
#  k=`expr $k + 1 `
#
#  done
# echo "\n"
# i=` expr $i + 1 `
#
#done
#
#fi
