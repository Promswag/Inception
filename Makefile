DOCKER_COMPOSE = docker compose --file srcs/docker-compose.yml
DELETE_DATA = sudo rm -rf /home/gbaumgar/data

all: crt
	sudo mkdir -p /home/gbaumgar/data/wp
	sudo mkdir -p /home/gbaumgar/data/db
	sudo $(DOCKER_COMPOSE) up -d --build

crt:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout srcs/requirements/nginx/gbaumgar.42.fr.key \
	-out srcs/requirements/nginx/gbaumgar.42.fr.crt \
	-subj "/CN=gbaumgar.42.fr"

nocache:
	sudo $(DOCKER_COMPOSE) build --no-cache

down:
	sudo $(DOCKER_COMPOSE) down -v

clean: down
	$(DELETE_DATA)
	sudo docker volume prune --force

fclean: down
	$(DELETE_DATA)
	sudo docker system prune --force --volumes

re: fclean all
