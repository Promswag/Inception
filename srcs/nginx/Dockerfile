FROM debian:bullseye

RUN \
	apt-get update \
	&& apt-get install -y nginx

COPY nginx.conf /etc/nginx/
COPY gbaumgar.42.fr.crt /etc/nginx/gbaumgar.42.fr.crt
COPY gbaumgar.42.fr.key /etc/nginx/gbaumgar.42.fr.key

# RUN \
# 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# 	-keyout gbaumgar.42.fr.key \
# 	-out gbaumgar.42.fr.crt \
# 	-subj "/CN=gbaumgar.42.fr"

CMD ["nginx", "-g", "daemon off;"]