#!/usr/bin/env bash

if [ "$1" = "adminer" ]; then
	wget -O /adminer/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
	chmod +x /adminer/index.php
	chown -R www-data:www-data /adminer
	exit 0
fi

exec "$@"