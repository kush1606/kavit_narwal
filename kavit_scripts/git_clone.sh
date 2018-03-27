#/bin/bash

repository="https://github.com/kavitnarwal/kavit_narwal.git"

localFolder="/root/kavit/"

git clone $repository" "$localFolder

gitrepo=`cd $localFolder; ls -l`

cd $gitrepo 

git branch > /root/kavit/branch.txt

while read line;
do
git checkout $line
done < /root/kavit/branch.txt
