all: crt
	sudo mkdir -p /home/gbaumgar/data/wp
	sudo mkdir -p /home/gbaumgar/data/db
	docker compose --file srcs/docker-compose.yml up -d --build

crt:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout srcs/nginx/gbaumgar.42.fr.key \
	-out srcs/nginx/gbaumgar.42.fr.crt \
	-subj "/CN=gbaumgar.42.fr"

nocache:
	docker compose --file srcs/docker-compose.yml build --no-cache

down:
	docker compose --file srcs/docker-compose.yml down -v

clean: down
	docker volume prune --force

fclean: down
	sudo rm -rf /home/gbaumgar/data
	docker system prune --force --volumes
