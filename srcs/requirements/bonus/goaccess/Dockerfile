FROM debian:buster

RUN \
	apt-get update \
	&& apt-get install -y \
	wget \
	gpg \
	lsb-release \
	cron \
	# https://goaccess.io/download
	&& wget -O - https://deb.goaccess.io/gnugpg.key | gpg --dearmor | tee /usr/share/keyrings/goaccess.gpg >/dev/null \
	&& echo "deb [signed-by=/usr/share/keyrings/goaccess.gpg arch=$(dpkg --print-architecture)] https://deb.goaccess.io/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/goaccess.list \
	&& apt-get install -y goaccess

COPY tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY conf/goaccess_nginx.conf /goaccess_nginx.conf

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["goaccess"]