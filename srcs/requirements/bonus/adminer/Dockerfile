FROM debian:buster

RUN \
	apt-get update \
	&& apt-get install -y wget

COPY tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["adminer"]