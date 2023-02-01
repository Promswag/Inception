#!/usr/bin/env bash

do_query() {
  mariadb --protocol=socket -uroot -hlocalhost  <<< "$@"
}

if [ "$1" = 'mariadb' ]; then
  if [ ! -f ".mariadb" ]; then
    # init mariadb datadir
    mysql_install_db --rpm --auth-root-authentication-method=normal

    # start temporary server for bootstrapping
    mysqld --skip-networking --default-time-zone=SYSTEM --wsrep_on=OFF --expire-logs-days=0 --loose-innodb_buffer_pool_load_at_startup=0 &

    # wait for server to start
    while ! mysqladmin ping --silent; do
        sleep 1
    done

    # change root password
    do_query "SET PASSWORD FOR 'root'@'%' = PASSWORD('$MARIADB_ROOT_PASSWORD');"

    # delete remote root user
    do_query "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

    # delete anonymous users
    do_query "DELETE FROM mysql.user WHERE User='';"

    # # drop test database
    do_query "DROP DATABASE IF EXISTS test;"
    do_query "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"

    # create wordpress database
    do_query "CREATE DATABASE IF NOT EXISTS wordpress;"

    # create wordpress user
    do_query "CREATE USER 'wordpress' IDENTIFIED BY '$MARIADB_WORDPRESS_PASSWORD';"
    do_query "GRANT ALL ON wordpress.* TO 'wordpress' ;"

    # apply changes
    do_query "FLUSH PRIVILEGES;"

    # stop temporary server
    MYSQL_PWD=$MARIADB_ROOT_PASSWORD mysqladmin shutdown -uroot

    touch .mariadb
  fi

  exec mysqld
fi

exec "$@"