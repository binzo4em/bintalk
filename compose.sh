#!/bin/bash
sudo chown -R jeongbin mariadb/mariadb_data
docker-compose down --rmi all
docker-compose up --build
