#!/usr/bin/env bash

if [ "$1" = 'nginx' ]; then
  ln -s /sites/*.conf /etc/nginx/sites-available/
  ln -s /sites/*.conf /etc/nginx/sites-enabled/
  exec nginx -g "daemon off;"
fi

exec "$@"