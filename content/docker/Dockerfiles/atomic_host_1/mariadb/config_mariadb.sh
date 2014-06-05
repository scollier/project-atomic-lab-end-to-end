#!/bin/bash

__mysql_config() {
mysql_install_db
mkdir -vp /var/run/mariadb
chown -vR mysql:mysql /var/run/mariadb/
chown -R mysql:mysql /var/lib/mysql/
chown -R mysql:mysql /var/log/mariadb/
cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
sleep 10

echo "Running the start_mysql function."
mysqladmin -u root password mysqlPassword
mysql -uroot -pmysqlPassword -e "UPDATE mysql.user SET Password=PASSWORD('mysqlPassword') WHERE User='root'; FLUSH PRIVILEGES;"
mysql -uroot -pmysqlPassword -e "GRANT ALL PRIVILEGES ON testdb.* TO 'testdb'@'localhost' IDENTIFIED BY 'mysqlPassword'; FLUSH PRIVILEGES;"
mysql -uroot -pmysqlPassword -e "GRANT ALL PRIVILEGES ON *.* TO 'testdb'@'%' IDENTIFIED BY 'mysqlPassword' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -uroot -pmysqlPassword -e "delete from user where user=''";
mysql -uroot -pmysqlPassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'mysqlPassword' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -uroot -pmysqlPassword -e "select user, host FROM mysql.user WHERE Host <> 'localhost';"
sleep 10
killall mysqld
rm -f /var/lib/mysql/mysql.lock
exec /usr/libexec/mysqld
}

# Call all functions
__mysql_config
