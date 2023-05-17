#!/usr/bin/env bash

MYSQL_PWD=$DB_PASS mysqladmin ping --silent -uwordpress -hmariadb --protocol=tcp --port=3306

exit $?