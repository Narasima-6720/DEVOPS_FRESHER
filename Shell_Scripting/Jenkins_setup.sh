#!/bin/bash

#########################
# Author: Narasimha Reddy
# Date : 6/4/25
# Description: This script will install jenkins and return password
# Version : v1
#########################

sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo mount -o remount,size=4G /tmp/
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
