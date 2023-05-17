#!/usr/bin/env bash

if [ "$1" = '_start' ]; then
	wp core download --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbcharset="utf8" --allow-root
	wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --skip-email --allow-root
	wp user create $USER_USER $USER_EMAIL --role=author --user_pass=$USER_PASS --allow-root
	wp theme install inspiro --activate --allow-root

	wp config set WP_REDIS_CLIENT phpredis
	wp config set WP_REDIS_SCHEME tcp
	wp config set WP_REDIS_HOST $REDIS_HOST
	wp config set WP_REDIS_PORT $REDIS_PORT
	wp config set WP_REDIS_PASSWORD $REDIS_PASS
	wp plugin install redis-cache --activate
	wp redis enable
	exec php-fpm7.4 -F
fi

exec "$@"