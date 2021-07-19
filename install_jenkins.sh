#!/bin/bash
sudo yum -y update
sudo yum install -y java-1.8.0
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum -y install jenkins
sudo service jenkins start

