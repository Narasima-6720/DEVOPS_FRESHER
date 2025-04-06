#!/bin/bash

#Author: Narasimha Reddy
#Description: This script is used to setup Tomcat
#version: v1
##########################
sudo yum install java -y
cd /opt/
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.102/bin/apache-tomcat-9.0.102.tar.gz
sudo tar -xvf apache-tomcat-9.0.102.tar.gz
sudo rm -rf apache-tomcat-9.0.102.tar.gz
cd /opt/apache-tomcat-9.0.102/webapps/manager/META_INF
sudo sed -i 's/127\\.\\d+\\.\\d+\\.\\d+|::1|0:0:0:0:0:0:0:1"/".*/g' context.xml
cd /opt/apache-tomcat-9.0.102/conf
sudo mv tomcat-users.xml tomcat-users-bkp-2025.xml
sudo echo '<?xml version="1.0" encoding="utf-8"?>
      <tomcat-users>
      <role rolename="manager-gui"/>
      <user username="tomcat" password="tomcat" roles="manager-gui, manager-script, manager-status"/>
      </tomcat-users>' > tomcat-users.xml
cd  apache-tomcat-9.0.102/conf/
sudo sed -i 's/Connector port="8080"/Connector port="8081"/g' server.xml
sudo /opt/apache-tomcat-9.0.102/bin/startup.sh







