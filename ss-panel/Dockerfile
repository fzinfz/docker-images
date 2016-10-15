FROM richarvey/nginx-php-fpm:php5
# MAINTAINER Ferro Fang <fzinfz@gmail.com>

RUN git clone https://github.com/orvice/ss-panel.git 

WORKDIR  /ss-panel 

RUN curl -sS https://getcomposer.org/installer | php && \
    php composer.phar  install

RUN chmod -R 777 storage

RUN apk add --no-cache mysql-client     

RUN cp .env.example .env
COPY nginx-default.conf /etc/nginx/sites-enabled/default.conf
