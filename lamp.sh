#!/bin/bash

# Update Package Index
sudo apt update

# Installer Apache2, MySQL, PHP
sudo apt install apache2 mysql-server php php-mysql libapache2-mod-php php-cli

# Restart Apache Web Server
sudo systemctl start apache2

#create database and user
sudo << EOF
create user imen identified by 'imen';
create database demo;
grant all privileges on demo to imen with grant option;
EOF

#sudo nano /var/www/html/info.php
#sudo cp -r ProjetPart1LAMP/ /var/www/html/
#scp -r ProjetPart1LAMP/ useradm@192.168.56.20:/home/useradm

# Open localhost in the default browser
xdg-open "http://localhost/ProjetPart1LAMP/info.php"

