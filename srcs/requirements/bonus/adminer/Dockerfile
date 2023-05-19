FROM debian:buster

RUN \
	apt-get update \
	&& apt-get install -y wget

COPY tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY conf/adminer_nginx.conf /adminer/adminer_nginx.conf

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["adminer"]