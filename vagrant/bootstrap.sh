#!/bin/bash
PASSWORD='root'
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo apt-get update -y
sudo apt-get install apache2 -y
sudo apt-get install mysql-server php5-mysql -y
sudo mysql_install_db
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt -y
sudo rm -rf /var/www
sudo ln -fs /vagrant /var/www
sudo chmod -R 755 /vagrant
sudo apt-get install phpmyadmin -y
sudo apt-get install git -y
sudo apt-get install vim -y
sudo a2enmod rewrite
sudo service apache2 restart
sudo service mysql restart