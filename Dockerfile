# run adminer on apache
FROM php:apache
WORKDIR /var/www/html
ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php ./index.php
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && docker-php-ext-install pdo pdo_pgsql pgsql && chmod 755 /var/www/html/index.php
EXPOSE 80
