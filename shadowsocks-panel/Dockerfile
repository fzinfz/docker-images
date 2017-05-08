FROM richarvey/nginx-php-fpm:php5
MAINTAINER Ferro Fang <fzinfz@gmail.com>

# RUN git clone https://github.com/sendya/shadowsocks-panel.git /shadowsocks-panel

ADD https://github.com/sendya/shadowsocks-panel/archive/sspanel-v1.2.0.B.zip  shadowsocks-panel.zip
RUN unzip shadowsocks-panel.zip && mv shadowsocks-panel-sspanel-v1.2.0.B  /shadowsocks-panel 
ADD https://github.com/sendya/shadowsocks-panel/releases/download/sspanel-v1.2.0.B/Resource.zip .
RUN unzip -o -d /shadowsocks-panel/Resource Resource.zip

WORKDIR /shadowsocks-panel

RUN sed -i "s/\/var\/www\/html/\/shadowsocks-panel\/Public/" /etc/nginx/sites-enabled/default.conf

RUN mv ./Data/Config.simple.php ./Data/Config.php && \
    sed -i "s/localhost/mysql/" ./Data/Config.php && \
    sed -i "s/dbname=sspanel/dbname=shadowsocks-panel/" ./Data/Config.php && \
    sed -i "s/password//" ./Data/Config.php && \
    chmod -R 777 ./Data/ 

RUN curl -sS https://getcomposer.org/installer | php && \
    php composer.phar  install
RUN php composer.phar require robmorgan/phinx
# RUN php index.php install
# TODO: edit Data/Config.php
# many boken links, abort
