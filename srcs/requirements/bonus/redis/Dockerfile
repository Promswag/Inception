FROM debian:buster

RUN \
	apt-get update \
	&& apt-get install -y redis-server 


COPY tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY tools/healthcheck.sh /usr/local/bin/healthcheck.sh
# COPY --chown=redis conf/redis.conf /etc/redis/redis.conf
# CMD ["redis-server", "/etc/redis/redis.conf"]
# EXPOSE 6379

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["_start"]