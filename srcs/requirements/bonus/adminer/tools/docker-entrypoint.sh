#!/usr/bin/env bash

if [ "$1" = "adminer" ]; then
	mv /adminer_nginx.conf /sites/
	chmod +x /var/www/adminer/index.php
	mkdir -p /var/www/adminer
	mv /index.php /var/www/adminer/
	chown -R www-data:www-data /var/www/adminer
	exit 0
fi

exec "$@"