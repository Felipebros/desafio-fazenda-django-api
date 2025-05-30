bash:
	docker-compose exec django_web bash

run:
	python manage.py runserver 0.0.0.0:8000

run2:
	gunicorn --bind 0.0.0.0:8000 setup.wsgi

up:
	docker-compose up -d

stop:
	docker-compose stop --timeout 1

build2:
	docker-compose up --build

build:
	docker-compose up --build -d

dumpdata:
	docker-compose exec django_web python manage.py dumpdata --indent 4 > arquivo.json
