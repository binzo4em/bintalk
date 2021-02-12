#!/bin/bash
sudo chown -R jeongbin mariadb/mariadb_data
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -a -q)
#docker-compose down --rmi all
docker-compose -f docker-compose-prd.yml down --rmi all
docker-compose -f docker-compose-prd.yml up --build