#!/bin/sh
#
# deploy tomcat
# @Author:  Zhoufan
# @date:    2015/08/01
#

echo "Build Begin"

_TOMCAT_PID=$( ps aux | grep tomcat.*node6 | grep -v grep | awk '{print $2}' )

_START=/usr/local/tomcat/tomcat-7.0.59-node6/bin/startup.sh

echo "Get Tomcat PID: " $_TOMCAT_PID

if [[ $_TOMCAT_PID ]]   # if PID exists 
then
  echo "PID exists"
  echo "Kill ing... "
  kill -9 $_TOMCAT_PID
  sleep 3
else 
  echo "PID is not exists, ready for start."
fi

echo "start ing..."
$_START
sleep 2

echo -e "\n\nBuild End"
echo "Finsh!"
