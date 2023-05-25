FROM debian:bullseye

RUN \
	apt-get update \
	&& apt-get install -y nginx

COPY tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY gbaumgar.42.fr.crt /etc/nginx/gbaumgar.42.fr.crt
COPY gbaumgar.42.fr.key /etc/nginx/gbaumgar.42.fr.key
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["nginx"]