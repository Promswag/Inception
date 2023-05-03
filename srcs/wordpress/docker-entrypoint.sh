#!/usr/bin/env bash

if [ "$1" = 'wordpress' ]; then
#   if [ ! -d "/var/www/html/wordpress" ]; then
#     source setup.sh
	wp core download --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbcharset="utf8" --allow-root
	wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --skip-email --allow-root
	wp user create $USER_NAME $USER_EMAIL --role=author --user_pass=$USER_PASS --allow-root
	wp theme install inspiro --activate --allow-root
#   fi
	exec php-fpm7.4 -F
fi

exec "$@"