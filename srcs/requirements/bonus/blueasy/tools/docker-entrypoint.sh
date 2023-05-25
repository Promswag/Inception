#!/usr/bin/env bash

if [ "$1" = "blueasy" ]; then
	mv /blueasy_nginx.conf /sites/
	chmod -R 775 /blueasy
	mv /blueasy /var/www/
	chown -R www-data:www-data /var/www/blueasy
	exit 0
fi

exec "$@"