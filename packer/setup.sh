#!/bin/bash


echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
echo "LANG=en_US.utf-8" >> /etc/environment
echo "LC_ALL=en_US.utf-8" >> /etc/environment
systemctl restart sshd.service


yum install httpd php -y

cp -r /tmp/website/* /var/www/html/
chown -R apache:apache /var/www/html

systemctl restart httpd.service php-fpm.service
systemctl enable httpd.service php-fpm.service
