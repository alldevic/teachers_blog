#!/usr/bin/make

include .env

SHELL = /bin/sh
CURRENT_UID := $(shell id -u):$(shell id -g)

export CURRENT_UID

up:
	docker-compose up -d
upb:
	docker-compose up -d --force-recreate --build
down:
	docker-compose down
sh:
	docker exec -it /tb_backend /bin/sh
migrations:
	docker exec -it /tb_backend python3 manage.py makemigrations
su:
	docker exec -it /tb_backend python3 manage.py createsuperuser
logs:
	docker logs /tb_backend -f
