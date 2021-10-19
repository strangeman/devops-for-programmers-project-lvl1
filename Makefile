build:
	docker-compose -f docker-compose.yml build app

build-dev:
	# todo: add build from local dockerfile

push: build
	docker-compose -f docker-compose.yml push app

run:
	# todo: add run production docker-compose

run-dev: build-dev
	# todo: add run development docker-compose

test: 
	cp .env.example .env
	docker-compose -f docker-compose.yml up --abort-on-container-exit
	rm .env

ci: test