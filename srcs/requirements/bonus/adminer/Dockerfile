FROM debian:buster

ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php /index.php

COPY tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY conf/adminer_nginx.conf /adminer_nginx.conf

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["adminer"]