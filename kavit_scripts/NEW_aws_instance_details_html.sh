#!/bin/bash

echo "<html>
<table border=1 frame=void rules=rows>
<tr>
<th>instance_ids</th>
</tr>" > aws_instance.html
file=/root/kavit_scripts/output_stopped_instances.txt

while  read -r line;
do
echo "<tr>
<td>$line</td>
</tr>" >> aws_instance.html
done <$file
echo "</table>
</html>" >> aws_instance.html






