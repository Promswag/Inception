#!/usr/bin/env bash

if [ "$1" = 'nginx' ]; then
  # if [ ! -f "/etc/nginx/sites-available/adminer_nginx.conf" ]; then
  mv /adminer/adminer_nginx.conf /etc/nginx/sites-available/adminer_nginx.conf
  ln -s /etc/nginx/sites-available/adminer_nginx.conf /etc/nginx/sites-enabled/
  chown -R www-data:www-data /adminer
  # fi
  exec nginx -g "daemon off;"
fi

exec "$@"