#!/bin/bash
  yum update -y
  yum install httpd -y
  service httpd start
  cd /var/www/html
  echo "<html><h1>Welcome to TSC Cloud 02 !</h1></html>" >index.html