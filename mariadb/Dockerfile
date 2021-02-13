FROM mariadb:10.4

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
    MYSQL_DATABASE=$MYSQL_DATABASE \
    MYSQL_USER=$MYSQL_USER \
    MYSQL_PASSWORD=$YSQL_PASSWORD

#COPY ./mariadb_data /var/lib/mysql
COPY ./sqls /docker-entrypoint-initdb.d/
COPY ./mariadb.cnf /etc/mysql/mariadb.cnf
#ADD ./mariadb.cnf /etc/mysql/mariadb.cnf