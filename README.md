### Hexlet tests and linter status:
[![Actions Status](https://github.com/strangeman/devops-for-programmers-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/strangeman/devops-for-programmers-project-lvl1/actions)
[![Internal Test Status](https://github.com/strangeman/devops-for-programmers-project-lvl1/workflows/push/badge.svg)](https://github.com/strangeman/devops-for-programmers-project-lvl1/actions)
[![Docker](https://img.shields.io/docker/pulls/strangeman/devops-for-programmers-project-lvl1.svg?label=Docker%20Image&style=flat)](https://hub.docker.com/repository/docker/strangeman/devops-for-programmers-project-lvl1)

# DevOps for programmers project: lvl1 🎲 

## How to build and how to use:

All commands have shortcuts in `Makefile`:

* `make build` - build production image from `Dockerfile.production`
* `make build-dev` - build image for local development from `Dockerfile`
* `make push` - build production image from `Dockerfile.production` and push it to Docker Hub with `strangeman/devops-for-programmers-project-lvl1:latest` name
* `make run` - launch production docker-compose file
* `make run-dev` - launch  docker-compose file with overrides for local development
* `make ci` - prepare env (currently has no effect) and run tests
* `make test` - same as `make ci`

## Components

Application have three main components:

* Simple site, based on Fastify framework
* Caddy 2, as reverse-proxy
* Postgresql 14, as database engine

In production mode, there is no ports exposed.

In development mode, Caddy exposes 80 and 443 HTTP ports and Fastify exposes 8080 port, for debug purposes. Also, in development mode, Fastify uses code and node_modules from local disk instead of pre-built docker image.

## Configuration

All settings configured via `.env.example` file. There is known bug: parameters should be set directly in `.env.example` file instead of copying it to `.env`. This is caused by specific behaviour of `hexlet-check` CI pipeline.

## Docker image

Image hosted on Docker Hub, [here](https://hub.docker.com/repository/docker/strangeman/devops-for-programmers-project-lvl1).