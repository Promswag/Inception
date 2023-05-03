all:
	mkdir -p /home/gbaumgar/data/wp
	mkdir -p /home/gbaumgar/data/db
	docker compose up -d --build

down:
	docker compose down -v

clean: down
	docker volume prune --force

fclean:
	rm -rf /home/gbaumgar/data
	docker system prune --force --volumes
