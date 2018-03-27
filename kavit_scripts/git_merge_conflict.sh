#!/bin/bash
mkdir /merge
cd /merge
git init
touch mycode.sh
git add mycode.sh
echo " Hello Kavit" > mycode.sh
git commit -am 'Added Hello kavit in mycode.sh '
git checkout -b newbranch
echo "echo \"Hello World\"" > mycode.sh
git commit -am 'first commit on newbranch'
git checkout master
echo "echo \"Hello World!\"" > mycode.sh
git commit -am 'second commit on master'
git merge newbranch
