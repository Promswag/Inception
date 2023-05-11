FROM debian:bullseye

RUN \
	apt-get update \
	&& apt-get install -y mariadb-server \
	&& mkdir /var/run/mysqld \
  	&& chown -R mysql:mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

COPY healthcheck.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/healthcheck.sh

COPY --chown=myslq server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mariadb"]