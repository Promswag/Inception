#!/usr/bin/env bash

if [ "$1" = 'nginx' ]; then
  # mv /sites/*.conf /etc/nginx/sites-available/
  # ln -s /etc/nginx/sites-available/*.conf /etc/nginx/sites-enabled/
  # chown -R www-data:www-data /adminer
  ln -s /sites/*.conf /etc/nginx/sites-available/
  ln -s /sites/*.conf /etc/nginx/sites-enabled/
  exec nginx -g "daemon off;"
fi

exec "$@"