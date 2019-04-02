#!/bin/bash
# Install dependencies
yum update -y
yum install git -y
amazon-linux-extras install -y php7.2
yum install php-xml -y
yum install php-gd -y
yum install httpd -y

# Start it up!
service httpd start