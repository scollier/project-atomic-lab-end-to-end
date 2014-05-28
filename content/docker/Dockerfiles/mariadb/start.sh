#!/bin/bash -x

__mysql_config() {

if [ ! -f /mariadb/db/ibdata1 ]; then
  echo
  echo "Database does not exist, creating now."
  echo
  sleep 2
  mysql_install_db
  chown -R mysql:mysql /var/lib/mysql
  /usr/bin/mysqld_safe & 
  sleep 10

  echo "Running the start_mysql function."
  mysqladmin -u root password mysqlPassword
  mysql -uroot -pmysqlPassword -e "CREATE DATABASE testdb"
  mysql -uroot -pmysqlPassword -e "GRANT ALL PRIVILEGES ON testdb.* TO 'testdb'@'localhost' IDENTIFIED BY 'mysqlPassword'; FLUSH PRIVILEGES;"
  mysql -uroot -pmysqlPassword -e "GRANT ALL PRIVILEGES ON *.* TO 'testdb'@'%' IDENTIFIED BY 'mysqlPassword' WITH GRANT OPTION; FLUSH PRIVILEGES;"
  mysql -uroot -pmysqlPassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'mysqlPassword' WITH GRANT OPTION; FLUSH PRIVILEGES;"
  mysql -uroot -pmysqlPassword -e "select user, host FROM mysql.user;"
  killall mysqld
  sleep 10
fi
}

__run_supervisor() {
echo "Running the run_supervisor function."
supervisord -n
}

# Call all functions
__mysql_config
__run_supervisor
