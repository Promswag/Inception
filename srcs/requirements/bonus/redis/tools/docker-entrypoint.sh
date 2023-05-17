#!/usr/bin/env bash

if [ "$1" = '_start' ]; then
	sed -i "s/REDIS_PASS/$REDIS_PASS/" /etc/redis/redis.conf
	redis-server
fi

exec "$@"