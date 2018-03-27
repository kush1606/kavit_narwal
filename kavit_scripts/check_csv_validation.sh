#!/bin/bash

kavit=`cat /var/sftp/files/kavit_7.csv | grep kavit | wc -l`
rachit=`cat /var/sftp/files/rachit_10.csv | grep rachit | wc -l`
rajat=`cat /var/sftp/files/rajat_5.csv | grep rajat | wc -l`
sandeep=`cat /var/sftp/files/sandeep_12.csv | grep sandeep | wc -l`
tejas=`cat /var/sftp/files/tejas_3.csv | grep tejas | wc -l`
yogesh=`cat /var/sftp/files/yogesh_10.csv | grep yogesh | wc -l`
if [ $kavit -eq 7 ]
then
cp /var/sftp/files/kavit_7.csv /var/sftp/success/
else
echo "Validation failed"
cp /var/sftp/files/kavit_7.csv /var/sftp/fails/
fi
if [ $rachit -eq 10 ]
then
cp /var/sftp/files/rachit_10.csv /var/sftp/success/
else
echo "Validation failed"
cp /var/sftp/files/rachit_10.csv /var/sftp/fails/
fi
if [ $rajat -eq 5 ]
then
cp /var/sftp/files/rajat_5.csv /var/sftp/success/
else
echo "Validation failed"
cp /var/sftp/files/rajat_5.csv /var/sftp/fails/
fi
if [ $sandeep -eq 12 ]
then
cp /var/sftp/files/sandeep_12.csv /var/sftp/success/
else
echo "Validation failed"
cp /var/sftp/files/sandeep_12.csv /var/sftp/fails/
fi
if [ $tejas -eq 3 ]
then
cp /var/sftp/files/tejas_3.csv /var/sftp/success/
else
echo "Validation failed"
cp /var/sftp/files/tejas_3.csv /var/sftp/fails/
fi
if [ $yogesh -eq 3 ]
then
cp /var/sftp/files/yogesh_10.csv /var/sftp/success/
else
echo "Validation failed"
cp /var/sftp/files/yogesh_10.csv /var/sftp/fails/
fi







