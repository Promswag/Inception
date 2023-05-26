#!/usr/bin/env bash

if [ "$1" = "goaccess" ]; then
	mv /goaccess_nginx.conf /sites/
	mkdir /var/www/goaccess
	# touch /var/www/goaccess/index.html
	chown -R www-data:www-data /var/www/goaccess
	exec goaccess /var/log/nginx/access.log -o /var/www/goaccess/index.html
fi

exec "$@"