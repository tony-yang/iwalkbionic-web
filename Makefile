.DEFAULT_GOAL := start

start:
	sudo docker-compose build iwalkbionic
	sudo docker-compose up -d

stop:
	sudo docker-compose down

restart: stop start
