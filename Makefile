.DEFAULT_GOAL := start

start:
	docker-compose build iwalkbionic
	docker-compose up -d
	cp cron/iwalkbionic-health-check.sh /usr/local/bin/iwalkbionic-health-check.sh
	chmod 755 /usr/local/bin/iwalkbionic-health-check.sh
	cp cron/iwalkbionic-monitor-cronjob /etc/cron.d/iwalkbionic-monitor-cronjob
	chmod 644 /etc/cron.d/iwalkbionic-monitor-cronjob

stop:
	docker-compose down
	rm -f /etc/cron.d/iwalkbionic-monitor-cronjob
	rm -f /usr/local/bin/iwalkbionic-health-check.sh

restart: stop start

prod-start:
	sudo docker-compose build iwalkbionic
	sudo docker-compose up -d
	sudo cp cron/iwalkbionic-health-check.sh /usr/local/bin/iwalkbionic-health-check.sh
	sudo chmod 755 /usr/local/bin/iwalkbionic-health-check.sh
	sudo cp cron/iwalkbionic-monitor-cronjob /etc/cron.d/iwalkbionic-monitor-cronjob
	sudo chmod 644 /etc/cron.d/iwalkbionic-monitor-cronjob

prod-stop:
	sudo docker-compose down
	sudo rm -f /etc/cron.d/iwalkbionic-monitor-cronjob
	sudo rm -f /usr/local/bin/iwalkbionic-health-check.sh

prod-restart: prod-stop prod-start
