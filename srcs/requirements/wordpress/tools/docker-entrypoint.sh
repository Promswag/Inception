#!/usr/bin/env bash

if [ "$1" = 'wordpress' ]; then
	wp core download --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbcharset="utf8" --allow-root
	wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --skip-email --allow-root
	wp user create $USER_USER $USER_EMAIL --role=author --user_pass=$USER_PASS --allow-root
	wp theme install inspiro --activate --allow-root

	wp config set WP_REDIS_CLIENT phpredis --allow-root
	wp config set WP_REDIS_SCHEME tcp --allow-root
	wp config set WP_REDIS_HOST $REDIS_HOST --allow-root
	wp config set WP_REDIS_PORT $REDIS_PORT --allow-root
	wp config set WP_REDIS_PASSWORD $REDIS_PASS --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp redis enable --allow-root
	chown -R www-data:www-data /var/www/html
	exec php-fpm7.4 -F
fi

exec "$@"