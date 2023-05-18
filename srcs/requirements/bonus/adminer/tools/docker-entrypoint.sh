#!/usr/bin/env bash

if [ "$1" = "adminer" ]; then
	wget -O /adminer/adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
	exit 0
fi

exec "$@"