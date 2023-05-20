FROM debian:buster

RUN \
	apt-get update \
	&& apt-get install -y vsftpd \
	&& apt-get install -y ftp \
	&& mkdir -p /var/run/vsftpd/empty

COPY tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY conf/vsftpd.conf /etc/vsftpd.conf

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["ftp"]