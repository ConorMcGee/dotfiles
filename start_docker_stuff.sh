#!/bin/bash -e
docker run -d --net=host --name mysql -v /var/lib/mysql:/var/lib/mysql mysql:5.7.11 
docker run -d --net=host --name redis redis
docker run -d --net=host --name rabbitmq rabbitmq
docker run -d --net=host --name websockets px_websockets
