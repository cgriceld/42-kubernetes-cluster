#!/bin/bash

openrc default
/etc/init.d/mariadb setup
rc-service mariadb start

echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'admin1'@'%' IDENTIFIED BY 'root';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin1'@'%' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
mysql -u root wordpress < wordpress.sql

rc-service mariadb stop

supervisord -c /etc/supervisord.conf