init:
	git clone -b develop https://gitlab.impl.co.jp/ecmt_jobmatch/jobmatch_api.git workspace/jobmatch_api
	git clone -b develop https://gitlab.impl.co.jp/ecmt_jobmatch/jobmatch_admin.git workspace/jobmatch_admin
	git clone -b develop https://gitlab.impl.co.jp/ecmt_jobmatch/jobmatch_shop.git workspace/jobmatch_shop
	@make build
	docker compose exec --user 1000 php-fpm sh init.sh

start:
	docker compose up -d

stop:
	docker compose stop

restart:
	@make stop
	@make start

build:
	docker compose up -d --build

rebuild:
	@make remove
	@make build

no-cache:
	docker compose build --no-cache --force-rm

remove:
	docker compose rm -s -v

bash:
	docker exec -it --user 1000 php-fpm bash

mysql:
	docker exec -it mysql bash -c 'mysql -u root -p$$MYSQL_ROOT_PASSWORD'

web:
	docker exec -it nginx bash

logs:
	docker compose logs -f
