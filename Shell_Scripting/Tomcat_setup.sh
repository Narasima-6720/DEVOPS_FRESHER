#!/bin/bash

#Author: Narasimha Reddy
#Description: This script is used to setup Tomcat
#version: v1
##########################
sudo yum install java -y

wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.102/bin/apache-tomcat-9.0.102.tar.gz

tar -xvf apache-tomcat-9.0.102.tar.gz

rm -rf apache-tomcat-9.0.102.tar.gz

sudo /opt/apache-tomcat-9.0.102/bin/startup.sh



