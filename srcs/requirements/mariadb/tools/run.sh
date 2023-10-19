#!/bin/bash
if [ $(ls /var/lib/mysql | grep "${MYSQL_DB}" | wc -l)  -eq 0 ];
then
# Start the MariaDB server
service mysql start

# Wait for MariaDB to be ready
echo "Waiting for MariaDB to start..."
sleep 30

# Exit if any command fails
set -e

# Run the initialization script
sudo mysql -uroot -p${MYSQL_ROOT_PASS} -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASS}' WITH GRANT OPTION;"
sudo mysql -uroot -p${MYSQL_ROOT_PASS} -e "FLUSH PRIVILEGES;"
sudo mysql -uroot -p${MYSQL_ROOT_PASS} -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB};" || { echo 'Failed to create database'; exit 1; }
sudo mysql -uroot -p${MYSQL_ROOT_PASS} -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';" || { echo 'Failed to create user'; exit 1; }
sudo mysql -uroot -p${MYSQL_ROOT_PASS} -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USER}'@'%';" || { echo 'Failed to grant privileges'; exit 1; }
sudo mysql -uroot -p${MYSQL_ROOT_PASS} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';" || { echo 'Failed to alter root user'; exit 1; }
sudo mysql -uroot -p${MYSQL_ROOT_PASS} -e "FLUSH PRIVILEGES;" || { echo 'Failed to flush privileges'; exit 1; }
mysqladmin -uroot -p${MYSQL_ROOT_PASS} shutdown || { echo 'Failed to shutdown MariaDB'; exit 1; }
fi
# Keep the container running
/usr/bin/mysqld_safe