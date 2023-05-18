#!/usr/bin/env bash

REDISCLI_AUTH=$REDIS_PASS redis-cli -h redis ping

exit $?