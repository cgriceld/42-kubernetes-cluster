FROM alpine:3.11.7

RUN apk update
RUN apk add openrc libc6-compat supervisor mysql mysql-client

# mysql
COPY my.cnf /etc/
COPY wordpress.sql .
EXPOSE 3306
COPY run.sh .
RUN chmod 777 run.sh

# supevisord
COPY supervisord.conf /etc/

# telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
COPY telegraf.conf /etc/telegraf/
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

CMD ["sh", "run.sh"]