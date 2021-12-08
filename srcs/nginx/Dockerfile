FROM alpine:3.11.7

# install stuff
RUN apk update
RUN apk add bash vim nginx openssl openssh supervisor libc6-compat

# ssl
RUN openssl req -x509 -nodes -newkey rsa:2048 -days 30 -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=ru/ST=Moscow/L=Moscow/O=school21/OU=6thwave/CN=localhost/"
EXPOSE 80 443

# ssh
RUN adduser -D -g 'www' www
RUN echo "www:pass" | chpasswd
RUN ssh-keygen -A
EXPOSE 22

# nginx
RUN mkdir -p /run/nginx /www
RUN chmod 777 /run/nginx
RUN chown -R www:www /www /var/lib/nginx
COPY index.html /www/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# supevisord
COPY supervisord.conf /etc/

# telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
COPY telegraf.conf /etc/telegraf/
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

CMD supervisord -c /etc/supervisord.conf