build:
	docker-compose -f docker-compose.yml build app

build-dev:
# by default, docker-compose will merge main and override files
	docker-compose build app

push: build
	docker-compose -f docker-compose.yml push app

run:
	docker-compose -f docker-compose.yml up

run-dev: build-dev
# by default, docker-compose will merge main and override files
	docker-compose up

ci: 
	[ ! -f .env ] && cp .env.example .env || true
	docker-compose --env-file .env -f docker-compose.yml up --abort-on-container-exit
#	rm .env