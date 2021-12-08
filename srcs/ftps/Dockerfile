FROM alpine:3.12.3

RUN apk update
RUN apk add openssl supervisor libc6-compat vsftpd

# ssl
RUN openssl req -x509 -nodes -newkey rsa:2048 -days 30 -keyout /etc/vsftpd/ftps.key \
	-out /etc/vsftpd/ftps.crt -subj "/C=ru/ST=Moscow/L=Moscow/O=school21/OU=6thwave/CN=localhost/"

COPY vsftpd.conf /etc/vsftpd/
RUN adduser -D -g 'cgriceld' cgriceld
RUN echo "cgriceld:cgriceld" | chpasswd
RUN mkdir -p /var/ftp
EXPOSE 21 21000

# supevisord
COPY supervisord.conf /etc/

# telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
COPY telegraf.conf /etc/telegraf/
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

CMD supervisord -c /etc/supervisord.conf