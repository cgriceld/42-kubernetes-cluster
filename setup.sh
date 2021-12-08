#!/bin/bash

# stop previous instance
minikube stop ; minikube delete

# launch new
minikube start --vm-driver=virtualbox --disk-size="7000mb" --memory="3000mb"
eval $(minikube docker-env)

# set up metallb
minikube addons enable metallb
kubectl apply -f ./srcs/metallb.yaml

# set up services

docker build -t nginx_img ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

docker build -t pma_img ./srcs/pma
kubectl apply -f ./srcs/pma/pma.yaml

docker build -t wp_img ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wp.yaml

docker build -t mysql_img ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

docker build -t ftps_img ./srcs/ftps
kubectl apply -f ./srcs/ftps/ftps.yaml

docker build -t grafana_img ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml

docker build -t influxdb_img ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml

# open dashboard in browser
minikube dashboard