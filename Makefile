prepare-env:
	cp -n .env.example .env || true

build:
	docker-compose -f docker-compose.yml build app

build-dev:
# by default, docker-compose will merge main and override files
	docker-compose build app

push: build
	docker-compose -f docker-compose.yml push app

run: prepare-env
	docker-compose -f docker-compose.yml up

run-dev: prepare-env build-dev
# by default, docker-compose will merge main and override files
	docker-compose up

ci: prepare-env
	docker-compose -f docker-compose.yml up --abort-on-container-exit
	rm .env