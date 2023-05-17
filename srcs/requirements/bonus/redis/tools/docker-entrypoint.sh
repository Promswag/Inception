#!/usr/bin/env bash

if [ "$1" = '_start' ]; then
	redis-server
fi

exec "$@"