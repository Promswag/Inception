#!/usr/bin/env bash

if [ "$1" = "goaccess" ]; then
	mv /goaccess_nginx.conf /sites/
	mkdir /var/www/goaccess
	touch /var/www/goaccess/index.html
	chown -R www-data:www-data /var/www/goaccess
	croncmd="goaccess /var/log/nginx/access.log -o /var/www/goaccess/index.html --log-format=COMBINED"
	cronjob="* * * * * $croncmd"
	( crontab -l | grep -v -F "$croncmd" ; echo "$cronjob" ) | crontab -
	service cron restart
	tail -f /dev/null
	exit 0
fi

exec "$@"