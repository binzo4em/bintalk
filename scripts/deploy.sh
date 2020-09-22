#!/bin/bash
cd /home/ec2-user/deploy

source ./env.sh

# login docker hub
echo "..."
echo -n -e "\033[33m[login docker hub]\n\n\033[0m"

echo "$DOCKER_HUB_PASSWORD" | docker login -u "$DOCKER_HUB_ID" --password-stdin

docker-compose down --rmi all
docker-compose up -d --build