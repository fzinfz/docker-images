FROM php:5-apache
RUN docker-php-ext-install sockets

ENV WORK_DIR=/var/www/html

ADD https://raw.githubusercontent.com/stevermeister/f0ck_php/master/fm.php $WORK_DIR/index.php

RUN chown www-data:www-data *

# bug: some files cannot be uploaded
