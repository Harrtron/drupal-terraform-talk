#!/bin/bash
# Install dependencies
yum install git -y
amazon-linux-extras install -y php7.2
yum install php-xml -y
yum install php-gd -y
yum install httpd -y

# Install Drupal
wget https://ftp.drupal.org/files/projects/drupal-8.0.2.tar.gz
ls -l drupal-8.0.2.tar.gz
tar -zxpvf drupal-8.0.2.tar.gz
mv drupal-8.0.2 /var/www/html/drupal
chown -R apache:apache /var/www/html/drupal/
cd /var/www/html/drupal/sites/default
cp -p default.settings.php settings.php
chcon -R -t httpd_sys_content_rw_t /var/www/html/drupal/

# Start it up!
service httpd start