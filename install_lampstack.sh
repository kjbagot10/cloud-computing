#!/bin/bash

#installing the microsoft ODBC driver

# https://learn.microsoft.com/en-us/sql/connect/php/installation-tutorial-linux-mac?view=sql-server-ver16#testing-your-installation
# isntall php
sudo su
add-apt-repository ppa:ondrej/php -y
apt-get update
apt-get install php8.3 php8.3-dev php8.3-xml -y --allow-unauthenticated

# install prequisites
sudo apt-get install unixodbc-dev
sudo pecl install sqlsrv
sudo pecl install pdo_sqlsrv
sudo su
printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/8.3/mods-available/sqlsrv.ini
printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/8.3/mods-available/pdo_sqlsrv.ini
exit
sudo phpenmod -v 8.1 sqlsrv pdo_sqlsrv

# install php drivers for microsoft sql server
sudo pecl install sqlsrv
sudo pecl install pdo_sqlsrv
sudo su
printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/8.3/mods-available/sqlsrv.ini
printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/8.3/mods-available/pdo_sqlsrv.ini
exit
sudo phpenmod -v 8.3 sqlsrv pdo_sqlsrv

# install apache
sudo su
apt-get install libapache2-mod-php8.3 apache2
a2dismod mpm_event
a2enmod mpm_prefork
a2enmod php8.3
exit

sudo service apache2 restart
