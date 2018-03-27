#!/bin/bash
echo "Please enter VPC id"

read VPC

instance_ids=`aws ec2 describe-instances --filters "Name=vpc-id,Values=$VPC" | grep InstanceId | awk '{ print $2 }' | tr -d '",' > /root/kavit_scripts/instance_ids.txt`

file=/root/kavit_scripts/instance_ids.txt

while read line;
do
aws ec2 describe-instances --filters "Name=instance-id,Values=$line" --query 'Reservations[*].Instances[*].Tags[?Key==`Name`].Value' --output text >> /root/kavit_scripts/name_value.txt
aws ec2 describe-instances --filters "Name=instance-id,Values=$line" --query 'Reservations[*].Instances[*].Tags[?Key==`Class`].Value' --output text >> /root/kavit_scripts/class_value.txt
done <$file

echo "<html>
<table border=1 frame=void rules=rows>
<tr>
<th>instance_ids</th>
<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name</th>
<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Class</th>
</tr>" > aws_instance.html
#</table>
#</html>
file_one=/root/kavit_scripts/instance_ids.txt
file_two=/root/kavit_scripts/name_value.txt
file_three=/root/kavit_scripts/class_value.txt

exec 3<$file_one
exec 4<$file_two
exec 5<$file_three

while  read -r line1 <&3
       read -r line2 <&4
       read -r line3 <&5
do
echo "<tr>
<td>$line1<td>
<td>$line2<td>
<td>$line3</td>
</tr>" >> aws_instance.html
done

#file=/root/kavit_scripts/name_value.txt
#while read line;
#do
#echo "<tr>
#<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$line</td>
#</tr>" >> aws_instance.html
#done <$file


#file=/root/kavit_scripts/class_value.txt
#while read line;
#do
#echo "<tr>
#<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$line</td>
#</tr>" >> aws_instance.html
#done <$file
echo "</table>
</html>" >> aws_instance.html






