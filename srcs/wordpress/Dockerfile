FROM debian:bullseye

RUN \
	apt-get update \
	&& apt-get install -y \
		curl \
		php7.4 \
		php7.4-mysql \
		php7.4-fpm \
		php7.4-gd \
		php7.4-mbstring \
		php7.4-zip \
		mariadb-client

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY setup.sh /usr/local/bin/
COPY php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY docker-entrypoint.sh /usr/local/bin/

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

ENTRYPOINT ["docker-entrypoint.sh"]

WORKDIR "/var/www/html"

CMD ["wordpress"]