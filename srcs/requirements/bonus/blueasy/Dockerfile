FROM debian:buster

COPY www /blueasy
COPY tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY conf/blueasy_nginx.conf /blueasy_nginx.conf

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["blueasy"]