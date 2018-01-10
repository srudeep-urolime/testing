#!/bin/bash
echo "Enter the location of log file"
read FILE
cd $FILE
if [ -z $1 ]; then
echo "Enter the day to be monitored (00-30)"
read a; else
a=$1
fi
if [ -z $2 ]; then
echo "Enter the starting time to be minitored (00-23)"
read b; else
b=$1
fi
if [ -z $3 ]; then
echo "Enter the ending time to be monitored (00-23)"
read c; else
c=$1
fi
rm -rf allinone
rm -rf sorted
cat 44* >> allinone
echo "##################################################################################################################################################"
echo "Total hits"
echo "##################################################################################################################################################"
for i in $(seq -w $b $c); do    grep 2018-01-"$a"T$i:  allinone|wc -l; done
echo "##################################################################################################################################################"
echo "Total 5xx"
echo "##################################################################################################################################################"
for i in $(seq -w $b $c); do    grep 2018-01-"$a"T$i:  allinone|grep "500\ 500" |wc -l; done
for i in $(seq -w $b $c); do    grep 2018-01-"$a"T$i:  allinone|grep -v "200\ 200" ; done >> sorted
echo "##################################################################################################################################################"
echo "Total others"
echo "##################################################################################################################################################"
for i in $(seq -w $b $c); do    grep 2018-01-"$a"T$i:  sorted|grep -v "500\ 500" |wc -l; done
rm -rf allinone
rm -rf sorted

