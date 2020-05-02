#!/bin/bash

# Update Package Index
sudo apt update

# Installer Apache2, MySQL, PHP
sudo apt install apache2 mysql-server php php-mysql libapache2-mod-php php-cli

# Allow to run Apache on boot up
sudo systemctl enable apache2

# Restart Apache Web Server
sudo systemctl start apache2

# Allow Read/Write for Owner
#sudo chmod -R 0755 /var/www/html/

# Create info.php for testing php processing
#sudo echo "<?php phpinfo(); ?>" >> /var/www/html/info.php
#sudo nano /var/www/html/info.php
#sudo cp -r ProjetPart1LAMP/ /var/www/html/
#scp -r ProjetPart1LAMP/ useradm@192.168.56.20:/home/useradm

# Open localhost in the default browser
xdg-open "http://localhost/ProjetPart1LAMP/info.php"

