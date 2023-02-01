all:
	docker compose up -d --build

down:
	docker compose down -v

clean: down
	docker volume prune --force

fclean:
	docker system prune --force --volumes
