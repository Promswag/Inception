FROM debian:bullseye

RUN \
	apt-get update \
	&& apt-get install -y nginx

COPY tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/gbaumgar_nginx.conf /etc/nginx/sites-available/gbaumgar_nginx.conf
COPY gbaumgar.42.fr.crt /etc/nginx/gbaumgar.42.fr.crt
COPY gbaumgar.42.fr.key /etc/nginx/gbaumgar.42.fr.key

RUN ln -s /etc/nginx/sites-available/gbaumgar_nginx.conf /etc/nginx/sites-enabled/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["nginx"]