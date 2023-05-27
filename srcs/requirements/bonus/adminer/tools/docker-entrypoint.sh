#!/usr/bin/env bash

if [ "$1" = "adminer" ]; then
	mv /adminer_nginx.conf /sites/
	mkdir -p /var/www/adminer
	mv /index.php /var/www/adminer/
	chmod +x /var/www/adminer/index.php
	chown -R www-data:www-data /var/www/adminer
	exit 0
fi

exec "$@"