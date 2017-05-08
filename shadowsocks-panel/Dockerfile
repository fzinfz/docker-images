FROM richarvey/nginx-php-fpm
MAINTAINER Ferro Fang <fzinfz@gmail.com>

RUN git clone https://github.com/sendya/shadowsocks-panel.git /shadowsocks-panel
RUN sed -i "s/\/var\/www\/html/\/shadowsocks-panel/" /etc/nginx/sites-enabled/default.conf
WORKDIR /shadowsocks-panel

RUN cp ./Data/Config.simple.php ./Data/Config.php && \
    sed -i "s/localhost/mysql/" ./Data/Config.php && \
    sed -i "s/dbname=sspanel/dbname=shadowsocks-panel/" ./Data/Config.php && \
    sed -i "s/password//" ./Data/Config.php && \
    chmod -R 777 ./Data/ 

RUN    php index.php install

