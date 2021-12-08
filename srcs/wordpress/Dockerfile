FROM alpine:3.11.7

# install stuff
RUN apk update
RUN apk add nginx supervisor libc6-compat php7 php7-mysqli php7-mbstring php7-fpm php7-curl php7-session php7-json php7-zlib

# nginx
RUN mkdir -p /run/nginx
RUN chmod 777 /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# wp
RUN mkdir -p /www/
WORKDIR /www
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz
RUN rm latest.tar.gz
WORKDIR /
COPY wp-config.php /www/wordpress
EXPOSE 5050

# supevisord
COPY supervisord.conf /etc/

# telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
COPY telegraf.conf /etc/telegraf/
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

CMD supervisord -c /etc/supervisord.conf