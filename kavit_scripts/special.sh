#!/bin/bash

dir=`find /root/test -type d -name "*[!@#$%&*()_+^]*"`
#echo $dir
rm -rf "$dir"
