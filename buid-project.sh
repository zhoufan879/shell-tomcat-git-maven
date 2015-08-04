#!/bin/sh
#
####################################################################
# Before the shell,you need to run this:                           #
#                                                                  #
# >cd /usr/local/workspace                                         #
# >git clone -b dev git@idcwxtest.dafysz.cn:root/mobile-biz.git    #
#                                                                  #
####################################################################

echo "======== Are you Ready?  =========="

_GIT_SHELL=git pull git@idcwxtest.dafysz.cn:root/mobile-biz.git dev

_PRO_NAME=mobile-biz

_TOMCAT_NAME=tomcat-7.0.59-node6

_WAR_NAME=${_PRO_NAME}.war
_TOMCAT_HOME=/usr/local/tomcat/${_TOMCAT_NAME}
_TOMCAT_WEBAPPS_PRO=${_TOMCAT_HOME}/webapps/${_PRO_NAME}
_TOMCAT_WEBAPPS_WAR=${_TOMCAT_HOME}/webapps/${_WAR_NAME}
_TOMCAT_START=${_TOMCAT_HOME}/bin/startup.sh
_TOMCAT_PID=$( ps aux | grep ${_TOMCAT_NAME} | grep -v grep | awk '{print $2}' )

_MAVEN_REPO_WAR=/usr/local/workspace/target/${_WAR_NAME}

_WAR_HIS=/usr/local/war/${_WAR_NAME}

_DATE=$(date +"%Y%m%d")    # 20150802
_TIME=$(date +"%H%M%S")    # 095501

cd /usr/local/workspace

echo "======== 1. <pull> from Git  =========="
${_GIT_SHELL}
sleep 1

echo "======== 2. <clean install> By Maven  =========="
mvn clean install

echo "======== 3. <kill tomcat> shutting down the tomcat  =========="
echo "Get Tomcat PID: " $_TOMCAT_PID

if [[ ${_TOMCAT_PID} ]]   # if PID exists 
then
  echo "PID exists"
  echo "Kill ing... "
  kill -9 ${_TOMCAT_PID}
  sleep 3
else 
  echo "PID is not exists, ready for start."
fi

echo "======== 4. <backup war> move war file to History/  =========="
mv -f ${_TOMCAT_WEBAPPS_WAR} ${_WAR_HIS}.${_DATE}.${_TIME}

echo "======== 5. <deploy new-war> add *.war to /webapps  =========="
cp ${_MAVEN_REPO_WAR} ${_TOMCAT_WEBAPPS_WAR}
rm -rf ${_TOMCAT_WEBAPPS_PRO}

echo "======== 6. <starting tomcat> startup.sh  =========="
${_TOMCAT_START}
sleep 3

echo -e "\n\nBuild Complete."
echo "  ^_^  "
echo ""

