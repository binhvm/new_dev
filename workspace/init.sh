#!/bin/sh

cd /var/www/html/jobmatch_api || exit
cp .env.example .env
composer install
npm i
php artisan storage:link
php artisan jwt:secret

cd /var/www/html/jobmatch_admin || exit
cp .env.example .env
composer install
npm i
php artisan migrate:refresh --seed
php artisan storage:link

cd /var/www/html/jobmatch_shop || exit
cp .env.example .env
npm i
composer install
php artisan storage:link
