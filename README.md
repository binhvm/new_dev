# Development environment

## Version

PHP 7.4.19  
Nginx 1.20.0  
MySQL 8.0  
Redis 6.0.5

## Repository

### [API](https://gitlab.impl.co.jp/ecmt_jobmatch/jobmatch_api)
### [API Document](https://gitlab.impl.co.jp/ecmt_jobmatch/jobmatch_doc)
### [Shop](https://gitlab.impl.co.jp/ecmt_jobmatch/jobmatch_shop)
### [Admin](https://gitlab.impl.co.jp/ecmt_jobmatch/jobmatch_admin)

## Environment

1. Make sure you can use the Docker command and Make command.
1. `git clone https://gitlab.impl.co.jp/ecmt_jobmatch/jobmatch_dev.git`
1. `cd jobmatch_dev`
1. `make init`

## Corresponding port for each repository

|URL|Repository||
|---|---|---|
|http://localhost:8080|jobmatch_api|API|
|http://localhost:8081|jobmatch_shop|Shop|
|http://localhost:8082|jobmatch_admin|Admin|

## Instructions

Put it inside the php container with `make bash`.  
Each repository is in `/var/www` and migration files are managed by admin.

・Create test data  
`php artisan migrate:refresh`  
`php artisan db:seed --class=TestDataSeeder`

・DB for unit test (db_test)   
`php artisan migrate:refresh --env=testing`  
・Run unit test  
`php artisan test`
