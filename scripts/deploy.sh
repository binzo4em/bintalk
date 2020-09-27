#!/bin/bash
BACKEND_IMAGE=bintalk-backend
BACKEND_PORT=3000
FRONTEND_IMAGE=bintalk-frontend
FRONTEND_PORT=8080
NGINX_IMAGE=bintalk-nginx
NGINX_PORT=80
BACKUP_DIRECTORY=/home/ec2-user/backup
LOG_FILE=deploy-`date "+%Y%m%d"`.log
LOG_MESSAGE=""


# move direcotry
cd /home/ec2-user/deploy


# create log file
touch $LOG_FILE


# import environment value
source ./env.sh


# start logging
echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Start logging]" >> $LOG_FILE


# checking directory for backup
echo -n -e "\033[33m[Checking directory for backup]\n\n\033[0m"
if [ ! -d $BACKUP_DIRECTORY ]
then
    mkdir -p $BACKUP_DIRECTORY
    if [ -d $BACKUP_DIRECTORY ]
    then
	LOG_MESSAGE="$BACKUP_DIRECTORY has been created."
        echo -e "$LOG_MESSAGE \n"
    fi
else
    LOG_MESSAGE="$BACKUP_DIRECTORY exists."
    echo -e "$LOG_MESSAGE \n"
fi

echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Created directory for backup] $LOG_MESSAGE" >> $LOG_FILE


# backup previous docker images
echo -n -e "\033[33m[Backup previous docker images]\n\n\033[0m"

backend=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${BACKEND_PORT}"/ | awk /"${BACKEND_IMAGE}"/`
frontend=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${FRONTEND_PORT}"/ | awk /"${FRONTEND_NAME}"/`
nginx=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${NGINX_PORT}"/ | awk /"${NGINX_NAME}"/`

if [ "$backend" != "" ] && [ "$frontend" != "" ] && [ "$nginx" != "" ]
then
    rm -rf $BACKUP_DIRECTORY/*.tar
    timestamp=`date +%s`
    docker save -o $BACKEND_IMAGE-$timestamp.tar $DOCKER_HUB_ID/$BACKEND_IMAGE
    docker save -o $FRONTEND_IMAGE-$timestamp.tar $DOCKER_HUB_ID/$FRONTEND_IMAGE
    docker save -o $NGINX_IMAGE-$timestamp.tar $DOCKER_HUB_ID/$NGINX_IMAGE
    mv *.tar $BACKUP_DIRECTORY

    if [ -f $BACKUP_DIRECTORY/$BACKEND_IMAGE-$timestamp.tar ] && 
       [ -f $BACKUP_DIRECTORY/$FRONTEND_IMAGE-$timestamp.tar ] && 
       [ -f $BACKUP_DIRECTORY/$NGINX_IMAGE-$timestamp.tar ]
    then
        LOG_MESSAGE="Backup has been completed."
        echo -e "$LOG_MESSAGE \n"
    fi
else
    LOG_MESSAGE="Docker image not exists"
    echo -e "$LOG_MESSAGE \n"
fi

echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Backup previous docker images] $LOG_MESSAGE" >> $LOG_FILE


# login docker hub
echo -n -e "\033[33m[Login docker hub]\n\n\033[0m"

LOG_MESSAGE=`echo "$DOCKER_HUB_PASSWORD" | docker login -u "$DOCKER_HUB_ID" --password-stdin`
echo -e "$LOG_MESSAGE \n"

echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Login Docker Hub] $LOG_MESSAGE" >> $LOG_FILE


# delete previous docker images and containers
echo -n -e "\033[33m[Delete previous docker images and containers]\n\n\033[0m"

backend=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${BACKEND_PORT}"/ | awk /"${BACKEND_IMAGE}"/`
frontend=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${FRONTEND_PORT}"/ | awk /"${FRONTEND_NAME}"/`
nginx=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${NGINX_PORT}"/ | awk /"${NGINX_NAME}"/`

if [ "$backend" != "" ] && [ "$frontend" != "" ] && [ "$nginx" != "" ]
then
    docker-compose down --rmi all
    LOG_MESSAGE="Previous docker images and containers have been deleted."
    echo -e "$LOG_MESSAGE \n"
else
    LOG_MESSAGE="Docker image not exists"
    echo -e "$LOG_MESSAGE \n"
fi

echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Delete previous docker images and containers] $LOG_MESSAGE" >> $LOG_FILE


# docker-compose up
echo -n -e "\033[33m[Execute docker-compose]\n\n\033[0m"

backend=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${BACKEND_PORT}"/ | awk /"${BACKEND_IMAGE}"/`
frontend=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${FRONTEND_PORT}"/ | awk /"${FRONTEND_NAME}"/`
nginx=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${NGINX_PORT}"/ | awk /"${NGINX_NAME}"/`

if [ "$backend" = "" ] && [ "$frontend" = "" ] && [ "$nginx" = "" ]
then
    docker-compose up -d --build
    LOG_MESSAGE="New docker images and containers have been deployed."
    echo -e "$LOG_MESSAGE \n"
fi

echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Execute docker-compose] $LOG_MESSAGE" >> $LOG_FILE


# check service
echo -n -e "\033[33m[Checking service]\n\n\033[0m"

sleep 10s

result=`curl -s http://localhost`
if [ "$result" != "" ]
then
    LOG_MESSAGE="Service is OK."
    echo -e "$LOG_MESSAGE \n"
    echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Checking service] $LOG_MESSAGE" >> $LOG_FILE
    LOG_MESSAGE="Deployment has been completed."
    echo -e "$LOG_MESSAGE \n"
    echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Result] $LOG_MESSAGE" >> $LOG_FILE
    exit 0
fi


# restore
echo -n -e "\033[33m[Start restoring]\n\n\033[0m"
echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Start restoring]" >> $LOG_FILE

docker-compose down --rmi all

backend=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${BACKEND_PORT}"/ | awk /"${BACKEND_IMAGE}"/`
frontend=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${FRONTEND_PORT}"/ | awk /"${FRONTEND_NAME}"/`
nginx=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${NGINX_PORT}"/ | awk /"${NGINX_NAME}"/`

if [ "$backend" = "" ] && [ "$frontend" = "" ] && [ "$nginx" = "" ]
then
    backend=`docker images --format "{{.Repository}}" | awk /"${BACKEND_IMAGE}"/`
    frontend=`docker images --format "{{.Repository}}" | awk /"${FRONTEND_IMAGE}"/`
    nginx=`docker images --format "{{.Repository}}" | awk /"${NGINX_IMAGE}"/`

    if [ "$backend" = "" ] && [ "$frontend" = "" ] && [ "$nginx" = "" ]
    then
	LOG_MESSAGE="Docker images and containers have been deleted."
	echo -e "$LOG_MESSAGE \n"
        echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Delete current docker images and containers] $LOG_MESSAGE" >> $LOG_FILE

        if [ -f $BACKUP_DIRECTORY/$BACKEND_IMAGE-$timestamp.tar ] && 
           [ -f $BACKUP_DIRECTORY/$FRONTEND_IMAGE-$timestamp.tar ] && 
           [ -f $BACKUP_DIRECTORY/$NGINX_IMAGE-$timestamp.tar ]
        then
            docker load < $BACKUP_DIRECTORY/$BACKEND_IMAGE-$timestamp.tar
	    docker load < $BACKUP_DIRECTORY/$FRONTEND_IMAGE-$timestamp.tar
	    docker load < $BACKUP_DIRECTORY/$NGINX_IMAGE-$timestamp.tar
        fi
    fi
fi

backend=`docker images --format "{{.Repository}}" | awk /"${BACKEND_IMAGE}"/`
frontend=`docker images --format "{{.Repository}}" | awk /"${FRONTEND_IMAGE}"/`
nginx=`docker images --format "{{.Repository}}" | awk /"${NGINX_IMAGE}"/`

if [ "$backend" != "" ] && [ "$frontend" != "" ] && [ "$nginx" != "" ]
then
    docker-compose up -d --build
fi

sleep 5s

backend=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${BACKEND_PORT}"/ | awk /"${BACKEND_IMAGE}"/`
frontend=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${FRONTEND_PORT}"/ | awk /"${FRONTEND_NAME}"/`
nginx=`docker ps --format "{{.Ports}} {{.Names}}" | awk /"${NGINX_PORT}"/ | awk /"${NGINX_NAME}"/`

if [ "$backend" != "" ] && [ "$frontend" != "" ] && [ "$nginx" != "" ]
then
    LOG_MESSAGE="Previous docker images and containers have been restored."
    echo -e "$LOG_MESSAGE \n"
    echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Restore previous docker images and containers] $LOG_MESSAGE" >> $LOG_FILE


    echo -n -e "\033[33m[Checking service]\n\n\033[0m"

    result=`curl -s http://localhost`
    if [ "$result" != "" ]
    then
        LOG_MESSAGE="Service is OK."
        echo -e "$LOG_MESSAGE \n"
        echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Checking service] $LOG_MESSAGE" >> $LOG_FILE
        LOG_MESSAGE="Restore has been completed."
        echo -e "$LOG_MESSAGE \n"
        echo "[`date "+%Y-%m-%d %H:%M:%S"`] [Result] $LOG_MESSAGE" >> $LOG_FILE
        exit 0
    fi
fi

