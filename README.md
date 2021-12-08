# 42-kubernetes-cluster

42 system & network administration project.

The aim of the project was to build Kubernetes cluster with nginx, phpMyAdmin, WordPress, MySQL, Grafana, FTPS and Influxdb. Each service runs in a dedicated container.

* Load Balancer manages the external access to the services.
* Both phpMyAdmin and WordPress have their own nginx server and both are connected to MySQL database.
* WordPress website has administrator and several users.
* Nginx redurects to WordPress (/wordpress) and to phpMyAdmin (/phpmyadmin). Redirection to phpMyAdmin is done with reverse proxy. Nginx also redirects http requests to https. 
* Grafana collects metrics from all containers via telegraf and has dashboard per service.
