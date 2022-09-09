up:
	docker-compose -p grupo_central_server -f $(env).yml up -d
build:
	docker-compose -p grupo_central_server -f $(env).yml up -d --build
down:
	docker-compose -p grupo_central_server -f $(env).yml down -v
start:
	docker-compose -p grupo_central_server -f $(env).yml start
stop:
	docker-compose -p grupo_central_server -f $(env).yml stop
restart:
	docker-compose -p grupo_central_server -f $(env).yml restart $(service)
recreate:
	docker-compose -p grupo_central_server -f $(env).yml up -d --force-recreate django
rebuild:
	docker-compose -p grupo_central_server -f $(env).yml down -v && docker-compose -p grupo_central_server -f $(env).yml up -d --build
	docker-compose -p grupo_central_server -f $(env).yml exec django mypy grupo_central_server -v
migrate:
	docker-compose -p grupo_central_server -f $(env).yml exec django python manage.py migrate
makemigrations:
	docker-compose -p grupo_central_server -f $(env).yml exec django python manage.py makemigrations
createsuperuser:
	docker-compose -p grupo_central_server -f $(env).yml exec django python manage.py createsuperuser