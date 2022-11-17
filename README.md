## Summary:
The template contains environments for development and production.
Dependencies:
- Python 3.10.8
- Django 4.1.3
- PostgreSQL 13.9
- Gunicorn 20.1.0
- Nginx 1.23
- Docker 20.10.21
## Quickstart:
Make sure you have [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.

Clone this repository and open the downloaded folder.
___

To launch the development environment:
```
docker compose up -d --build
```
---
To launch the production environment:
```sh
cp .env.dev .env.prod && cp .env.dev.db .env.prod.db
```
- configure ***.env.prod*** and ***.env.prod.db*** files
```
docker compose -f docker-compose.prod.yml up -d --build \
&& docker compose -f docker-compose.prod.yml exec web python manage.py migrate --no-input \
&& docker compose -f docker-compose.prod.yml exec web python manage.py collectstatic --no-input --clear
```

---
You can rename the initial ***books*** project and change all the files that depend on its name with this script:
```sh
./rename.sh books {new_project_name}
```