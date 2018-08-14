.DEFAULT_GOAL := start

start:
	docker-compose build iwalkbionic
	docker-compose up -d

stop:
	docker-compose down

restart: stop start

prod-start:
	sudo docker-compose build iwalkbionic
	sudo docker-compose up -d

prod-stop:
	sudo docker-compose down

prod-restart: prod-stop prod-start
