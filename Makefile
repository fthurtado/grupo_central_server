up:
	docker-compose -p grupo_central_server -f local.yml up -d
build:
	docker-compose -p grupo_central_server -f local.yml up -d --build
down:
	docker-compose -p grupo_central_server -f local.yml down -v
start:
	docker-compose -p grupo_central_server -f local.yml start
stop:
	docker-compose -p grupo_central_server -f local.yml stop
recreate:
	docker-compose -p grupo_central_server -f local.yml up -d --force-recreate django
rebuild:
	docker-compose -p grupo_central_server -f local.yml down -v && docker-compose -p grupo_central_server -f local.yml up -d --build
	docker-compose -p grupo_central_server -f local.yml exec django mypy grupo_central_server -v
migrate:
	docker-compose -p grupo_central_server -f local.yml exec django python manage.py migrate
makemigrations:
	docker-compose -p grupo_central_server -f local.yml exec django python manage.py makemigrations
createsuperuser:
	docker-compose -p grupo_central_server -f local.yml exec django python manage.py createsuperuser