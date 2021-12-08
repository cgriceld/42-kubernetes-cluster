FROM alpine:3.12.3

RUN apk update
RUN apk add supervisor libc6-compat

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.6.linux-amd64.tar.gz
RUN tar -xf grafana-enterprise-7.3.6.linux-amd64.tar.gz --strip-components=1 -C /
COPY grafana.db /data/
RUN rm grafana-enterprise-7.3.6.linux-amd64.tar.gz
EXPOSE 3000

# supevisord
COPY supervisord.conf /etc/

# telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
COPY telegraf.conf /etc/telegraf/
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

CMD supervisord -c /etc/supervisord.conf