#!/bin/bash

if [ ! -f "/var/www/html/wordpress/index.php" ]; then
	wp core download --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbcharset="utf8" --allow-root
	wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --skip-email --allow-root
	wp user create $USER $USER_EMAIL --role=author --user_pass=$USER_PASSWORD --allow-root
	wp theme install inspiro --activate --allow-root
fi

exec php-fpm7.4 -F